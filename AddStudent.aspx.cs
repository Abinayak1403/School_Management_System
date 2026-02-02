// AddStudent.aspx.cs
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class AddStudent : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "" || txtDOB.Text == "" || ddlGender.SelectedIndex == 0 || txtMobile.Text == "" || txtRollNo.Text == "" || txtAddress.Text == "")
            {
                lblMessage.Text = "Please fill all the required fields!";
                lblMessage.CssClass = "text-danger fw-bold";
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "INSERT INTO Student (Name, DOB, Gender, Mobile, RollNo, Address) " +
                               "VALUES (@Name, @DOB, @Gender, @Mobile, @RollNo, @Address)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@RollNo", txtRollNo.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Student record added successfully!";
                    lblMessage.CssClass = "text-success fw-bold";
                    ClearForm();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.CssClass = "text-danger fw-bold";
                }
            }
        }

        private void ClearForm()
        {
            txtName.Text = "";
            txtDOB.Text = "";
            ddlGender.SelectedIndex = 0;
            txtMobile.Text = "";
            txtRollNo.Text = "";
            txtAddress.Text = "";
        }
    }
}
