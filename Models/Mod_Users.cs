using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Connection;

namespace Models
{
    public class Mod_Users
    {

        /// <summary>
        /// Checks if the credentials are correct when logging in
        /// </summary>
        /// <param name="user">Username</param>
        /// <param name="password">Password</param>
        /// <returns>Returns true if the credentials are correct, false otherwise</returns>
        public static bool Get_UserByUserAndPassword (
            string user,
            string password)
        {
            DataTable DT = Con_Users.Get_User(null, user, null, password, 0);

            if (DT != null && DT.Rows.Count > 0) return true;
            else return false;
        }

        public static DataTable Insert_User(
            string userName,
            string email,
            string password)
        {
            DataTable DT = Con_Users.Insert_User(userName, email, Crypt.StringByMD5(password));

            if (DT != null && DT.Rows.Count > 0) return DT;
            else return null;
        }

    }
}
