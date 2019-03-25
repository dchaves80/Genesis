using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Connection
{
	public class Con_Roles
	{

        public static DataTable Get_Roles(
            int? id,
            string role)
        {
            GenesisDataSetTableAdapters.Get_RoleTableAdapter TA =
                new GenesisDataSetTableAdapters.Get_RoleTableAdapter();
            GenesisDataSet.Get_RoleDataTable DT =
                new GenesisDataSet.Get_RoleDataTable();

            System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
            TableAdapterManager.ChangeConnection(ref SQLCONN);

            TA.Fill(DT, id, role);

            if (DT != null && DT.Rows.Count > 0)
                return DT;
            else
                return null;
        }

        public static DataTable Insert_Role(string role)
        {
            GenesisDataSetTableAdapters.Insert_RoleTableAdapter TA =
                new GenesisDataSetTableAdapters.Insert_RoleTableAdapter();
            GenesisDataSet.Insert_RoleDataTable DT =
                new GenesisDataSet.Insert_RoleDataTable();

            TA.Fill(DT, role);

            if (DT != null && DT.Rows.Count > 0)
                return DT;
            else
                return null;
        }

		public static bool Update_Role(
            int? Id,
            string Role)
		{
			QTACustomized QTA = new QTACustomized();

			if (QTA.Update_Role(Id, Role) > 0)
                return true;
            else
                return false;
		}

        public static bool Delete_Role(
            int? id,
            string role)
        {
            QTACustomized QTA = new QTACustomized();

            if (QTA.Delete_Role(id, role) > 0)
                return true;
            else
                return false;
        }
	}
}