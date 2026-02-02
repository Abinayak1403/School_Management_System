using System;
using System.Web.UI;

namespace YourNamespace
{
    public partial class NoticeBoard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddNotice_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNotice.aspx");
        }

        protected void btnViewNotices_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewNotice.aspx");
        }
    }
}
