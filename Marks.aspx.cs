using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace YourNamespace
{
    public partial class Marks : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSubjects();
                LoadStudents();
                LoadMarks();
            }
        }

        private void LoadStudents()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT StudentId, Name FROM Student", con);
                con.Open();
                ddlStudent.DataSource = cmd.ExecuteReader();
                ddlStudent.DataTextField = "Name";
                ddlStudent.DataValueField = "StudentId";
                ddlStudent.DataBind();
            }
            ddlStudent.Items.Insert(0, new ListItem("-- Select Student --", ""));
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
            ddlSubject.Items.Insert(0, new ListItem("-- Select Subject --", ""));
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ddlStudent.SelectedIndex == 0 || ddlSubject.SelectedIndex == 0 ||
                string.IsNullOrWhiteSpace(txtMarksObtained.Text) ||
                string.IsNullOrWhiteSpace(txtTotalMarks.Text) ||
                string.IsNullOrWhiteSpace(txtExamType.Text) ||
                string.IsNullOrWhiteSpace(txtExamDate.Text))
            {
                lblMessage.Text = "Please fill all the fields.";
                lblMessage.CssClass = "text-danger fw-bold";
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "INSERT INTO Marks (StudentId, SubjectId, MarksObtained, TotalMarks, ExamType, ExamDate) " +
                               "VALUES (@StudentId, @SubjectId, @MarksObtained, @TotalMarks, @ExamType, @ExamDate)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@StudentId", ddlStudent.SelectedValue);
                cmd.Parameters.AddWithValue("@SubjectId", ddlSubject.SelectedValue);
                cmd.Parameters.AddWithValue("@MarksObtained", txtMarksObtained.Text);
                cmd.Parameters.AddWithValue("@TotalMarks", txtTotalMarks.Text);
                cmd.Parameters.AddWithValue("@ExamType", txtExamType.Text);
                cmd.Parameters.AddWithValue("@ExamDate", txtExamDate.Text);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Marks saved successfully!";
                    lblMessage.CssClass = "text-success fw-bold";
                    LoadMarks();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.CssClass = "text-danger fw-bold";
                }
            }
        }

        private void LoadMarks()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT * FROM Marks ORDER BY ExamDate DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvMarks.DataSource = dt;
                gvMarks.DataBind();
            }
        }
    }
}
