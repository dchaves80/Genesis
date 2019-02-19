using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Connection
{
    public class Con_Modules
    {

        /// <summary>
        /// Inserts a new module to the DataBaser
        /// </summary>
        /// <param name="ModuleName">ModuleName</param>
        /// <param name="Ascx">Module's ascx</param>
        /// <param name="Dll">Module's dll</param>
        /// <returns>Returns a DataRow with the id of the inserted user,
        /// null if there was an error at the SQL level.</returns>
        public static DataRow Insert_Module(
            string ModuleName,
            string Ascx,
            string Dll)
        {
            GenesisDataSetTableAdapters.Insert_ModuleTableAdapter TA =
                new GenesisDataSetTableAdapters.Insert_ModuleTableAdapter();
            GenesisDataSet.Insert_ModuleDataTable DR =
                new GenesisDataSet.Insert_ModuleDataTable();

            System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
            TableAdapterManager.ChangeConnection(ref SQLCONN);

            TA.Fill(DR, ModuleName, Ascx, Dll);

            if (DR != null && DR.Rows.Count > 0)
                return DR[0];
            else
                return null;                
        }

        public static DataTable Get_Modules(
            int? Id,
            string ModuleName,
            string Ascx,
            string Dll)
        {
            return null;
        }

    }
}
