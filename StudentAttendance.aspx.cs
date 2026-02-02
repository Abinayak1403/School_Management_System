using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Text;

namespace YourNamespace
{
    public partial class StudentAttendance : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClasses();
                LoadSubjects();
                LoadAttendance();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string status = rbPresent.Checked ? "Present" : rbAbsent.Checked ? "Absent" : "";

            if (string.IsNullOrWhiteSpace(txtRollNo.Text) ||
                string.IsNullOrWhiteSpace(ddlClass.SelectedValue) ||
                string.IsNullOrWhiteSpace(ddlSubject.SelectedValue) ||
                string.IsNullOrWhiteSpace(txtDate.Text) ||
                string.IsNullOrWhiteSpace(status))
            {
                lblMessage.Text = "Please fill all the fields.";
                lblMessage.CssClass = "text-danger fw-bold";
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"INSERT INTO StudentAttendance (ClassId, SubjectId, RollNo, Status, Date) 
                                 VALUES (@ClassId, @SubjectId, @RollNo, @Status, @Date)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ClassId", ddlClass.SelectedValue);
                cmd.Parameters.AddWithValue("@SubjectId", ddlSubject.SelectedValue);
                cmd.Parameters.AddWithValue("@RollNo", txtRollNo.Text.Trim());
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Attendance saved successfully!";
                    lblMessage.CssClass = "text-success fw-bold";
                    LoadAttendance();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.CssClass = "text-danger fw-bold";
                }
            }
        }

        private void LoadClasses()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT ClassId, ClassName FROM Class", con);
                con.Open();
                ddlClass.DataSource = cmd.ExecuteReader();
                ddlClass.DataTextField = "ClassName";
                ddlClass.DataValueField = "ClassId";
                ddlClass.DataBind();
            }
            ddlClass.Items.Insert(0, new ListItem("-- Select Class --", ""));
        }

        private void LoadSubjects()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT SubjectId, SubjectName FROM Subject", con);
                con.Open();
                ddlSubject.DataSource = cmd.ExecuteReader();
                ddlSubject.DataTextField = "SubjectName";
                ddlSubject.DataValueField = "SubjectId";
                ddlSubject.DataBind();
            }
            ddlSubject.Items.Insert(0, new ListItem("-- Select Subject --", ""));
        }

        private void LoadAttendance()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM StudentAttendance ORDER BY Date DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

                lblTotalRecords.Text = dt.Rows.Count.ToString();
                lblSummary.Text = "Loaded " + dt.Rows.Count + " records.";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = "SELECT * FROM StudentAttendance WHERE RollNo LIKE @Search ORDER BY Date DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text.Trim() + "%");

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

                lblTotalRecords.Text = dt.Rows.Count.ToString();
                lblSummary.Text = "Search returned " + dt.Rows.Count + " records.";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadAttendance();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=StudentAttendance.csv");
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
    }
}
