using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Utils
    {
        public static string SQL_To_FullString_DateTime(DateTime p)
        {
            string day = p.Day.ToString();
            string month = p.Month.ToString();
            string year = p.Year.ToString();
            string hour = p.Hour.ToString();
            string minutes = p.Minute.ToString();
            string seconds = p.Second.ToString();
            string completeSTR = year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
            return completeSTR;
        }
    }
}
