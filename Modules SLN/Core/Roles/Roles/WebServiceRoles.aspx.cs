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

            if (Request["getAllRoles"] != null)
                content = GetAllRoles();

            if (Request["deleteRole"] != null)
                content = DeleteRole(int.Parse(Request["id"]), Request["role"]);

            if (Request["insertRole"] != null)
                content = InsertRole(Request["newRole"]);

            if (Request["assignRole"] != null)
                content = AssignRole(int.Parse(Request["idRol"]), int.Parse(Request["idUsuario"]));

            if (Request["getAllUserRoles"] != null)
                content = GetAllUsersRoles();

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
            int id,
            string newRole)
        {
            Mod_Roles r = Mod_Roles.Get_ById(id);
            if (r != null)
            {
                #region return deprecated
                //if (r.Update(newRole) == true)
                //{
                //    return true.ToString();
                //}
                //else
                //{
                //    return false.ToString();
                //}
                #endregion

                return (r.Update(newRole)) ? true.ToString() : false.ToString();
            }
            else
                return false.ToString();            
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
        /// Elimina un rol de la tabla
        /// </summary>
        /// <param name="id">Id del rol</param>
        /// <param name="role">Nombre del rol</param>
        /// <returns>Devuelve un string "True" si se eliminó, "False" si no.</returns>
        private string DeleteRole(
            int id,
            string role)
        {

            Mod_Roles r = Mod_Roles.Get_ById(id);
            //bool result = r.Delete();

            return r.Delete().ToString();
        }

        /// <summary>
        /// Inserta un rol en la tabla
        /// </summary>
        /// <param name="role">String del nuevo rol</param>
        /// <returns>Devuelve un string "True" si se creó, "False" si no.</returns>
        private string InsertRole(string role)
        {
            #region return deprecated
            //    if (Mod_Roles.Insert(role) != null)
            //        return "True";
            //    else
            //        return "False";
            #endregion

            return (Mod_Roles.Insert(role) != null) ? "True" : "False";
        }

        /// <summary>
        /// Asigna un rol a un usuario
        /// </summary>
        /// <param name="idRole">Id del rol</param>
        /// <param name="idUser">Id de usuario</param>
        /// <returns>Devuelve un string "True" si se asignó, "False" si no.</returns>
        private string AssignRole(
            int idRole,
            int idUser)
        {
            return (Mod_UsersRoles.Insert(idUser, idRole) != null) ? "True" : "False";
        }

        private string GetAllUsersRoles()
        {
            return new JavaScriptSerializer().Serialize(Mod_UsersRoles.GetAll());
        }
    }
}