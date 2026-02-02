using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class ViewStudents : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
            }
        }

        private void LoadStudents(string filter = "")
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT * FROM Student";
                if (!string.IsNullOrWhiteSpace(filter))
                {
                    query += " WHERE Name LIKE @filter OR RollNo LIKE @filter";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                if (!string.IsNullOrWhiteSpace(filter))
                {
                    cmd.Parameters.AddWithValue("@filter", "%" + filter + "%");
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadStudents(txtSearch.Text.Trim());
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadStudents();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadStudents(txtSearch.Text.Trim());
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadStudents(txtSearch.Text.Trim());
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadStudents(txtSearch.Text.Trim());
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int studentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string name = ((TextBox)row.Cells[1].Controls[0]).Text;
            string dob = ((TextBox)row.Cells[2].Controls[0]).Text;
            string gender = ((TextBox)row.Cells[3].Controls[0]).Text;
            string mobile = ((TextBox)row.Cells[4].Controls[0]).Text;
            string rollNo = ((TextBox)row.Cells[5].Controls[0]).Text;
            string address = ((TextBox)row.Cells[6].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"UPDATE Student SET 
                                Name = @Name, DOB = @DOB, Gender = @Gender, 
                                Mobile = @Mobile, RollNo = @RollNo, Address = @Address 
                                WHERE StudentId = @StudentId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@DOB", dob);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Mobile", mobile);
                cmd.Parameters.AddWithValue("@RollNo", rollNo);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@StudentId", studentId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            GridView1.EditIndex = -1;
            LoadStudents(txtSearch.Text.Trim());
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int studentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "DELETE FROM Student WHERE StudentId = @StudentId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@StudentId", studentId);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadStudents(txtSearch.Text.Trim());
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=ViewStudents.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";

            StringBuilder sb = new StringBuilder();

            // Column headers
            foreach (DataControlField col in GridView1.Columns)
            {
                sb.Append(col.HeaderText + ",");
            }
            sb.AppendLine();

            // Rows
            foreach (GridViewRow row in GridView1.Rows)
            {
                for (int i = 0; i < row.Cells.Count; i++)
                {
                    sb.Append(row.Cells[i].Text.Replace(",", "") + ",");
                }
                sb.AppendLine();
            }

            Response.Output.Write(sb.ToString());
            Response.Flush();
            Response.End();
        }


        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for export to work
        }
    }

}
