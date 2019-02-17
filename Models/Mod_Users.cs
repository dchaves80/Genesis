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
        /// Se fija si las credenciales son correctas o no al loguear
        /// </summary>
        /// <param name="user">Username del usuario</param>
        /// <param name="password">Password del usuario</param>
        /// <returns>Devuelve true si son correctas, false si no</returns>
        public static bool Get_UserByUserAndPassword (
            string user,
            string password)
        {
            DataTable DT = Con_Users.Get_User(null, user, null, password, 0);

            if (DT != null && DT.Rows.Count > 0) return true;
            else return false;
        }

    }
}
