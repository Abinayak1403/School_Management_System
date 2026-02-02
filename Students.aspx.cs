using System;
using System.Web.UI;

namespace YourNamespace
{
    public partial class Student : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Add welcome message or session check logic here
        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddStudent.aspx");
        }

        protected void btnViewStudents_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewStudent.aspx");
        }
        protected void btnGiveFeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewStudent.aspx");
        }

    }
}
