using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

////	Code generated via CodeReplicator v1.0. By Ramiro Suriano, for Olympus Software.	////
////	Date of this code: 26/3/2019							                            ////

namespace Connection
{
	public class Con_UsersRoles
	{

		public static DataTable Get_UsersRoles(int? Id, int? UserId, int? RoleId)
		{
			GenesisDataSetTableAdapters.Get_UsersRolesTableAdapter TA = new GenesisDataSetTableAdapters.Get_UsersRolesTableAdapter();
			GenesisDataSet.Get_UsersRolesDataTable DT = new GenesisDataSet.Get_UsersRolesDataTable();
			System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
			TableAdapterManager.ChangeConnection(ref SQLCONN);
			TA.Fill(DT, Id, UserId, RoleId);
			if (DT != null && DT.Rows.Count > 0) { return DT; } else { return null; }
		}

		public static DataTable Insert_UsersRoles(int? UserId, int? RoleId)
		{
			GenesisDataSetTableAdapters.Insert_UsersRolesTableAdapter TA = new GenesisDataSetTableAdapters.Insert_UsersRolesTableAdapter();
			GenesisDataSet.Insert_UsersRolesDataTable DT = new GenesisDataSet.Insert_UsersRolesDataTable();
			System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
			TableAdapterManager.ChangeConnection(ref SQLCONN);
			TA.Fill(DT, UserId, RoleId);
			if (DT != null && DT.Rows.Count > 0) { return DT; } else { return null; }
		}

		public static bool Update_UsersRoles(int Id, int UserId, int RoleId)
		{
			QTACustomized QTA = new QTACustomized();
			int response = QTA.Update_UsersRoles(Id, UserId, RoleId);
			if (response > 0) { return true; } else { return false; }
		}

		public static bool Delete_UsersRoles(int Id, int UserId, int RoleId)
		{
			QTACustomized QTA = new QTACustomized();
			int response = QTA.Delete_UsersRoles(Id, UserId, RoleId);
			if (response > 0) { return true; } else { return false; }
		}

	}
}