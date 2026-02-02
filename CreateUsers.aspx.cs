using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace YourNamespace
{
    public partial class CreateUsers : System.Web.UI.Page
    {
        protected void btnCreateUsers_Click(object sender, EventArgs e)
        {
            List<User> users = new List<User>
            {
                new User { Username = "admin", Password = "admin123", Role = "admin" },
                new User { Username = "John", Password = "student12", Role = "student" },
                new User { Username = "Sitaa", Password = "1234", Role = "teacher" },
                new User { Username = "owner", Password = "owner12", Role = "owner" }
            };

            string filePath = Server.MapPath("App_Data/users.dat");

            using (FileStream fs = new FileStream(filePath, FileMode.Create))
            {
                BinaryFormatter formatter = new BinaryFormatter();
                formatter.Serialize(fs, users);
            }

            Response.Write("Sample users created.");
        }
    }
}
