using System;
using System.Configuration;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class ChangePassword1 : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string currentPassword = txtCurrent.Text.Trim();
            string newPassword = txtNew.Text.Trim();
            string confirmPassword = txtConfirm.Text.Trim();

            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "New password and confirm password do not match.";
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                // Verify current password
                string checkQuery = "SELECT COUNT(*) FROM Owner WHERE Username = @Username AND Password = @Password";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@Username", Session["Username"]);
                checkCmd.Parameters.AddWithValue("@Password", currentPassword);

                int count = (int)checkCmd.ExecuteScalar();

                if (count == 1)
                {
                    // Update new password
                    string updateQuery = "UPDATE Owner SET Password = @NewPassword WHERE Username = @Username";
                    SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                    updateCmd.Parameters.AddWithValue("@NewPassword", newPassword);
                    updateCmd.Parameters.AddWithValue("@Username", Session["Username"]);

                    updateCmd.ExecuteNonQuery();

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Password updated successfully!";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Current password is incorrect!";
                }
            }
        }
    }
}
