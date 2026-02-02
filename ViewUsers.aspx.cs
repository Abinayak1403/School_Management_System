using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace YourNamespace
{
 

    public partial class ViewUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("App_Data/users.dat");
            if (File.Exists(filePath))
            {
                BinaryFormatter formatter = new BinaryFormatter();
                using (FileStream stream = new FileStream(filePath, FileMode.Open, FileAccess.Read))
                {
                    List<User> users = (List<User>)formatter.Deserialize(stream);
                    GridViewUsers.DataSource = users;
                    GridViewUsers.DataBind();
                }
            }
        }
    }
}
