using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacientes
{
    public partial class WebServicePacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string content = "null";

            Response.Clear();
            Response.ClearHeaders();

            if (Request["getPatientsByParam"] != null)
                content = GetPatients(Request["patientParam"]);

            Response.Write(content);
            Response.Flush();
            Response.End();
        }


        /// <summary>
        /// Search patients by a parameter (DNI or name)
        /// </summary>
        /// <param name="param">Patient's parameter (DNI or NAME)</param>
        /// <returns>Returns a serialized string</returns>
        private string GetPatients(string param)
        {
            // Check if the patient's param contains a number
            if (param.All(char.IsDigit))
            {
                // Is a number
                return  "[" +
                        "{\"NOMBRE\":\"Alejandro\",\"APELLIDO\":\"Pérez\",\"DNI\":42673345}," +
                        "{\"NOMBRE\":\"David Leonardo\",\"APELLIDO\":\"Chaves\",\"DNI\":17697231}," +
                        "{\"NOMBRE\":\"Ramiro\",\"APELLIDO\":\"Suriano\",\"DNI\":38147951}]";
            }
            else
            {
                // Itsn't a number
            }

            return "TEst";
        }
        
    }
}