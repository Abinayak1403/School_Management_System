using System;
using System.Configuration;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class AddTeacher : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtDOB.Text) ||
                ddlGender.SelectedIndex == 0 ||
                string.IsNullOrWhiteSpace(txtMobile.Text) ||
                string.IsNullOrWhiteSpace(txtAddress.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblMessage.Text = "Please fill all fields.";
                lblMessage.CssClass = "text-danger";
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "INSERT INTO Teacher (Name, DOB, Gender, Mobile, Address, Password) " +
                               "VALUES (@Name, @DOB, @Gender, @Mobile, @Address, @Password)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Teacher added successfully!";
                    lblMessage.CssClass = "text-success";
                    ClearForm();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
            }
        }

        private void ClearForm()
        {
            txtName.Text = "";
            txtDOB.Text = "";
            ddlGender.SelectedIndex = 0;
            txtMobile.Text = "";
            txtAddress.Text = "";
            txtPassword.Text = "";
        }
    }
}
