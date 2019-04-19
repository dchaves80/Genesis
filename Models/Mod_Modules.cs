using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Connection;

namespace Models
{
    public class Mod_Modules
    {
        int id;
        string name;
        string path;
        string dll;
        string icon;

        public string Name { get => name; set => name = value; }
        public string Path { get => path; set => path = value; }
        public string Dll { get => dll; set => dll = value; }
        public int Id { get => id; set => id = value; }
        public string Icon { get => icon; set => icon = value; }

        private Mod_Modules(DataRow DR)
        {
            id = int.Parse ( DR["Id"].ToString() );
            name = DR["ModuleName"].ToString();
            path = DR["Ascx"].ToString();
            dll = DR["Dll"].ToString();
            icon = DR["Icon"].ToString();
        }

        public static List<Mod_Modules> Get_All()
        {
            DataTable DT = Con_Modules.Get_Module(null, null, null, null, null);
            if (DT !=null && DT.Rows.Count > 0)
            {
                List<Mod_Modules> aux = new List<Mod_Modules>();
                foreach (DataRow DR in DT.Rows)
                {
                    aux.Add(new Mod_Modules(DR));
                }
                return aux;
            }
            else
            {
                return null;
            }
        }

        public static Mod_Modules Get_ById(int Id)
        {
            DataTable DT = Con_Modules.Get_Module(Id, null, null, null, null);
            if (DT != null && DT.Rows.Count > 0)
            {
                return new Mod_Modules(DT.Rows[0]);
            }
            else
            {
                return null;
            }
        }

        public void LinkRole(int RoleId)
        {
            DataTable DT = Con_RolesPermissions.Insert_RolesPermissions(RoleId, id);
        }

        public void LinkRole(Mod_Roles Role)
        {
            Con_RolesPermissions.Insert_RolesPermissions(Role.ID, id);
        }

        public List<Mod_Roles> Get_Roles()
        {
            List<Mod_Roles> aux = new List<Mod_Roles>();
            DataTable DT = Con_RolesPermissions.Get_RolesPermissions(null, null, id);
            foreach (DataRow DR in DT.Rows)
            {
                aux.Add(new Mod_Roles(DR));
            }
            if (aux != null)
            {
                return aux;
            }
            else
            {
                return null;
            }
        }
    }
}
