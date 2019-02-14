using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Connection;

namespace Business
{
    public class Bus_Users
    {

        public static bool Get_UserByUserAndPassword (
            string user,
            string password)
        {
            DataTable DT = Con_Users.Get_User(null, user, null, password);

            if (DT != null && DT.Rows.Count > 0) return true;
            else return false;
        }
    }
}
