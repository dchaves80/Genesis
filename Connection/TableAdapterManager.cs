using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Web.Configuration;

namespace Connection
{

    public class QTACustomized : GenesisDataSetTableAdapters.QueriesTableAdapter
    {

        public QTACustomized() 
        {
            ChangeConnectionString();
        }

        public void ChangeConnectionString()
        {
            foreach (IDbCommand i in CommandCollection)
            {

                i.Connection.ConnectionString = WebConfigurationManager.AppSettings["ConnectionString"];
            }
        }

    }

    public static class TableAdapterManager
    {
       public static void ChangeConnection (ref System.Data.SqlClient.SqlConnection MyConnection)
       {



           string connection = WebConfigurationManager.AppSettings["ConnectionString"];
           MyConnection.ConnectionString = connection;
           
       
       }
    }
}
