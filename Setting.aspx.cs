using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace YourNamespace
{
    public partial class Settings : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAdminProfile();
                pnlEditProfile.Visible = false;
                pnlChangePassword.Visible = false;
            }
        }

        private void LoadAdminProfile()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 * FROM AdminProfile", con);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblUID.Text = reader["UID"].ToString();
                    lblName.Text = reader["Name"].ToString();
                    lblDOB.Text = Convert.ToDateTime(reader["BirthDate"]).ToString("dd/MM/yyyy");
                    lblEmail.Text = reader["Email"].ToString();
                    lblPhone.Text = reader["Phone"].ToString();
                    lblGender.Text = reader["Gender"].ToString();
                    lblAddress.Text = reader["Address"].ToString();
                    imgProfile.ImageUrl = reader["ProfileImagePath"].ToString();

                    // NO NEED to read password for display
                }
            }
        }

                    

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            pnlEditProfile.Visible = true;
            pnlChangePassword.Visible = false;
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE AdminProfile SET Name=@Name, Email=@Email, Phone=@Phone, Address=@Address", con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.ExecuteNonQuery();
            }
            lblMessage.Text = "Profile updated successfully.";
            LoadAdminProfile();
            pnlEditProfile.Visible = false;
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            pnlChangePassword.Visible = true;
            pnlEditProfile.Visible = false;
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            if (txtNewPassword.Text == txtConfirmPassword.Text)
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE AdminProfile SET PasswordHash = @Password WHERE UID = @UID", con);
                    cmd.Parameters.AddWithValue("@Password", txtNewPassword.Text); // optionally hash this
                    cmd.Parameters.AddWithValue("@UID", lblUID.Text); // assuming UID is a primary key label
                    cmd.ExecuteNonQuery();
                }
                lblMessage.Text = "Password changed successfully.";
                pnlChangePassword.Visible = false;
            }
            else
            {
                lblMessage.Text = "Passwords do not match.";
            }
        }


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                string folderPath = "~/ProfileImages/";
                string fileName = Path.GetFileName(fileUpload.FileName);
                string savePath = Server.MapPath(folderPath + fileName);
                fileUpload.SaveAs(savePath);

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE AdminProfile SET ProfileImagePath = @Path", con);
                    cmd.Parameters.AddWithValue("@Path", folderPath + fileName);
                    cmd.ExecuteNonQuery();
                }

                LoadAdminProfile();
                lblMessage.Text = "Profile image updated.";
            }
        }

    }
}
