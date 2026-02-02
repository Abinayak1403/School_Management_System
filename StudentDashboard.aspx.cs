using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;
        public int PresentCount = 0;
        public int AbsentCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string studentId = Session["StudentId"]?.ToString();
                if (string.IsNullOrEmpty(studentId))
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                LoadStudentInfo(studentId);
                LoadAttendance(studentId);
                InjectChartScript();
                LoadNotices();
                LoadSyllabus();
            }
        }

        private void LoadStudentInfo(string studentId)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Student WHERE StudentId = @Id", con);
                cmd.Parameters.AddWithValue("@Id", studentId);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblStudentId.Text = reader["StudentId"].ToString();
                    lblClass.Text = reader["RollNo"].ToString(); // or use ClassName if exists
                    lblDOB.Text = Convert.ToDateTime(reader["DOB"]).ToString("dd-MM-yyyy");
                    lblContact.Text = reader["Mobile"].ToString();
                    lblEmail.Text = "student@gmail.com"; // use real field if exists
                    lblAddress.Text = reader["Address"].ToString();
                }
            }
        }
       


        private void LoadAttendance(string studentId)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT Status, COUNT(*) AS Count FROM StudentAttendance WHERE RollNo = @RollNo GROUP BY Status", con);
                cmd.Parameters.AddWithValue("@RollNo", studentId); // make sure RollNo is StudentId or map properly
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string status = reader["Status"].ToString().ToLower();
                    if (status == "present") PresentCount = Convert.ToInt32(reader["Count"]);
                    else if (status == "absent") AbsentCount = Convert.ToInt32(reader["Count"]);
                }
            }
            
         
        }
        private void InjectChartScript()
        {
            string script = $@"
        window.onload = function() {{
            const ctx = document.getElementById('attendanceChart').getContext('2d');
            new Chart(ctx, {{
                type: 'pie',
                data: {{
                    labels: ['Present', 'Absent'],
                    datasets: [{{
                        data: [{PresentCount}, {AbsentCount}],
                        backgroundColor: ['#4CAF50', '#F44336'],
                    }}]
                }},
                options: {{
                    responsive: true,
                    plugins: {{
                        legend: {{
                            position: 'bottom'
                        }}
                    }}
                }}
            }});
        }};";

            ClientScript.RegisterStartupScript(this.GetType(), "pieChart", script, true);
        }




        private void LoadNotices()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 5 Title, Date, Sender  FROM Notices ORDER BY Date DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptNotices.DataSource = dt;
                rptNotices.DataBind();
            }
        }

        private void LoadSyllabus()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT SubjectId, FilePath FROM Syllabus", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptSyllabus.DataSource = dt;
                rptSyllabus.DataBind();
            }
        }
    }
}
