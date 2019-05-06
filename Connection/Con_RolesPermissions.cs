using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

////	Code generated via CodeReplicator v1.0. By Ramiro Suriano, for Olympus Software.	////
////	Date of this code: 19/4/2019							                            ////


namespace Connection
{
	public class Con_RolesPermissions
	{

		public static DataTable Insert_RolesPermissions(int? RoleId, int? ModuleId)
		{
			GenesisDataSetTableAdapters.Insert_RolesPermissionsTableAdapter TA = new GenesisDataSetTableAdapters.Insert_RolesPermissionsTableAdapter();
			GenesisDataSet.Insert_RolesPermissionsDataTable DT = new GenesisDataSet.Insert_RolesPermissionsDataTable();
			System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
			TableAdapterManager.ChangeConnection(ref SQLCONN);
			TA.Fill(DT, RoleId, ModuleId);

            return (DT != null && DT.Rows.Count > 0) ? DT : null;
		}

		public static DataTable Get_RolesPermissions(int? Id, int? RoleId, int? ModuleId)
		{
			GenesisDataSetTableAdapters.Get_RolesPermissionsTableAdapter TA = new GenesisDataSetTableAdapters.Get_RolesPermissionsTableAdapter();
			GenesisDataSet.Get_RolesPermissionsDataTable DT = new GenesisDataSet.Get_RolesPermissionsDataTable();
			System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
			TableAdapterManager.ChangeConnection(ref SQLCONN);
			TA.Fill(DT, Id, RoleId, ModuleId);

            return (DT != null && DT.Rows.Count > 0) ? DT : null;
        }

		public static bool Delete_RolesPermissions(int? Id, int? RoleId, int? ModuleId)
		{
			QTACustomized QTA = new QTACustomized();
			int response = QTA.Delete_RolesPermissions(Id, RoleId, ModuleId);

            return response > 0;
		}

	}
}