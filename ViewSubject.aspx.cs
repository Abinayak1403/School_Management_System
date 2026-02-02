using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class ViewSubjects : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSubjects();
            }
        }

        private void LoadSubjects(string filter = "")
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT * FROM Subject";

                if (!string.IsNullOrWhiteSpace(filter))
                {
                    query += " WHERE SubjectName LIKE @Filter";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                if (!string.IsNullOrWhiteSpace(filter))
                {
                    cmd.Parameters.AddWithValue("@Filter", "%" + filter + "%");
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

                lblMessage.Text = dt.Rows.Count == 0 ? "No records found." : "";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadSubjects(txtSearch.Text.Trim());
        }
    }
}
