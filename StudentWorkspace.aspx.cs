using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class StudentWorkspace : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNotes();
            }
        }

        private void LoadNotes()
        {
            string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"SELECT N.Title, N.FilePath, N.UploadDate, 
                                        C.ClassName, S.SubjectName
                                 FROM Notes N
                                 JOIN Class C ON N.ClassId = C.ClassId
                                 JOIN Subject S ON N.SubjectId = S.SubjectId
                                 ORDER BY N.UploadDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptNotes.DataSource = dt;
                rptNotes.DataBind();
            }
        }
    }
}
