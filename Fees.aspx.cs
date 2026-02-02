using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class Fees : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClasses();
                LoadFees();
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
            if (string.IsNullOrWhiteSpace(ddlClass.SelectedValue) || string.IsNullOrWhiteSpace(txtAmount.Text))
            {
                lblMessage.Text = "Please select a class and enter fees.";
                lblMessage.CssClass = "text-danger";
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Fees (ClassId, FeesAmount) VALUES (@ClassId, @Amount)", con);
                cmd.Parameters.AddWithValue("@ClassId", ddlClass.SelectedValue);
                cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                lblMessage.Text = "Fees saved successfully!";
                lblMessage.CssClass = "text-success";
                LoadFees();
            }
        }

        private void LoadFees()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Fees", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}
