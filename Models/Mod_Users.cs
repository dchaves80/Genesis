using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Connection;

// Editado el código para simplificarlo en los return - Losha - 2019/04/19 22.24

namespace Models
{
    public class Mod_Users
    {
        int id;
        string username;
        string email;
        string password;
        List<Mod_Roles> roles;

        public int ID { get => id; }
        public string USERNAME { get => username; }
        public string EMAIL { get => email; }
        public string PASSWORD { get => password; }
        public List<Mod_Roles> ROLES { get => roles; }

        private Mod_Users(DataRow DR)
        {
            id = int.Parse(DR["Id"].ToString());
            username = DR["UserName"].ToString();
            email = DR["Email"].ToString();
            password = DR["Password"].ToString();
            GetRoles();
        }


        /// <summary>
        /// Checks if the credentials are correct when logging in
        /// </summary>
        /// <param name="user">Username</param>
        /// <param name="password">Password</param>
        /// <returns>Returns true if the credentials are correct, false otherwise</returns>
        public static Mod_Users Get_ByUserAndPassword (
            string user,
            string password)
        {
            DataTable DT = Con_Users.Get_User(null, user, null, password, 0);
            //if (DT != null && DT.Rows.Count > 0)
            //    return new Mod_Users(DT.Rows[0]);
            //else
            //    return null;

            return (DT != null && DT.Rows.Count > 0) ? new Mod_Users(DT.Rows[0]) : null;
        }

        public static List<Mod_Users> Get_All()
        {
            DataTable DT = Con_Users.Get_User(null, null, null, null, 0);
            if (DT != null && DT.Rows.Count > 0)
            {
                List<Mod_Users> aux = new List<Mod_Users>();
                foreach (DataRow DR in DT.Rows)
                {
                    aux.Add(new Mod_Users(DR));
                }
                return aux;
            }
            else { return null; }
        }


        public static Mod_Users New(
            string userName,
            string email,
            string password)
        {
            int id = int.Parse(Con_Users.Insert_User(userName, email, Crypt.StringByMD5(password)).Rows[0][0].ToString());
            DataTable DT = Con_Users.Get_User(id, null, null, null, 0);


            //if (DT != null && DT.Rows.Count > 0)
            //    return new Mod_Users(DT.Rows[0]);
            //else
            //    return null;

            return (DT != null && DT.Rows.Count > 0) ? new Mod_Users(DT.Rows[0]) : null;
        }

        public static Mod_Users Get_ById(int Id)
        {
            DataTable DT = Con_Users.Get_User(Id, null, null, null, 1);
            //if (DT != null && DT.Rows.Count > 0)
            //    return new Mod_Users(DT.Rows[0]);
            //else
            //    return null;

            return (DT != null && DT.Rows.Count > 0) ? new Mod_Users(DT.Rows[0]) : null;
        }

        public static Mod_Users Get_ByUsername(string username)
        {
            DataTable DT = Con_Users.Get_User(null, username, null, null, 0);

            //if (DT != null && DT.Rows.Count > 0)
            //    return new Mod_Users(DT.Rows[0]);
            //else
            //    return null;

            return (DT != null && DT.Rows.Count > 0) ? new Mod_Users(DT.Rows[0]) : null;
        }


        ////                                        ////
        ////    Role settings for each user         ////
        ////                                        ////
        public bool AddRole(int RoleId)
        {
            DataTable DT = Con_UsersRoles.Insert_UsersRoles(ID, RoleId);
            return (DT != null && DT.Rows.Count > 0) ? true : false;
        }
        public bool AddRole(Mod_Roles Role)
        {
            DataTable DT = Con_UsersRoles.Insert_UsersRoles(ID, Role.ID);
            return (DT != null && DT.Rows.Count > 0) ? true : false;
        }

        public bool RemoveRole(int RoleId)
        {
            return Con_UsersRoles.Delete_UsersRoles(null, ID, RoleId);
        }
        public bool RemoveRole(Mod_Roles Role)
        {
            return Con_UsersRoles.Delete_UsersRoles(null, ID, Role.ID);
        }

        private void GetRoles()
        {
            List<Mod_Roles> aux = new List<Mod_Roles>();
            DataTable DT = Con_UsersRoles.Get_UsersRoles(null, id, null);
            if (DT != null)
            {
                roles = new List<Mod_Roles>();
                foreach (DataRow DR in DT.Rows)
                {
                    Mod_Roles auxR = Mod_Roles.Get_ById(int.Parse(DR["RoleId"].ToString()));
                    roles.Add(auxR);
                }
                
            }
            
            
        }
    }
}
