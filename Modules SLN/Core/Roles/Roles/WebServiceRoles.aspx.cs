﻿using System;
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
            if (Request["deleteRole"] != null)
                content = DeleteRole(int.Parse(Request["id"]), Request["role"]);
            if (Request["insertRole"] != null)
                content = InsertRole(Request["newRole"]);

            Response.Write(content);
            Response.Flush();
            Response.End();
        }

        /// <summary>
        /// Modifica un rol
        /// </summary>
        /// <param name="id">Id del rol</param>
        /// <param name="newRole">Nuevo string del rol</param>
        /// <returns>Devuelve un string "True" si se modificó, "False" si no.</returns>
        private string UpdateRole(
            int? id,
            string newRole)
        {
            return Mod_Roles.Update_Role(id, newRole).ToString();
        }

        /// <summary>
        /// Obtiene todos los roles
        /// </summary>
        /// <returns>Devuelve una lista con todos los roles</returns>
        private List<Mod_Roles> GetAllRoles()
        {
            return Mod_Roles.Get_Roles(null, null);
        }

        /// <summary>
        /// Elimina un rol de la tabla
        /// </summary>
        /// <param name="id">Id del rol</param>
        /// <param name="role">Nombre del rol</param>
        /// <returns>Devuelve un string "True" si se eliminó, "False" si no.</returns>
        private string DeleteRole(
            int id,
            string role)
        {
            return Mod_Roles.Delete_Role(id, role).ToString();
        }

        /// <summary>
        /// Inserta un rol en la tabla
        /// </summary>
        /// <param name="role">String del nuevo rol</param>
        /// <returns>Devuelve un string "True" si se creó, "False" si no.</returns>
        private string InsertRole(string role)
        {
            if (Mod_Roles.Insert_Role(role) != null)
                return "True";
            else
                return "False";
        }
    }
}