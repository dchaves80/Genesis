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
        public string content = "null";

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ClearHeaders();

            if (Request["user"] != null && Request["pass"] != null)
                CheckUserPass(Request["user"], Request["pass"]);

            Response.Write(content);
            Response.Flush();
            Response.End();
        }

        private void CheckUserPass (
            string user,
            string pass)
        {            
            string passCrypted = Crypt.StringByMD5(pass);

            bool isCorrect = Mod_Users.Get_UserByUserAndPassword(user, passCrypted);
            content = isCorrect.ToString();
        }
    }
}