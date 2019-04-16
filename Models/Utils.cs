using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;

namespace Models
{
    public class Utils
    {
        /// <summary>
        /// Convierte objeto DateTime a string compatible con datetime de sql
        /// </summary>
        /// <param name="p">Objeto DateTime a convertir</param>
        /// <returns></returns>
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

        /// <summary>
        /// Incluye el tag <Script></Script> con sus respectivas propiedades en la cabecera de una pagina
        /// </summary>
        /// <param name="Path">Raw html path</param>
        /// <param name="Page">Suele ser "this" si se invoca desde modulo o control</param>
        public static void IncludeJavaScript(string Path, Page Page)
        {
            //<script src="//static.h-bid.com/sncmp/sncmp_stub.min.js" type="text/javascript"></script>
            System.Web.UI.HtmlControls.HtmlGenericControl Meta1 = new System.Web.UI.HtmlControls.HtmlGenericControl("script");
            Meta1.Attributes.Add("src", Path);
            Meta1.Attributes.Add("type", "text/javascript");
            Page.Header.Controls.Add(Meta1);
        }

        
        /// <summary>
        /// Obtiene el path de un modulo 
        /// </summary>
        /// <param name="IdModule">Id del modulo</param>
        /// <returns></returns>
        public static string GetModulePath(int IdModule)
        {
            Mod_Modules aux = Mod_Modules.Get_ById(IdModule);
            return aux.Path;
        }
    }
}
