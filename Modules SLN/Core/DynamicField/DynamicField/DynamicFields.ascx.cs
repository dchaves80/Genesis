﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicField
{
    public partial class DynamicFields : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Models.Utils.IncludeJavaScript("/Modules/DynamicField/DynamicField.js",Page);
        }
    }
}