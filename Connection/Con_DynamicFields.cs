using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

////	Code generated via CodeReplicator v1.0. By Ramiro Suriano, for Olympus Software.	////
////	Date of this code: 4/19/2019							////

namespace Connection
{
	public class Con_DynamicFields
	{

		public static DataTable Insert_DynamicField(string Name)
		{
			GenesisDataSetTableAdapters.Insert_DynamicFieldTableAdapter TA = new GenesisDataSetTableAdapters.Insert_DynamicFieldTableAdapter();
			GenesisDataSet.Insert_DynamicFieldDataTable DT = new GenesisDataSet.Insert_DynamicFieldDataTable();
			System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
			TableAdapterManager.ChangeConnection(ref SQLCONN);
			TA.Fill(DT, Name);
			if (DT != null && DT.Rows.Count > 0) { return DT; } else { return null; }
		}

		public static DataTable Get_DynamicField(int? Id, string Name, int? Response)
		{
			GenesisDataSetTableAdapters.Get_DynamicFieldTableAdapter TA = new GenesisDataSetTableAdapters.Get_DynamicFieldTableAdapter();
			GenesisDataSet.Get_DynamicFieldDataTable DT = new GenesisDataSet.Get_DynamicFieldDataTable();
			System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
			TableAdapterManager.ChangeConnection(ref SQLCONN);
			TA.Fill(DT, Id, Name, Response);
			if (DT != null && DT.Rows.Count > 0) { return DT; } else { return null; }
		}

		public static bool Update_DynamicField(int Id, string Name)
		{
			QTACustomized QTA = new QTACustomized();
			int response = QTA.Update_DynamicField(Id, Name);
			if (response > 0) { return true; } else { return false; }
		}

		public static bool Delete_DynamicField(int Id, string Name)
		{
			QTACustomized QTA = new QTACustomized();
			int response = QTA.Delete_DynamicField(Id, Name);
			if (response > 0) { return true; } else { return false; }
		}

	}
}