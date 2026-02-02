using System;
using System.Web.UI;

namespace YourNamespace
{
    public partial class Subject : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUser.Text = "Welcome, Admin";

                // Apply dark mode if session enabled
                if (Session["DarkMode"] != null && (bool)Session["DarkMode"])
                {
                    body.Attributes["class"] = "dark-mode";
                }
            }
        }
    }
}
