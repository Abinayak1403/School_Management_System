using System;
using System.Configuration;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class AddNotice : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTitle.Text) ||  string.IsNullOrWhiteSpace(txtDate.Text))
            {
                lblStatus.Text = "Please fill in all fields.";
                lblStatus.CssClass = "text-danger fw-bold";
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Notices (Title, Date, Sender) VALUES (@Title, @Date, @Sender)", con);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                
                cmd.Parameters.AddWithValue("@Date", Convert.ToDateTime(txtDate.Text));
                cmd.Parameters.AddWithValue("@Sender", "Admin");

                con.Open();
                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    lblStatus.Text = "✅ Notice added successfully!";
                    txtTitle.Text = "";
                    
                    txtDate.Text = "";
                }
                else
                {
                    lblStatus.Text = "❌ Failed to add notice.";
                    lblStatus.CssClass = "text-danger fw-bold";
                }
            }
        }
    }
}
