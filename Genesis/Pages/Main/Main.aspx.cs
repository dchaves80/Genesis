using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using Models.ConstantLibrary;

namespace Genesis.Pages.Main
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["IDM"] != null)
            {
                Session.Add(Session_Library.ACTIVE_MODULE, Request["IDM"].ToString());
                Response.Redirect("./Main.aspx");
            }
            else
            {
                if (Session[Session_Library.ACTIVE_MODULE] != null)
                {
                    string path = Utils.GetModulePath(int.Parse(Session[Session_Library.ACTIVE_MODULE].ToString()));
                    try
                    {
                        ModuleContainer.Controls.Add(LoadControl(path));
                    }
                    catch (Exception E)
                    {
                        new Mod_Exception(E, Response, "No se puede cargar el módulo " + Session[Session_Library.ACTIVE_MODULE].ToString());
                    }
                }
            }
        }
    }
}