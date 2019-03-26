using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Genesis.Pages.General
{
    public partial class TextInputDark : System.Web.UI.UserControl
    {
        string idControl;
        string placeholder;
        string name;

        /// <summary>
        /// ID del control
        /// </summary>
        public string IdControl { get => idControl; set => idControl = value; }

        /// <summary>
        /// Placeholder del input
        /// </summary>
        public string Placeholder { get => placeholder; set => placeholder = value; }

        /// <summary>
        /// Nombre que muestra el input
        /// </summary>
        public string ControlName { get => name; set => name = value; }


        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}