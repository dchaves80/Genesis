using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicField
{
    public partial class WebServiceDynamicField : System.Web.UI.Page
    {
        string content;
        protected void Page_Load(object sender, EventArgs e)
        {

            Response.Clear();
            Response.ClearHeaders();

            if (Request["task"] == "Update") { Update(); }

            Response.Write(content);
            Response.Flush();
            Response.End();
        }

            void Update()
            {
                int id = int.Parse(Request["id"]);
                string idval = Request["Val"];
                Mod_DynamicField df = Models.Mod_DynamicField.GetById(id);
                df.Update(idval);
               content = "true";
            }
    }
}