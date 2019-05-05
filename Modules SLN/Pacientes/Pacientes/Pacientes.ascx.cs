using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

namespace Pacientes
{
    public partial class Pacientes : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IncludeJavaScript("../../Modules/Pacientes/Pacientes.js", Page);
            Utils.IncludeCSS("../../Modules/Pacientes/Pacientes.css", Page);
        }
    }
}