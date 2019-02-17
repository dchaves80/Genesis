using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace Models
{
    public class Crypt
    {

        /// <summary>
        /// Encripta un string por MD5
        /// </summary>
        /// <param name="input">Strijng de entrada</param>
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
    }
}
