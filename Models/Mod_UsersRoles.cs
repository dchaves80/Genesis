using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Connection;


namespace Models
{
    public class Mod_UsersRoles
    {
        int id;
        int userid;
        int roleid;

        public int ID { get => id; set => id = value; }
        public int USERID { get => userid; set => userid = value; }
        public int ROLEID { get => roleid; set => roleid = value; }

        /// <summary>
        /// Constructor del objeto Mod_UsersRoles a partir de un DataRow
        /// </summary>
        /// <param name="DR">Fila con los datos para llenar el objeto</param>
        public Mod_UsersRoles(DataRow DR)
        {
            id = int.Parse(DR["Id"].ToString());
            userid = int.Parse(DR["UserID"].ToString());
            roleid = int.Parse(DR["RoleID"].ToString());
        }

        public List<Mod_UsersRoles> Get_UsersRoles(
            int? id,
            string userId,
            int? roleId)
        {
            List<Mod_UsersRoles> results = new List<Mod_UsersRoles>();
            DataTable DT = Con_Roles.Get_Roles(id, userId);

            

            if (DT != null && DT.Rows.Count > 0)
            {
                foreach (DataRow DR in DT.Rows)
                    results.Add(new Mod_UsersRoles(DR));

                return results;
            }
            else
                return null;
        }
    }
}
