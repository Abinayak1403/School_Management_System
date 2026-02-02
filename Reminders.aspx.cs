using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class Reminders : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadReminders();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtMessage.Text) || string.IsNullOrWhiteSpace(txtDate.Text) || string.IsNullOrWhiteSpace(txtCreatedBy.Text))
            {
                lblMessage.Text = "⚠️ Please fill all fields.";
                lblMessage.CssClass = "text-danger";
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Reminders (Message, ReminderDate, CreatedBy) VALUES (@Message, @Date, @CreatedBy)", con);
                cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@CreatedBy", txtCreatedBy.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
                lblMessage.Text = "✅ Reminder added successfully!";
                lblMessage.CssClass = "text-success";

                txtMessage.Text = "";
                txtDate.Text = "";
                txtCreatedBy.Text = "";

                LoadReminders();
            }
        }

        private void LoadReminders()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Reminders ORDER BY ReminderDate DESC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvReminders.DataSource = dt;
                gvReminders.DataBind();
            }
        }
    }
}
