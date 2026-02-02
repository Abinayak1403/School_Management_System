using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class StudentTimeTable : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentTimeTable();
            }
        }

        private void LoadStudentTimeTable()
        {
            string studentId = Session["StudentId"]?.ToString();
            if (string.IsNullOrEmpty(studentId))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                // Get ClassId of the logged-in student
                SqlCommand cmdClass = new SqlCommand("SELECT ClassId FROM Student WHERE StudentId = @StudentId", con);
                cmdClass.Parameters.AddWithValue("@StudentId", studentId);
                object classIdObj = cmdClass.ExecuteScalar();

                if (classIdObj == null) return;

                int classId = Convert.ToInt32(classIdObj);

                // Get Time Table for the student's class
                SqlCommand cmd = new SqlCommand(@"
                    SELECT T.DayOfWeek, S.SubjectName, T.StartTime, T.EndTime
                    FROM TimeTable T
                    INNER JOIN Subject S ON T.SubjectId = S.SubjectId
                    WHERE T.ClassId = @ClassId
                    ORDER BY 
                        CASE 
                            WHEN T.DayOfWeek = 'Monday' THEN 1
                            WHEN T.DayOfWeek = 'Tuesday' THEN 2
                            WHEN T.DayOfWeek = 'Wednesday' THEN 3
                            WHEN T.DayOfWeek = 'Thursday' THEN 4
                            WHEN T.DayOfWeek = 'Friday' THEN 5
                            WHEN T.DayOfWeek = 'Saturday' THEN 6
                            ELSE 7
                        END, T.StartTime", con);

                cmd.Parameters.AddWithValue("@ClassId", classId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvTimeTable.DataSource = dt;
                gvTimeTable.DataBind();
            }
        }
    }
}
