using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

namespace Genesis.Pages.Login
{
    public partial class LoginWS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string content = "null";

            Response.Clear();
            Response.ClearHeaders();

            if (Request["user"] != null && Request["pass"] != null)
                content = CheckUserPass(Request["user"], Request["pass"]);

            Response.Write(content);
            Response.Flush();
            Response.End();
        }

        private string CheckUserPass (
            string user,
            string pass)
        {            
            string passCrypted = Crypt.StringByMD5(pass);
            Mod_Users User = Mod_Users.Get_UserByUserAndPassword(user, passCrypted);

            if (User != null)
            {
                string guid = Guid.NewGuid().ToString();
                Crypt.Insert_AccessCode(guid, User.ID);
                return guid;
            }                
            else
                return "False";
        }
    }
}