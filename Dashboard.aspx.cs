using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace YourNamespace
{
    public partial class Dashboard : Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUser.Text = "Welcome, Admin";

                // Apply dark mode if previously selected
                if (Session["DarkMode"] != null && (bool)Session["DarkMode"])
                {
                    body.Attributes["class"] = "dark-mode";
                }

                LoadCounts();
                LoadNotices();
                LoadReminderCount();
            }
        }

        protected void btnToggleDark_Click(object sender, EventArgs e)
        {
            if (Session["DarkMode"] == null)
                Session["DarkMode"] = true;
            else
                Session["DarkMode"] = !(bool)Session["DarkMode"];

            Response.Redirect(Request.RawUrl);
        }

        private void LoadCounts()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                SqlCommand cmdTeacher = new SqlCommand("SELECT COUNT(*) FROM Teacher", con);
                lblTeacherCount.Text = cmdTeacher.ExecuteScalar().ToString();

                SqlCommand cmdStudent = new SqlCommand("SELECT COUNT(*) FROM Student", con);
                lblStudentCount.Text = cmdStudent.ExecuteScalar().ToString();

                SqlCommand cmdSubject = new SqlCommand("SELECT COUNT(*) FROM Subject", con);
                lblSubjectCount.Text = cmdSubject.ExecuteScalar().ToString();

                SqlCommand cmdNotices = new SqlCommand("SELECT COUNT(*) FROM Notices", con);
                lblNoticeCount.Text = cmdNotices.ExecuteScalar().ToString();
            }
        }

        private void LoadNotices()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT TOP 5 Title, Date, Sender FROM Notices ORDER BY Date DESC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvNotices.DataSource = dt;
                gvNotices.DataBind();
            }
        }

        private void LoadReminderCount()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Reminders", con);
                con.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                lblReminderCount.Text = count.ToString();
            }
        }
    }
}
