using System;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class AddSubject : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClasses();
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(ddlClass.SelectedValue) || string.IsNullOrWhiteSpace(txtSubjectName.Text))
            {
                lblMessage.Text = "Please select a class and enter a subject name.";
                lblMessage.CssClass = "text-danger";
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Subject (ClassId, SubjectName) VALUES (@ClassId, @SubjectName)", con);
                cmd.Parameters.AddWithValue("@ClassId", ddlClass.SelectedValue);
                cmd.Parameters.AddWithValue("@SubjectName", txtSubjectName.Text.Trim());

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Subject added successfully!";
                    lblMessage.CssClass = "text-success";
                    txtSubjectName.Text = "";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
            }
        }
    }
}
