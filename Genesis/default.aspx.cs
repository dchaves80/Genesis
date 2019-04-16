using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Genesis
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IncludeJavaScript("https://ajax.googleapis.com/ajax/libs/ext-core/3.1.0/ext-core.js", Page);
        }
    }
}