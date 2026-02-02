using System;

namespace YourNamespace
{
    public partial class Teacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddTeacher_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddTeacher.aspx");
        }

        protected void btnViewTeachers_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewTeacher.aspx");
        }
        protected void btnadminleave(object sender, EventArgs e)
        {
            Response.Redirect("AdminLeaveRequests.aspx");
        }
    }
}
