using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class TimeTable : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClasses();
                LoadSubjects();
                LoadTimeTable();
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
            ddlClass.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Class --", ""));
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
            ddlSubject.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Subject --", ""));
        }

        private void LoadTimeTable()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM TimeTable ORDER BY DayOfWeek", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ddlClass.SelectedValue == "" || ddlSubject.SelectedValue == "" || ddlDay.SelectedValue == "" ||
                string.IsNullOrWhiteSpace(txtStartTime.Text) || string.IsNullOrWhiteSpace(txtEndTime.Text))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.CssClass = "text-danger";
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO TimeTable (ClassId, SubjectId, DayOfWeek, StartTime, EndTime) VALUES (@ClassId, @SubjectId, @DayOfWeek, @StartTime, @EndTime)", con);
                cmd.Parameters.AddWithValue("@ClassId", ddlClass.SelectedValue);
                cmd.Parameters.AddWithValue("@SubjectId", ddlSubject.SelectedValue);
                cmd.Parameters.AddWithValue("@DayOfWeek", ddlDay.SelectedValue);
                cmd.Parameters.AddWithValue("@StartTime", txtStartTime.Text);
                cmd.Parameters.AddWithValue("@EndTime", txtEndTime.Text);

                con.Open();
                cmd.ExecuteNonQuery();

                lblMessage.Text = "Time table entry added successfully!";
                lblMessage.CssClass = "text-success";

                LoadTimeTable();
            }
        }
    }
}
