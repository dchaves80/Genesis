﻿using System;
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
        int id;
        string username;
        string email;
        string password;

        public int ID { get => id; }
        public string USERNAME { get => username; }
        public string EMAIL { get => email; }
        public string PASSWORD { get => password; }

        private Mod_Users(DataRow DR)
        {
            id = int.Parse(DR["Id"].ToString());
            username = DR["UserName"].ToString();
            email = DR["Email"].ToString();
            password = DR["Password"].ToString();
        }


        /// <summary>
        /// Checks if the credentials are correct when logging in
        /// </summary>
        /// <param name="user">Username</param>
        /// <param name="password">Password</param>
        /// <returns>Returns true if the credentials are correct, false otherwise</returns>
        public static Mod_Users Get_UserByUserAndPassword (
            string user,
            string password)
        {
            DataTable DT = Con_Users.Get_User(null, user, null, password, 0);
            if (DT != null && DT.Rows.Count > 0)
                return new Mod_Users(DT.Rows[0]);
            else
                return null;
        }


        public static Mod_Users Insert_User(
            string userName,
            string email,
            string password)
        {
            int Id = int.Parse(Con_Users.Insert_User(userName, email, Crypt.StringByMD5(password)).Rows[0][0].ToString());
            DataTable DT = Con_Users.Get_User(Id, null, null, null, 0);


            if (DT != null && DT.Rows.Count > 0)
                return new Mod_Users(DT.Rows[0]);
            else
                return null;
        }



        public static Mod_Users Get_UserByUsername(string username)
        {
            DataTable DT = Con_Users.Get_User(null, username, null, null, 0);

            if (DT != null && DT.Rows.Count > 0)
                return new Mod_Users(DT.Rows[0]);
            else
                return null;
        }

    }
}
