using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using Connection;



namespace Models
{
    public class Crypt
    {

        /// <summary>
        /// Encripta un string por MD5
        /// </summary>
        /// <param name="input">String de entrada</param>
        /// <returns>Devuelve un string encriptado por MD5</returns>
        public static string StringByMD5(string input)
        {
            MD5 md5 = MD5.Create();

            byte[] hash = md5.ComputeHash(Encoding.ASCII.GetBytes(input));

            StringBuilder sb = new StringBuilder();
            for (int a = 0; a < hash.Length; a++)
            {
                sb.Append(hash[a].ToString("X2"));
            }

            return sb.ToString();
        }

        public static bool Insert_AccessCode(
            string accessCode,
            int idUser)
        {
            return Con_AccessCodes.Insert_AccessCode(accessCode, idUser, Utils.SQL_To_FullString_DateTime(DateTime.Now));
        }

        public static bool Update_AccessCode(string accessCode)
        {
            return Con_AccessCodes.Update_AccessCode(accessCode);
        }

        public static int Get_IdUserByAccessCode(string accessCode)
        {
            return Con_AccessCodes.Get_IdUserByAccessCode(accessCode);
        }

        public static bool Get_AlreadyUsedByAccessCode(string accessCode)
        {
            bool? alreadyUsed = Con_AccessCodes.Get_AlreadyUsedByAccessCode(accessCode);

            return (alreadyUsed != null) ? alreadyUsed.Value : false;
        }
    }
}
