using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Data;

namespace Testing
{
    public partial class Testing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string content = "null";

            Response.Clear();
            Response.ClearHeaders();

            // Requests
            if (Request["ajaxData[usr]"] != null)
                content = new JavaScriptSerializer().Serialize(Models.Mod_Users.Get_All());

            Response.Write(content);
            Response.Flush();
            Response.End();
        }
    }
}