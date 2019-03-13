using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using System.Web.Script.Serialization;
using System.Data;

namespace Roles
{
    public partial class WebServiceRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string content = "null";

            Response.Clear();
            Response.ClearHeaders();

            // Requests
            if (Request["updateRole"] != null)
                content = UpdateRole(int.Parse(Request["id"]), Request["newRole"]);
            if (Request["getRoles"] != null)
                content = new JavaScriptSerializer().Serialize(GetAllRoles());

            Response.Write(content);
            Response.Flush();
            Response.End();
        }

        private string UpdateRole(
            int? id,
            string newRole)
        {
            return Mod_Roles.Update_Role(id, newRole).ToString();
        }

        private List<Mod_Roles> GetAllRoles()
        {
            return Mod_Roles.Get_Roles(null, null);
        }
    }
}