using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Connection;
using System.Data;

namespace Models
{
    public class Mod_Roles
    {
        int id;
        string role;

        public int ID { get => id; }
        public string ROLE { get => role; }

        private Mod_Roles(DataRow DR)
        {
            id = int.Parse(DR["Id"].ToString());
            role = DR["Role"].ToString();
        }

        public static List<Mod_Roles> Get_Roles(
            int? id,
            string role)
        {            
            DataTable DT = Con_Roles.Get_Roles(id, role);
            List<Mod_Roles> List = new List<Mod_Roles>();

            if (DT != null && DT.Rows.Count > 0)
            {
                foreach (DataRow DR in DT.Rows)
                {
                    List.Add(new Mod_Roles(DR));
                }
                return List;
            }
            else
                return null;
        }

        public static Mod_Roles Insert_Role(string role)
        {
            int id = int.Parse(Con_Roles.Insert_Role(role).Rows[0][0].ToString());

            DataTable DT = Con_Roles.Get_Roles(id, null);

            if (DT != null && DT.Rows.Count > 0)
                return new Mod_Roles(DT.Rows[0]);
            else
                return null;

        }

        public static bool Delete_Role(
            int? id,
            string role)
        {
            return Con_Roles.Delete_Role(id, role);
        }

        public static bool Update_Role(
            int? id,
            string role)
        {
            return Con_Roles.Update_Role(id, role);
        }

    }
}
