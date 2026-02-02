using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;


namespace YourNamespace
{
    [Serializable]
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }

        public string Role { get; set; }
    }


}