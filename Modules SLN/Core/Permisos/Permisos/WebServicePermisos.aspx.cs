using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using System.Web.Script.Serialization;
using System.Data;

namespace Permisos
{
    public partial class WebServicePermisos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string content = "null";

            Response.Clear();
            Response.ClearHeaders();

            // Requests
            if (Request["getAllRoles"] != null)
                content = GetAllRoles();

            if (Request["assignRole"] != null)
                content = AssignRole(int.Parse(Request["idRol"]), int.Parse(Request["idModule"]));

            if (Request["getAllModules"] != null)
                content = GetAllModules();

            if (Request["unassignRole"] != null)
                content = UnassignRole(int.Parse(Request["idModule"]), int.Parse(Request["idRole"]));

            if (Request["getRole"] != null)
                content = GetRole(int.Parse(Request["idRol"]));

            Response.Write(content);
            Response.Flush();
            Response.End();
        }

        /// <summary>
        /// Obtiene todos los roles
        /// </summary>
        /// <returns>Devuelve una lista con todos los roles</returns>
        private string GetAllRoles()
        {
            return new JavaScriptSerializer().Serialize(Mod_Roles.Get_All());
        }

        /// <summary>
        /// Asigna un rol a un modulo
        /// </summary>
        /// <param name="idRole">Id del rol</param>
        /// <param name="idModule">Id de modulo</param>
        /// <returns>Devuelve un string "True" si se asignó, "False" si no.</returns>
        private string AssignRole(
            int idRole,
            int idModule)
        {
            Mod_Modules module = Mod_Modules.Get_ById(idModule);
            bool exists = false;

            if (module.ROLES != null)
            {
                for (int a = 0; a < module.ROLES.Count; a++)
                {
                    if (module.ROLES[a].ID == idRole)
                    {
                        exists = true;
                    }
                }
            }

            return exists ? "El módulo ya tiene ese rol asignado. Elija otro." : module.LinkRole(idRole).ToString();
        }

        /// <summary>
        /// Desasigna un rol de un modulo
        /// </summary>
        /// <param name="idModule">Id de modulo</param>
        /// <param name="idRole">Id de rol</param>
        /// <returns>Devuelve un string "True" si se desasignó, "False" sino</returns>
        private string UnassignRole(
            int idModule,
            int idRole)
        {
            return Mod_Modules.Get_ById(idModule).UnlinkRole(idRole).ToString();
        }

        /// <summary>
        /// Busca un único rol por su id
        /// </summary>
        /// <param name="idRole">Id del rol</param>
        /// <returns>Devuelve un string del objeto serializado a json</returns>
        private string GetRole(int idRole)
        {
            return new JavaScriptSerializer().Serialize(Mod_Roles.Get_ById(idRole));
        }

        /// <summary>
        /// Obtiene todos los módulos
        /// </summary>
        /// <returns>Devuelve un string serializado en json con una lista de Mod_Modules.</returns>
        private string GetAllModules()
        {
            return new JavaScriptSerializer().Serialize(Mod_Modules.Get_All());
        }
    }
}