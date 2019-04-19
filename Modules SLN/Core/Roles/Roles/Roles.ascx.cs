using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

namespace Roles
{
    public partial class Roles : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IncludeJavaScript("../../Modules/Roles/Roles.js", Page);
        }
    }
}