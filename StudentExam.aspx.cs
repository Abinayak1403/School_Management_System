using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class StudentExamination : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadExamData();
            }
        }

        private void LoadExamData()
        {
            string studentId = Session["StudentId"]?.ToString();
            if (string.IsNullOrEmpty(studentId)) return;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"
                    SELECT M.ExamType, M.ExamDate, M.MarksObtained, M.TotalMarks, 
                           S.SubjectName
                    FROM Marks M
                    JOIN Subject S ON M.SubjectId = S.SubjectId
                    WHERE M.StudentId = @StudentId
                    ORDER BY M.ExamDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@StudentId", studentId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Create a combined column for display: "XX / YY"
                dt.Columns.Add("MarksDisplay", typeof(string));
                foreach (DataRow row in dt.Rows)
                {
                    row["MarksDisplay"] = $"{row["MarksObtained"]} / {row["TotalMarks"]}";
                }

                gvExams.DataSource = dt;
                gvExams.DataBind();
            }
        }
    }
}
