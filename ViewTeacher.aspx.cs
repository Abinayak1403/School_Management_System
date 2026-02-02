using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class ViewTeachers : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadTeachers();
        }

        private void LoadTeachers(string filter = "")
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT * FROM Teacher";
                if (!string.IsNullOrWhiteSpace(filter))
                {
                    query += " WHERE Name LIKE @Filter OR Mobile LIKE @Filter";
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
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadTeachers(txtSearch.Text);
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadTeachers(txtSearch.Text);
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadTeachers(txtSearch.Text);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int teacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string name = ((TextBox)row.Cells[1].Controls[0]).Text;
            string dob = ((TextBox)row.Cells[2].Controls[0]).Text;
            string gender = ((TextBox)row.Cells[3].Controls[0]).Text;
            string mobile = ((TextBox)row.Cells[4].Controls[0]).Text;
            string address = ((TextBox)row.Cells[5].Controls[0]).Text;
            string password = ((TextBox)row.Cells[6].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "UPDATE Teacher SET Name=@Name, DOB=@DOB, Gender=@Gender, Mobile=@Mobile, Address=@Address, Password=@Password WHERE TeacherId=@TeacherId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@DOB", dob);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Mobile", mobile);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@TeacherId", teacherId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            GridView1.EditIndex = -1;
            LoadTeachers(txtSearch.Text);
            lblMessage.Text = "Teacher updated successfully!";
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int teacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Teacher WHERE TeacherId=@TeacherId", con);
                cmd.Parameters.AddWithValue("@TeacherId", teacherId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            LoadTeachers(txtSearch.Text);
            lblMessage.Text = "Teacher deleted successfully!";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadTeachers(txtSearch.Text.Trim());
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadTeachers();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=ViewTechers.csv");
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
