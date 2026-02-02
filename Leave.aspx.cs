using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class Leave : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TeacherId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    LoadLeaves();
                }
            }
        }

        protected void btnSubmitLeave_Click(object sender, EventArgs e)
        {
            if (Session["TeacherId"] == null) return;

            string leaveDate = txtLeaveDate.Text.Trim();
            string reason = txtLeaveReason.Text.Trim();

            if (!string.IsNullOrEmpty(leaveDate) && !string.IsNullOrEmpty(reason))
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Leaves (TeacherId, LeaveDate, Reason, Status) VALUES (@TeacherId, @LeaveDate, @Reason, 'Pending')", con);
                    cmd.Parameters.AddWithValue("@TeacherId", Session["TeacherId"]);
                    cmd.Parameters.AddWithValue("@LeaveDate", Convert.ToDateTime(leaveDate));
                    cmd.Parameters.AddWithValue("@Reason", reason);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                txtLeaveDate.Text = "";
                txtLeaveReason.Text = "";
                LoadLeaves();
            }
        }

        private void LoadLeaves()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT LeaveDate, Reason, Status FROM Leaves WHERE TeacherId = @TeacherId ORDER BY LeaveDate DESC", con);
                cmd.Parameters.AddWithValue("@TeacherId", Session["TeacherId"]);
                string teacherId = Session["TeacherId"].ToString();


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvLeaves.DataSource = dt;
                gvLeaves.DataBind();
            }
        }
    }
}
