using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;

namespace YourNamespace
{
    
    public partial class Login : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            List<User> users = LoadUsers();

            User matchedUser = users.FirstOrDefault(u =>
                u.Username.Equals(username, StringComparison.OrdinalIgnoreCase) &&
                u.Password == password);

            if (matchedUser != null)
            {
                Session["Role"] = matchedUser.Role;
                Session["Username"] = matchedUser.Username;

                switch (matchedUser.Role.ToLower())
                {
                    case "admin":
                        Response.Redirect("Dashboard.aspx");
                        break;

                    case "teacher":
                        Response.Redirect("TeacherDashboard.aspx");
                        break;

                    case "owner":
                        Response.Redirect("OwnerDashboard.aspx");
                        break;


                    case "student":
                        int studentId = GetStudentIdByUsername(matchedUser.Username);
                        if (studentId != -1)
                        {
                            Session["StudentId"] = studentId;
                            Response.Redirect("StudentDashboard.aspx");
                        }
                        else
                        {
                            lblError.Text = "Student not found in the database.";
                        }
                        break;

                    

                    default:
                        lblError.Text = "Invalid role specified.";
                        break;
                }
            }
            else
            {
                lblError.Text = "Invalid username or password!";
            }
        }

        private List<User> LoadUsers()
        {
            string filePath = Server.MapPath("App_Data/users.dat");

            if (!File.Exists(filePath))
                return new List<User>();

            using (FileStream fs = new FileStream(filePath, FileMode.Open))
            {
                BinaryFormatter formatter = new BinaryFormatter();
                return (List<User>)formatter.Deserialize(fs);
            }
        }

        private int GetStudentIdByUsername(string username)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT StudentId FROM Student WHERE Name = @Name";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", username);
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    return result != null ? Convert.ToInt32(result) : -1;
                }
            }
        }
    }
}

