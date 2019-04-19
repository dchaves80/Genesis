using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

namespace Usuarios
{
    public partial class Usuarios : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IncludeJavaScript("../../Modules/Usuarios/Usuarios.js", Page);
        }
    }
}