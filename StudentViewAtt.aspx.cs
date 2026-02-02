using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class StudentViewAtt : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblPresent.Text = "0";
                lblAbsent.Text = "0";
                lblPercentage.Text = "0% attendance overall";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string rollNo = txtStudentId.Text.Trim();
            DateTime selectedDate;

            if (string.IsNullOrEmpty(rollNo))
            {
                // Show a message or return
                return;
            }

            bool validDate = DateTime.TryParse(txtDate.Text, out selectedDate);

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                // SQL query with optional date filtering
                string query = "SELECT * FROM StudentAttendance WHERE RollNo = @RollNo";
                if (validDate)
                {
                    query += " AND CONVERT(date, Date) = @Date";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@RollNo", rollNo);
                if (validDate)
                    cmd.Parameters.AddWithValue("@Date", selectedDate.Date);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvAttendance.DataSource = dt;
                gvAttendance.DataBind();

                int present = 0, absent = 0;
                foreach (DataRow row in dt.Rows)
                {
                    string status = row["Status"].ToString();
                    if (status.Equals("Present", StringComparison.OrdinalIgnoreCase)) present++;
                    else if (status.Equals("Absent", StringComparison.OrdinalIgnoreCase)) absent++;
                }

                lblPresent.Text = present.ToString();
                lblAbsent.Text = absent.ToString();
                int total = present + absent;
                double percentage = total > 0 ? (double)present / total * 100 : 0;
                lblPercentage.Text = $"{percentage:0.0}% attendance overall";
            }
        }
    }
}
