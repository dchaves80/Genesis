using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

namespace Profile
{
    public partial class Profile : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IncludeJavaScript("../../Modules/Profile/Profile.js", Page);
            Utils.IncludeCSS("../../Modules/Profile/Profile.css", Page);
        }
    }
}