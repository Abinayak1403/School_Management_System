using System;
using System.Configuration;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["UserRole"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            string username = Session["Username"].ToString();
            string role = Session["UserRole"].ToString();
            string current = txtCurrent.Text.Trim();
            string newPass = txtNew.Text.Trim();
            string confirm = txtConfirm.Text.Trim();

            if (newPass != confirm)
            {
                lblMessage.Text = "⚠️ New and Confirm password do not match.";
                lblMessage.CssClass += " text-danger";
                return;
            }

            string table = (role == "Student") ? "Student" : "Teacher";

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                // Verify current password
                string checkQuery = $"SELECT COUNT(*) FROM {table} WHERE Name=@Username AND Password=@Current";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@Username", username);
                checkCmd.Parameters.AddWithValue("@Current", current);

                int exists = (int)checkCmd.ExecuteScalar();
                if (exists == 0)
                {
                    lblMessage.Text = "❌ Current password is incorrect.";
                    lblMessage.CssClass += " text-danger";
                    return;
                }

                // Update password
                string updateQuery = $"UPDATE {table} SET Password=@NewPass WHERE Name=@Username";
                SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                updateCmd.Parameters.AddWithValue("@NewPass", newPass);
                updateCmd.Parameters.AddWithValue("@Username", username);

                int rows = updateCmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    lblMessage.Text = "✅ Password changed successfully!";
                    lblMessage.CssClass += " text-success";
                }
                else
                {
                    lblMessage.Text = "⚠️ Something went wrong. Try again.";
                    lblMessage.CssClass += " text-danger";
                }
            }
        }
    }
}
