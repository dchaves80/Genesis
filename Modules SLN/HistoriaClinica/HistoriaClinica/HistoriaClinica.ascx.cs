using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

namespace HistoriaClinica
{
    public partial class HistoriaClinica : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IncludeJavaScript("../../Modules/HistoriaClinica/HistoriaClinica.js", Page);
            Utils.IncludeCSS("../../Modules/HistoriaClinica/HistoriaClinica.css", Page);
        }
    }
}