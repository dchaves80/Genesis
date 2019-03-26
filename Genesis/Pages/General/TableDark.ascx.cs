using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Genesis.Pages.General
{
    public partial class TableDark : System.Web.UI.UserControl
    {
        string idControl;
        string th;        

        /// <summary>
        /// Cabeceras
        /// </summary>
        public string Th { get => th; set => th = value; }

        /// <summary>
        /// Id del control
        /// </summary>
        public string IdControl { get => idControl; set => idControl = value; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] cabeceras = Th.Split(',');
           
        }
    }
}