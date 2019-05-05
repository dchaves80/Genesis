using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

namespace Permisos
{
    public partial class Permisos : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IncludeJavaScript("../../Modules/Permisos/Permisos.js", Page);
            Utils.IncludeCSS("../../Modules/Permisos/Permisos.css", Page);
        }
    }
}