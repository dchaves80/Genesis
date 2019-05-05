using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Models
{
    public class Mod_Exception
    {
        string main_Message;
        StackTrace main_st;
        
        public Mod_Exception(Exception E, HttpResponse R, string CustomMessage=null)
        {
            main_Message = E.Message;
            main_st = new StackTrace(E, true);
            string baseguid = Guid.NewGuid().ToString().Replace("-","1");
            baseguid = "guid" + baseguid.Substring(0, 10);

            R.Write("<script>");
            R.Write("function showerrors"  + baseguid + "(){");
            R.Write("if ($(\".classguid\" + \"" + baseguid + "\").is(\":visible\")){");
            R.Write("$(\".classguid\" + \"" + baseguid + "\").hide();");
            R.Write("} else { $(\".classguid\" + \"" + baseguid + "\").show(); }");
            R.Write("}");
            
            R.Write("</script>" + Environment.NewLine);

            R.Write("<div style=\"padding: 10px 10px 10px 10px; border-width:1px; border-style:solid; border-color:red\">" + Environment.NewLine);
            R.Write("<input type=\"button\" value=\"Extender Detalle\" onclick=\"showerrors" + baseguid +  "()\">" + Environment.NewLine);
            R.Write("<div style=\"color:white\">Error: " + main_Message + "</div>" + Environment.NewLine);
            if (CustomMessage != null)
            {
                R.Write("<div class=\"classguid" + baseguid + "\" style=\"color:white\">Error: " + CustomMessage + "</div>" + Environment.NewLine);
            }
            foreach (StackFrame sf in main_st.GetFrames())
            {
                R.Write("<Div class=\"classguid" + baseguid + "\" style=\"padding:10px 10px 10px 10px;margin-top:10px 10px 10px 10px\">" + Environment.NewLine);
                R.Write("<div><b>Archivo:</b>" + sf.GetFileName() + "</div>" + Environment.NewLine);
                R.Write("<div><b>Metodo:</b>" + sf.GetMethod().Name + "</div>" + Environment.NewLine);
                R.Write("<div><b>Linea:</b>" + sf.GetFileLineNumber().ToString() + "</div>" + Environment.NewLine);
                R.Write("</Div>");
            }
            R.Write("</div>" + Environment.NewLine);
            R.Write("<script>");
            R.Write("$(\".classguid\" + \"" + baseguid + "\").hide();");
            R.Write("</script>");

        }
    }
}
