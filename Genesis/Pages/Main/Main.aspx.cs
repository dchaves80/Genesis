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

                switch (Request["IDM"])
                {
                    case "-1":
                        Session.Add(Session_Library.ACTIVE_MODULE, "-1");
                        Response.Redirect("./Main.aspx");
                        break;
                    default:
                        Session.Add(Session_Library.ACTIVE_MODULE, Request["IDM"].ToString());
                        Response.Redirect("./Main.aspx");
                        break;
                }


                

            }


            else
            {
                if (Session[Session_Library.ACTIVE_MODULE] != null)
                {
                    switch (int.Parse(Session[Session_Library.ACTIVE_MODULE].ToString())) {
                        case -1:
                            ModuleContainer.Controls.Add(LoadControl("/Modules/Profile/Profile.ascx"));
                            break;
                        default:
                            string path = Utils.GetModulePath(int.Parse(Session[Session_Library.ACTIVE_MODULE].ToString()));
                            try
                            {
                                ModuleContainer.Controls.Add(LoadControl(path));
                            }
                            catch (Exception E)
                            {
                                new Mod_Exception(E, Response, "No se puede cargar el módulo " + Session[Session_Library.ACTIVE_MODULE].ToString());
                            }
                            break;
                            
                    }
                }
            }
        }
    }
}