using System;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class GiveFeedback : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
            }
        }

        private void LoadStudents()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT StudentId, Name FROM Student", con);
                SqlDataReader reader = cmd.ExecuteReader();

                ddlStudent.DataSource = reader;
                ddlStudent.DataTextField = "Name";
                ddlStudent.DataValueField = "StudentId";
                ddlStudent.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlStudent.SelectedValue == "" || string.IsNullOrWhiteSpace(txtFeedback.Text))
            {
                lblMessage.Text = "Please select a student and enter feedback.";
                lblMessage.CssClass = "text-danger";
                lblMessage.Visible = true;
                return;
            }

            string feedback = txtFeedback.Text.Trim();
            int studentId = int.Parse(ddlStudent.SelectedValue);
            string givenBy = Session["Username"]?.ToString() ?? "Admin"; // Or use Teacher name if available

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO StudentFeedback (StudentId, GivenBy, FeedbackText) VALUES (@StudentId, @GivenBy, @FeedbackText)", con);
                cmd.Parameters.AddWithValue("@StudentId", studentId);
                cmd.Parameters.AddWithValue("@GivenBy", givenBy);
                cmd.Parameters.AddWithValue("@FeedbackText", feedback);

                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "✅ Feedback submitted successfully!";
            lblMessage.CssClass = "text-success";
            lblMessage.Visible = true;
            txtFeedback.Text = "";
            ddlStudent.SelectedIndex = 0;
        }
    }
}
