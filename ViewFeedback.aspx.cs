using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class StudentFeedback : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFeedback();
            }
        }

        private void LoadFeedback()
        {
            if (Session["StudentId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int studentId = Convert.ToInt32(Session["StudentId"]);

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT GivenBy, FeedbackText, SubmittedDate FROM StudentFeedback WHERE StudentId = @StudentId ORDER BY SubmittedDate DESC", con);
                cmd.Parameters.AddWithValue("@StudentId", studentId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptFeedback.DataSource = dt;
                rptFeedback.DataBind();
            }
        }
    }
}
