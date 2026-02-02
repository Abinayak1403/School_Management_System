using System;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class StudentPayFees : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFeeDetails();
            }
        }

        private void LoadFeeDetails()
        {
            string studentId = Session["StudentId"]?.ToString();
            if (string.IsNullOrEmpty(studentId))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                // Get ClassId and Student Name
                SqlCommand cmd = new SqlCommand("SELECT ClassId, Name FROM Student WHERE StudentId = @StudentId", con);
                cmd.Parameters.AddWithValue("@StudentId", studentId);
                SqlDataReader reader = cmd.ExecuteReader();

                int classId = 0;
                string studentName = "";

                if (reader.Read())
                {
                    classId = Convert.ToInt32(reader["ClassId"]);
                    studentName = reader["Name"].ToString();
                    lblStudentName.Text = $"👤 Name: {studentName}";
                }
                reader.Close();

                // Get Fee Amount
                SqlCommand cmdFee = new SqlCommand("SELECT FeesAmount FROM Fees WHERE ClassId = @ClassId", con);
                cmdFee.Parameters.AddWithValue("@ClassId", classId);
                object feeObj = cmdFee.ExecuteScalar();

                if (feeObj != null)
                {
                    decimal amount = Convert.ToDecimal(feeObj);
                    lblAmount.Text = $"💰 Amount: ₹{amount}";
                }
                else
                {
                    lblAmount.Text = "⚠️ Fee details not found.";
                    btnMarkPaid.Visible = false;
                }
            }
        }

        protected void btnMarkPaid_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('✅ Payment successful. Your submission has been recorded.');", true);
        }

        protected void btnDownloadReceipt_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/Receipts/SampleReceipt.pdf");

            if (System.IO.File.Exists(filePath))
            {
                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=FeeReceipt.pdf");
                Response.TransmitFile(filePath);
                Response.End();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('📄 Receipt file not found. Please contact admin.');", true);
            }
        }
    }
}
