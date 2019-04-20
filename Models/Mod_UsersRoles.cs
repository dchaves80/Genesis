using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Connection;

////	Code generated via Losha v1.0. By Losha, for Losha.	////
////	Date of this code: 26/3/2019						////

// Editado el código para simplificarlo en los return - Losha - 2019/04/19 22.25

namespace Models
{
    public class Mod_UsersRoles
    {
        int id;
        int userid;
        int roleid;
        Mod_Users user;
        Mod_Roles role;

        public int ID { get => id; set => id = value; }
        public int USERID { get => userid; set => userid = value; }
        public int ROLEID { get => roleid; set => roleid = value; }
        public Mod_Users USER { get => user; set => user = value; }
        public Mod_Roles ROLE { get => role; set => role = value; }


        /// <summary>
        /// Constructor del objeto Mod_UsersRoles a partir de un DataRow
        /// </summary>
        /// <param name="DR">Fila con los datos para llenar el objeto</param>
        public Mod_UsersRoles(DataRow DR)
        {
            id = int.Parse(DR["Id"].ToString());
            userid = int.Parse(DR["UserID"].ToString());
            roleid = int.Parse(DR["RoleID"].ToString());
            user = Mod_Users.Get_ById(userid);
            role = Mod_Roles.Get_ById(roleid);
        }

        /// <summary>
        /// Obtiene todos los Mod_UsersRoles
        /// </summary>
        /// <returns>Devuelve una lista con los Mod_UsersRoles</returns>
        public static List<Mod_UsersRoles> GetAll()
        {
            List<Mod_UsersRoles> results = new List<Mod_UsersRoles>();
            DataTable DT = Con_UsersRoles.Get_UsersRoles(null, null, null);

            

            if (DT != null && DT.Rows.Count > 0)
            {
                foreach (DataRow DR in DT.Rows)
                    results.Add(new Mod_UsersRoles(DR));

                return results;
            }
            else
                return null;
        }

        /// <summary>
        /// Busca un Mod_UsersRoles con los ids que indiques
        /// </summary>
        /// <param name="userId">Id de usuario</param>
        /// <param name="roleId">Ide de rol</param>
        /// <returns>Devuelve un objeto Mod_UsersRoles si encuentra, null si no</returns>
        public static Mod_UsersRoles Get_ByIds(
            int userId,
            int roleId)
        {
            return new Mod_UsersRoles(Con_UsersRoles.Get_UsersRoles(null, userId, roleId).Rows[0]);
        }

        public static List<Mod_UsersRoles> Get_UsersRoles(
            int? id,
            int? userId,
            int? roleId)
        {
            List<Mod_UsersRoles> results = new List<Mod_UsersRoles>();
            DataTable DT = Con_UsersRoles.Get_UsersRoles(id, userId, roleId);
           
            if (DT != null && DT.Rows.Count > 0)
            {
                foreach (DataRow DR in DT.Rows)
                    results.Add(new Mod_UsersRoles(DR));

                return results;
            }
            else
                return null;
        }

        public static Mod_UsersRoles Insert(
            int userId,
            int roleId)
        {

            if (Get_ByIds(userId, roleId) != null)
                return null;
            else
            {
                int id = int.Parse(Con_UsersRoles.Insert_UsersRoles(userId, roleId).Rows[0][0].ToString());

                DataTable DT = Con_UsersRoles.Get_UsersRoles(id, null, null);

                //if (id > 0)
                //    return new Mod_UsersRoles(DT.Rows[0]);
                //else
                //    return null;

                return (id > 0) ? new Mod_UsersRoles(DT.Rows[0]) : null;
            }
                           
        }

        public static bool Delete_UserRole(
            int id,
            int userId,
            int roleId)
        {
            return Con_UsersRoles.Delete_UsersRoles(id, userId, roleId);
        }

        public static bool Update_UserRole(
            int id,
            int userId,
            int roleId)
        {
            return Con_UsersRoles.Delete_UsersRoles(id, userId, roleId);
        }
    }
}
