using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using System.Data;

namespace Usuarios
{
    public partial class WebServiceUsuarios : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string content = "";

            Response.Clear();
            Response.ClearHeaders();

            if (Request["createUser"] != null)
                content = CreateUser(Request["user"], Request["email"], Request["password"]);
            if (Request["checkUser"] != null)
                content = CheckIfUSerExists(Request["username"]);

            Response.Write(content);
            Response.Flush();
            Response.End();
        }

        private string CreateUser(
            string userName,
            string email,
            string password)
        {
            Mod_Users u = Mod_Users.New(userName, email, password);

            if (u != null)
                return "True";
            else
                return "False";
        }

        private string CheckIfUSerExists(
            string username)
        {
            Mod_Users user = Mod_Users.Get_ByUsername(username);

            if (user != null)
                return "True";
            else return "False";
        }
    }
}