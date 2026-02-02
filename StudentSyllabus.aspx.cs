using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class StudentSyllabus : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSyllabus();
            }
        }

        private void LoadSyllabus()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT SubjectId, FilePath FROM Syllabus ORDER BY UploadDate DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptSyllabus.DataSource = dt;
                rptSyllabus.DataBind();
            }
        }

    }
}
