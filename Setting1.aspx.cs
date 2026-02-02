using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace YourNamespace
{
    public partial class TeacherSettings : Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTeacherProfile();
            }
        }

        private void LoadTeacherProfile()
        {
            if (Session["TeacherId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int teacherId = Convert.ToInt32(Session["TeacherId"]);

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Teacher WHERE TeacherId = @TeacherId", con);
                cmd.Parameters.AddWithValue("@TeacherId", teacherId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblUID.Text = reader["TeacherId"].ToString();
                    lblName.Text = reader["Name"].ToString();
                    lblDOB.Text = Convert.ToDateTime(reader["DOB"]).ToString("dd/MM/yyyy");
                    lblGender.Text = reader["Gender"].ToString();
                    lblPhone.Text = reader["Mobile"].ToString();
                    lblAddress.Text = reader["Address"].ToString();

                    // Prefill edit fields
                    txtName.Text = reader["Name"].ToString();
                    txtPhone.Text = reader["Mobile"].ToString();
                    txtAddress.Text = reader["Address"].ToString();
                }
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                string folder = Server.MapPath("~/ProfileImages/");
                if (!Directory.Exists(folder))
                    Directory.CreateDirectory(folder);

                string filename = Path.GetFileName(fileUpload.FileName);
                string savedPath = Path.Combine(folder, filename);
                fileUpload.SaveAs(savedPath);

                // Save in DB
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE Teacher SET ProfileImagePath = @Path WHERE TeacherId = @TeacherId", con);
                    cmd.Parameters.AddWithValue("@Path", "~/ProfileImages/" + filename);
                    cmd.Parameters.AddWithValue("@TeacherId", Convert.ToInt32(Session["TeacherId"]));
                    cmd.ExecuteNonQuery();
                }

                imgProfile.ImageUrl = "~/ProfileImages/" + filename;
                lblStatus.Text = "Image uploaded successfully!";
            }
            else
            {
                lblStatus.Text = "Please select a file.";
            }
        }


        protected void btnEdit_Click(object sender, EventArgs e)
        {
            pnlView.Visible = false;
            pnlEdit.Visible = true;
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            pnlView.Visible = true;
            pnlEdit.Visible = false;
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            int teacherId = Convert.ToInt32(Session["TeacherId"]);
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Teacher SET Name=@Name, Mobile=@Mobile, Address=@Address WHERE TeacherId=@TeacherId", con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@TeacherId", teacherId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblStatus.Text = "Profile updated successfully!";
            pnlEdit.Visible = false;
            pnlView.Visible = true;
            LoadTeacherProfile();
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            int teacherId = Convert.ToInt32(Session["TeacherId"]);
            string oldPass = txtOldPassword.Text.Trim();
            string newPass = txtNewPassword.Text.Trim();
            string confirmPass = txtConfirmPassword.Text.Trim();

            if (newPass != confirmPass)
            {
                lblStatus.Text = "New passwords do not match.";
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand check = new SqlCommand("SELECT COUNT(*) FROM Teacher WHERE TeacherId = @Id AND Password = @Old", con);
                check.Parameters.AddWithValue("@Id", teacherId);
                check.Parameters.AddWithValue("@Old", oldPass);
                con.Open();

                int count = Convert.ToInt32(check.ExecuteScalar());
                if (count == 1)
                {
                    SqlCommand update = new SqlCommand("UPDATE Teacher SET Password = @New WHERE TeacherId = @Id", con);
                    update.Parameters.AddWithValue("@New", newPass);
                    update.Parameters.AddWithValue("@Id", teacherId);
                    update.ExecuteNonQuery();
                    lblStatus.Text = "Password updated.";
                }
                else
                {
                    lblStatus.Text = "Incorrect old password.";
                }
            }
        }
    }
}
