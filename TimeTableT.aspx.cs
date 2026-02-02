using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class TeacherTimeTable : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TeacherId"] != null)
                {
                    int teacherId = Convert.ToInt32(Session["TeacherId"]);
                    LoadTimetable(teacherId);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadTimetable(int teacherId)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"
                SELECT 
                    ClassName,
                    (SELECT SubjectName FROM Subject WHERE SubjectId = tt.SubjectId) AS SubjectName,
                    DayOfWeek,
                    CONVERT(VARCHAR(5), StartTime, 108) AS StartTime,
                    CONVERT(VARCHAR(5), EndTime, 108) AS EndTime
                FROM TeacherTimeTable tt
                WHERE TeacherId = @TeacherId
                ORDER BY 
                    CASE 
                        WHEN DayOfWeek = 'Monday' THEN 1
                        WHEN DayOfWeek = 'Tuesday' THEN 2
                        WHEN DayOfWeek = 'Wednesday' THEN 3
                        WHEN DayOfWeek = 'Thursday' THEN 4
                        WHEN DayOfWeek = 'Friday' THEN 5
                        WHEN DayOfWeek = 'Saturday' THEN 6
                        ELSE 7
                    END, StartTime";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@TeacherId", teacherId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvTeacherTimetable.DataSource = dt;
                gvTeacherTimetable.DataBind();
            }
        }
    }
}
