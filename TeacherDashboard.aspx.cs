using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class TeacherDashboard : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCounts();
                LoadNotices();
                LoadReminders();
            }
        }

        private void LoadCounts()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                lblTeacherCount.Text = new SqlCommand("SELECT COUNT(*) FROM Teacher", con).ExecuteScalar().ToString();
                lblStudentCount.Text = new SqlCommand("SELECT COUNT(*) FROM Student", con).ExecuteScalar().ToString();
                lblNotesCount.Text = new SqlCommand("SELECT COUNT(*) FROM Notes", con).ExecuteScalar().ToString();
                lblNoticesCount.Text = new SqlCommand("SELECT COUNT(*) FROM Notices", con).ExecuteScalar().ToString();
            }
        }

        private void LoadNotices()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT TOP 5 Title, Date, Sender FROM Notices ORDER BY Date DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvNotices.DataSource = dt;
                gvNotices.DataBind();
            }
        }

        private void LoadReminders()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT ReminderId, Message FROM Reminders WHERE CreatedBy = @CreatedBy ORDER BY ReminderDate ASC";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CreatedBy", Session["TeacherName"] ?? "Teacher");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptReminders.DataSource = dt;
                rptReminders.DataBind();
            }
        }

        protected void rptReminders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteReminder")
            {
                int reminderId = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM Reminders WHERE ReminderId = @ReminderId", con);
                    cmd.Parameters.AddWithValue("@ReminderId", reminderId);
                    cmd.ExecuteNonQuery();
                }
                LoadReminders();
            }
        }

        protected void btnAddReminder_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtReminder.Text))
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Reminders (Message, ReminderDate, CreatedBy) VALUES (@Message, @Date, @CreatedBy)", con);
                    cmd.Parameters.AddWithValue("@Message", txtReminder.Text.Trim());
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now); // or let user pick from calendar
                    cmd.Parameters.AddWithValue("@CreatedBy", Session["TeacherName"] ?? "Teacher");
                    cmd.ExecuteNonQuery();
                }

                txtReminder.Text = ""; // clear box
                LoadReminders();       // refresh UI
            }
        }
    }
}
