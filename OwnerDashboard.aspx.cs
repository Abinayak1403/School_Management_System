using System;
using System.Data.SqlClient;
using System.Configuration;
namespace YourNamespace
{



    public partial class OwnerDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                // Option 1: Just redirect
                Response.Redirect("Login.aspx");
                

                // OR Option 2: If you want to debug, do this instead:
                // Response.Write("Session expired or not set.");
                // Response.End(); // But this will stop execution
            }
            else
            {
                // Optional: Confirm session is set (for testing)
                Response.Write("Welcome, " + Session["Username"]);
            }
        }



        public string GetCount(string tableName)
        {
            string count = "0";
            string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

            // SAFELY build SQL command with table name (avoid SQL injection)
            string query = $"SELECT COUNT(*) FROM [{tableName}]";

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                count = cmd.ExecuteScalar().ToString();
            }

            return count;
        }
    }
}