using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace YourNamespace
{
    public partial class Syllabus : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClasses();
                LoadSubjects();
                LoadSyllabus();
            }
        }

        private void LoadClasses()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT ClassId, ClassName FROM Class", con);
                con.Open();
                ddlClass.DataSource = cmd.ExecuteReader();
                ddlClass.DataTextField = "ClassName";
                ddlClass.DataValueField = "ClassId";
                ddlClass.DataBind();
            }
            ddlClass.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Class --", ""));
        }

        private void LoadSubjects()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT SubjectId, SubjectName FROM Subject", con);
                con.Open();
                ddlSubject.DataSource = cmd.ExecuteReader();
                ddlSubject.DataTextField = "SubjectName";
                ddlSubject.DataValueField = "SubjectId";
                ddlSubject.DataBind();
            }
            ddlSubject.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Subject --", ""));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlClass.SelectedValue == "" || ddlSubject.SelectedValue == "" ||
                string.IsNullOrWhiteSpace(txtTitle.Text) || string.IsNullOrWhiteSpace(txtDescription.Text) ||
                string.IsNullOrWhiteSpace(txtDate.Text) || !fileUpload.HasFile)
            {
                lblMessage.Text = "Please fill in all fields and upload a PDF file.";
                lblMessage.CssClass = "text-danger";
                return;
            }

            string ext = Path.GetExtension(fileUpload.FileName).ToLower();
            if (ext != ".pdf")
            {
                lblMessage.Text = "Only PDF files are allowed.";
                lblMessage.CssClass = "text-danger";
                return;
            }

            string folderPath = Server.MapPath("~/Uploads/Syllabus/");
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            string fileName = Guid.NewGuid().ToString() + ext;
            string fullPath = Path.Combine(folderPath, fileName);
            string filePath = "~/Uploads/Syllabus/" + fileName;

            try
            {
                fileUpload.SaveAs(fullPath);

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Syllabus (ClassId, SubjectId, SyllabusTitle, Description, UploadDate, FilePath) VALUES (@ClassId, @SubjectId, @Title, @Desc, @Date, @FilePath)", con);
                    cmd.Parameters.AddWithValue("@ClassId", ddlClass.SelectedValue);
                    cmd.Parameters.AddWithValue("@SubjectId", ddlSubject.SelectedValue);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Desc", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                    cmd.Parameters.AddWithValue("@FilePath", filePath);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Syllabus uploaded successfully!";
                    lblMessage.CssClass = "text-success";
                    ClearForm();
                    LoadSyllabus();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.CssClass = "text-danger";
            }
        }

        private void LoadSyllabus()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT SyllabusTitle, Description, UploadDate, FilePath FROM Syllabus ORDER BY UploadDate DESC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvSyllabus.DataSource = dt;
                gvSyllabus.DataBind();
            }
        }

        private void ClearForm()
        {
            ddlClass.SelectedIndex = 0;
            ddlSubject.SelectedIndex = 0;
            txtTitle.Text = "";
            txtDescription.Text = "";
            txtDate.Text = "";
        }
    }
}
