using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Connection;

// Editado el código para simplificarlo en los return - Losha - 2019/04/19 22.18

namespace Models
{
    public class Mod_Modules
    {
        int id;
        string name;
        string path;
        string dll;
        string icon;
        List<Mod_Roles> roles;

        public string NAME { get => name; set => name = value; }
        public string PATH { get => path; set => path = value; }
        public string DLL { get => dll; set => dll = value; }
        public int ID { get => id; set => id = value; }
        public string ICON { get => icon; set => icon = value; }
        public List<Mod_Roles> ROLES { get => roles; set => roles = value; }

        private Mod_Modules(DataRow DR)
        {
            id = int.Parse ( DR["Id"].ToString() );
            name = DR["ModuleName"].ToString();
            path = DR["Ascx"].ToString();
            dll = DR["Dll"].ToString();
            icon = DR["Icon"].ToString();
            ROLES = Get_Permissions();
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

            return (DT != null && DT.Rows.Count > 0) ? new Mod_Modules(DT.Rows[0]) : null;
        }


        ////                                        ////
        ////    Role Permissions for each module    ////
        ////                                        ////
        public bool LinkRole(int RoleId)
        {
            DataTable DT = Con_RolesPermissions.Insert_RolesPermissions(RoleId, id);
            return (DT != null && DT.Rows.Count > 0) ? true : false;
        }
        public bool LinkRole(Mod_Roles Role)
        {
            DataTable DT = Con_RolesPermissions.Insert_RolesPermissions(Role.ID, id);
            return (DT != null && DT.Rows.Count > 0) ? true : false;
        }

        public bool UnlinkRole(int RoleId)
        {
            return Con_RolesPermissions.Delete_RolesPermissions(null, RoleId, id);
        }
        public bool UnlinkRole(Mod_Roles Role)
        {
            return Con_RolesPermissions.Delete_RolesPermissions(null, Role.ID, id);
        }

        public List<Mod_Roles> Get_Permissions()
        {
            List<Mod_Roles> aux = new List<Mod_Roles>();
            DataTable DT = Con_RolesPermissions.Get_RolesPermissions(null, null, id);
            if (DT != null)
            {
                foreach (DataRow DR in DT.Rows)
                {
                    Mod_Roles auxR = Mod_Roles.Get_ById(int.Parse(DR["RoleId"].ToString()));
                    aux.Add(auxR);
                }
                return aux;
            }
            else
            {
                return null;
            }
            
        }
        
    }
}
