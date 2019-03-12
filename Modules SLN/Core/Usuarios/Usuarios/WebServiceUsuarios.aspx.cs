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

            Response.Write(content);
            Response.Flush();
            Response.End();
        }

        private string CreateUser(
            string userName,
            string email,
            string password)
        {
            DataTable DT = Mod_Users.Insert_User(userName, email, password);

            if (DT != null && DT.Rows.Count > 0)
                return "True";
            else
                return "False";
        }
    }
}