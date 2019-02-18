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
        /// <summary>
        /// Inserts a new user to the database.
        /// </summary>
        /// <param name="UserName">Username</param>
        /// <param name="Email">User's Email</param>
        /// <param name="Password">Password</param>
        /// <returns>Returns a DataTable with the Id of the inserted user, null if there was an error at the database level.</returns>
        public static DataTable Insert_User(string UserName, string Email, string Password)
        {
            GenesisDataSetTableAdapters.Insert_UserTableAdapter TA = new GenesisDataSetTableAdapters.Insert_UserTableAdapter();
            GenesisDataSet.Insert_UserDataTable DT = new GenesisDataSet.Insert_UserDataTable();
            System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
            TableAdapterManager.ChangeConnection(ref SQLCONN);
            TA.Fill(DT, UserName, Email, Password);

            if ( DT != null && DT.Rows.Count > 0)
            {
                return DT;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Gets users that matches one or more of the search parameters. Returns all users if all parameters are set to null and "Response" is set to 0.
        /// </summary>
        /// <param name="Id">Numeric ID of the user to get</param>
        /// <param name="UserName">Username</param>
        /// <param name="Email">Email</param>
        /// <param name="Password">Password</param>
        /// <param name="Response">The maximum number of users that the SQL Query can return</param>
        /// <returns>Returns a datatable with the user info that matches with the provided parameters, null if there was an error at the SQL level.</returns>
        public static DataTable Get_User(int? Id, string UserName, string Email, string Password, int Response)
        {
            GenesisDataSetTableAdapters.Get_UserTableAdapter TA = new GenesisDataSetTableAdapters.Get_UserTableAdapter();
            GenesisDataSet.Get_UserDataTable DT = new GenesisDataSet.Get_UserDataTable();
            System.Data.SqlClient.SqlConnection SQLCONN = TA.Connection;
            TableAdapterManager.ChangeConnection(ref SQLCONN);
            TA.Fill(DT, Id, UserName, Email, Password, Response);

            if (DT != null && DT.Rows.Count > 0)
            {
                return DT;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Updates information of an existing user.
        /// </summary>
        /// <param name="Id">Numeric ID of the user that's going to be updated</param>
        /// <param name="UserName">New username for the updated user</param>
        /// <param name="Email">New email for the updated user</param>
        /// <param name="Password">New password for the updated user</param>
        /// <returns>Returns true if the user info was updated correctly, false if there was an SQL error.</returns>
        public static bool Update_User(int? Id, string UserName, string Email, string Password)
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

        /// <summary>
        /// Deletes the users that matches one or more of the parameters.
        /// </summary>
        /// <param name="Id">Numeric ID of the user</param>
        /// <param name="UserName">Username</param>
        /// <param name="Email">Email</param>
        /// <returns>Returns true if the users were deleted correctly, false if there was an SQL error.</returns>
        public static bool Delete_User(int? Id, string UserName, string Email)
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
