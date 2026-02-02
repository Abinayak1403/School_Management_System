using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace SchoolManagementSystem
{


    public partial class AdminLeaveRequests : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLeaveRequests();
            }
        }

        private void LoadLeaveRequests()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Leaves";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {
                int leaveId = Convert.ToInt32(e.CommandArgument);
                string newStatus = (e.CommandName == "Approve") ? "Approved" : "Rejected";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Leaves SET Status = @Status WHERE LeaveId = @LeaveId";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Status", newStatus);
                    cmd.Parameters.AddWithValue("@LeaveId", leaveId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadLeaveRequests(); // Refresh Grid
            }
        }
    }
}
