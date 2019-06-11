using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

////	Code generated via CodeReplicator v1.2a by Ramiro Suriano, for Olympus Software.	////
////	Date of this code: 11/6/2019										////

namespace Connection
{
	public class Con_Patients
	{

		public static DataTable Get_Patients(int? Id, string FirstName, string LastName, string DNI, string Address, string Town, DateTime DateOfBirth, int? Phone, int? IdObraSocial, int? HealthCareId, string Sex, string Gender, bool ValidateData, int? Response)
		{
			GenesisDispensarioDataSetTableAdapters.Get_PatientsTableAdapter TA = new GenesisDispensarioDataSetTableAdapters.Get_PatientsTableAdapter();
			GenesisDispensarioDataSet.Get_PatientsDataTable DT = new GenesisDispensarioDataSet.Get_PatientsDataTable();
			System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
			TableAdapterManager.ChangeConnection(ref SQLCONN);
			TA.Fill(DT, Id, FirstName, LastName, DNI, Address, Town, DateOfBirth, Phone, IdObraSocial, HealthCareId, Sex, Gender, ValidateData, Response);
			if (DT != null && DT.Rows.Count > 0) { return DT; } else { return null; }
		}

		public static DataTable Insert_Patients(string FirstName, string LastName, string DNI, string Address, string Town, DateTime DateOfBirth, int? Phone, int? IdObraSocial, int? HealthCareId, string Sex, string Gender, bool ValidateData)
		{
			GenesisDispensarioDataSetTableAdapters.Insert_PatientsTableAdapter TA = new GenesisDispensarioDataSetTableAdapters.Insert_PatientsTableAdapter();
			GenesisDispensarioDataSet.Insert_PatientsDataTable DT = new GenesisDispensarioDataSet.Insert_PatientsDataTable();
			System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
			TableAdapterManager.ChangeConnection(ref SQLCONN);
			TA.Fill(DT, FirstName, LastName, DNI, Address, Town, DateOfBirth, Phone, IdObraSocial, HealthCareId, Sex, Gender, ValidateData);
			if (DT != null && DT.Rows.Count > 0) { return DT; } else { return null; }
		}

		public static bool Delete_Patients(int? Id, string FirstName, string LastName, string DNI, string Address, string Town, DateTime DateOfBirth, int? Phone, int? IdObraSocial, int? HealthCareId, string Sex, string Gender, bool ValidateData)
		{
			QTACustomized QTA = new QTACustomized();
			int response = QTA.Delete_Patients(Id, FirstName, LastName, DNI, Address, Town, DateOfBirth, Phone, IdObraSocial, HealthCareId, Sex, Gender, ValidateData);
			if (response > 0) { return true; } else { return false; }
		}

		public static bool Update_Patients(int? Id, string FirstName, string LastName, string DNI, string Address, string Town, DateTime DateOfBirth, int? Phone, int? IdObraSocial, int? HealthCareId, string Sex, string Gender, bool ValidateData)
		{
			QTACustomized QTA = new QTACustomized();
			int response = QTA.Update_Patients(Id, FirstName, LastName, DNI, Address, Town, DateOfBirth, Phone, IdObraSocial, HealthCareId, Sex, Gender, ValidateData);
			if (response > 0) { return true; } else { return false; }
		}

	}
}