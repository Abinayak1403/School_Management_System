using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace YourNamespace
{
    public partial class Notes : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClasses();
                LoadSubjects();
                LoadNotes();
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileNote.HasFile && ddlClass.SelectedValue != "" && ddlSubject.SelectedValue != "")
            {
                string folderPath = Server.MapPath("~/Uploads/Notes/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fileNote.FileName);
                string filePath = "~/Uploads/Notes/" + fileName;
                fileNote.SaveAs(Server.MapPath(filePath));

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Notes (ClassId, SubjectId, Title, FilePath, UploadDate) VALUES (@ClassId, @SubjectId, @Title, @FilePath, @UploadDate)", con);
                    cmd.Parameters.AddWithValue("@ClassId", ddlClass.SelectedValue);
                    cmd.Parameters.AddWithValue("@SubjectId", ddlSubject.SelectedValue);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@FilePath", filePath);
                    cmd.Parameters.AddWithValue("@UploadDate", DateTime.Now);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "Note uploaded successfully!";
                lblMessage.CssClass = "text-success";
                LoadNotes();
            }
            else
            {
                lblMessage.Text = "Please fill all fields and select a file.";
                lblMessage.CssClass = "text-danger";
            }
        }

        private void LoadNotes()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT NoteId, Title, FilePath, UploadDate FROM Notes ORDER BY UploadDate DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvNotes.DataSource = dt;
                gvNotes.DataBind();
            }
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            var lnk = (System.Web.UI.WebControls.LinkButton)sender;
            string noteId = lnk.CommandArgument;

            string filePath = "";
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand getFileCmd = new SqlCommand("SELECT FilePath FROM Notes WHERE NoteId = @NoteId", con);
                getFileCmd.Parameters.AddWithValue("@NoteId", noteId);
                con.Open();
                filePath = getFileCmd.ExecuteScalar()?.ToString();
            }

            if (!string.IsNullOrEmpty(filePath))
            {
                string fullPath = Server.MapPath(filePath);
                if (File.Exists(fullPath))
                    File.Delete(fullPath);
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Notes WHERE NoteId = @NoteId", con);
                cmd.Parameters.AddWithValue("@NoteId", noteId);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "Note deleted successfully!";
            lblMessage.CssClass = "text-success";
            LoadNotes();
        }
    }
}
