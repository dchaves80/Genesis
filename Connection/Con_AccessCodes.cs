using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Connection
{
    // Editado el código para simplificarlo en los return - Losha - 2019/04/19 21.55

    public static class Con_AccessCodes
    {
        public static bool Insert_AccessCode(
            string accessCode,
            int idUser,
            string loginDate)
        {
            QTACustomized QTA = new QTACustomized();
            int a = QTA.Insert_AccessCode(accessCode, idUser, loginDate, false);

            return a == 1;
            
        }

        public static int Get_IdUserByAccessCode(string accessCode)
        {
            GenesisDataSetTableAdapters.Get_IdUserByAccessCodeTableAdapter TA =
                new GenesisDataSetTableAdapters.Get_IdUserByAccessCodeTableAdapter();
            GenesisDataSet.Get_IdUserByAccessCodeDataTable DT =
                new GenesisDataSet.Get_IdUserByAccessCodeDataTable();

            System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
            TableAdapterManager.ChangeConnection(ref SQLCONN);

            TA.Fill(DT, accessCode);

            return (DT.Rows.Count > 0) ? int.Parse(DT.Rows[0][0].ToString()) : 0;
        }

        public static bool Update_AccessCode(string accessCode)
        {
            QTACustomized QTA = new QTACustomized();
            int a = QTA.Update_AccessCode(accessCode);

            return a == 1;            
        }

        public static bool? Get_AlreadyUsedByAccessCode(string accessCode)
        {
            GenesisDataSetTableAdapters.Get_AlreadyUsedByAccessCodeTableAdapter TA =
                new GenesisDataSetTableAdapters.Get_AlreadyUsedByAccessCodeTableAdapter();
            GenesisDataSet.Get_AlreadyUsedByAccessCodeDataTable DT =
                new GenesisDataSet.Get_AlreadyUsedByAccessCodeDataTable();

            System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
            TableAdapterManager.ChangeConnection(ref SQLCONN);

            TA.Fill(DT, accessCode);

            if (DT.Rows.Count > 0)
                return bool.Parse(DT.Rows[0][0].ToString());
            else
                return null;

            //bool? a = DT.Rows.Count > 0 ? bool.Parse(DT.Rows[0][0].ToString()) : null;
        }
    }
}
