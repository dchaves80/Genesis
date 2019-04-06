using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

namespace Genesis.Pages.Main
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Control Pacientes = LoadControl("/Modules/Pacientes/Pacientes.ascx");
            //Control Usuarios = LoadControl("/Modules/Usuarios/Usuarios.ascx");
            //Control Roles = LoadControl("/Modules/Roles/Roles.ascx");
            //ModuleContainer.Controls.Add(Roles);
            if (Request["IDM"] != null)
            {
                Session.Add("ActiveModule", Request["IDM"].ToString());
                Response.Redirect("./Main.aspx");
            }
            else
            {
                if (Session["ActiveModule"] != null)
                {
                    string path = Utils.GetModulePath(int.Parse(Session["ActiveModule"].ToString()));
                    ModuleContainer.Controls.Add(LoadControl(path));
                }
            }
        }
    }
}