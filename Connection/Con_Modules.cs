using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

////	Code generated via CodeReplicator v1.0. By Ramiro Suriano, for Olympus Software.	////
////	Date of this code: 6/4/2019							                                ////

namespace Connection
{
	public class Con_Modules
	{

		public static DataTable Insert_Module(string ModuleName, string Ascx, string Dll, string Icon)
		{
			GenesisDataSetTableAdapters.Insert_ModuleTableAdapter TA = new GenesisDataSetTableAdapters.Insert_ModuleTableAdapter();
			GenesisDataSet.Insert_ModuleDataTable DT = new GenesisDataSet.Insert_ModuleDataTable();
			System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
			TableAdapterManager.ChangeConnection(ref SQLCONN);
			TA.Fill(DT, ModuleName, Ascx, Dll, Icon);
			if (DT != null && DT.Rows.Count > 0) { return DT; } else { return null; }
		}

		public static DataTable Get_Module(int? Id, string ModuleName, string Ascx, string Dll, string Icon)
		{
			GenesisDataSetTableAdapters.Get_ModuleTableAdapter TA = new GenesisDataSetTableAdapters.Get_ModuleTableAdapter();
			GenesisDataSet.Get_ModuleDataTable DT = new GenesisDataSet.Get_ModuleDataTable();
			System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
			TableAdapterManager.ChangeConnection(ref SQLCONN);
			TA.Fill(DT, Id, ModuleName, Ascx, Dll, Icon);
			if (DT != null && DT.Rows.Count > 0) { return DT; } else { return null; }
		}

		public static bool Delete_Module(int Id, string ModuleName)
		{
			QTACustomized QTA = new QTACustomized();
			int response = QTA.Delete_Module(Id, ModuleName);
			if (response > 0) { return true; } else { return false; }
		}

	}
}