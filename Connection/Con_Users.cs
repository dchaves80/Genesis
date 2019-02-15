using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Connection
{
    public class Con_Users
    {

        public static DataTable Insert_User(string UserName, string Email, string Password)
        {
            GenesisDataSetTableAdapters.Insert_UserTableAdapter TA = new GenesisDataSetTableAdapters.Insert_UserTableAdapter();
            GenesisDataSet.Insert_UserDataTable DT = new GenesisDataSet.Insert_UserDataTable();
            System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
            Connection.TableAdapterManager.ChangeConnection(ref SQLCONN);
            
            if ( DT != null && DT.Rows.Count > 0)
            {
                return DT;
            }
            else
            {
                return null;
            }
        }

        public static DataTable Get_User(int? Id, string UserName, string Email, string Password)
        {
            GenesisDataSetTableAdapters.Get_UserTableAdapter TA = new GenesisDataSetTableAdapters.Get_UserTableAdapter();
            GenesisDataSet.Get_UserDataTable DT = new GenesisDataSet.Get_UserDataTable();
            System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
            Connection.TableAdapterManager.ChangeConnection(ref SQLCONN);

            TA.Fill(DT, Id, UserName, Email, Password);

            if (DT != null && DT.Rows.Count > 0)
            {
                return DT;
            }
            else
            {
                return null;
            }
        }

        public static bool Update_User(int Id, string UserName, string Email, string Password)
        {
            QTACustomized QTA = new QTACustomized();
            int response = QTA.Update_User(Id, UserName, Email, Password);
            if (response > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool Delete_User(int Id, string UserName, string Email)
        {
            QTACustomized QTA = new QTACustomized();
            int response = QTA.Delete_User(Id, UserName, Email);
            if (response > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
