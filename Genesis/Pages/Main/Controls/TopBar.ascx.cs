using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Genesis.Pages.Main.Controls
{
    /// <summary>
    /// TopBar es la que controla el estado de la sesion del usuario, y la que desencadena redirecciones en caso de accesos no autorizados
    /// </summary>
    public partial class TopBar : System.Web.UI.UserControl
    {


        private string _UserName;

        public string USERNAME { get => _UserName;}



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["sk"] != null)
            {
                string secretkey = Request["sk"];
                //verifica si el codigo esta usado
                if (Models.Crypt.Get_AlreadyUsedByAccessCode(secretkey) == false)
                {

                    int IdUser = Models.Crypt.Get_IdUserByAccessCode(secretkey);

                    if (IdUser != 0)
                    {
                        Mod_Users _User = Mod_Users.Get_UserById(IdUser);
                        if (_User != null)
                        {
                            Session.Add("User", _User);
                            Models.Crypt.Update_AccessCode(secretkey);
                            Redirect(true);
                        }
                        else
                        {
                            Redirect(false);
                        }
                    }
                    else
                    {
                        Redirect(false);
                    }

                }
                else
                {
                    Redirect(false);
                }
            }
            else
            {
                if (Session["User"] != null)
                {
                    _UserName = (Session["User"] as Mod_Users).USERNAME;
                }
                else
                {
                    Redirect(false);
                }
            }
        }

        private void Redirect(bool self)
        {
            if (self == true)
            {
                Response.Redirect("~/Pages/Main/Main.aspx");
            }
            else
            {
                Response.Redirect("~/");
            }
        }

    }
}