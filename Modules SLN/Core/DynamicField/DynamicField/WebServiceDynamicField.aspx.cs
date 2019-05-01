using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
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
            if (Request["task"] == "NewField") { NewField(); }
            if (Request["task"] == "DeleteField") { FeleteField(); }

            Response.Write(content);
            Response.Flush();
            Response.End();
        }

        void FeleteField()
        {
            int id = int.Parse(Request["id"]);
            Models.Mod_DynamicField df = Mod_DynamicField.GetById(id);
            if (df != null)
            {
                df.Delete();
                content = "true";
            }
            else { content = "false"; }
            
        }

        void NewField()
        {
            List<Mod_DynamicField> DF = Mod_DynamicField.Get_All();
            if (DF != null)
            {
                int c = DF.Count +1;
                Mod_DynamicField d = Mod_DynamicField.New("Nuevo Campo " + c.ToString());
                JavaScriptSerializer S = new JavaScriptSerializer();
                content = S.Serialize(d);
                
            }
            else
            {
               

                Mod_DynamicField d = Mod_DynamicField.New("Nuevo Campo 1");
                JavaScriptSerializer S = new JavaScriptSerializer();
                content = S.Serialize(d);
            }
            
        }

       void Update()
       {
           int id = int.Parse(Request["id"]);
           string idval = Request["val"];
           Mod_DynamicField df = Models.Mod_DynamicField.GetById(id);
           df.Update(idval);
           content = "true";
       }



    }
}