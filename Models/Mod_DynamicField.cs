using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Mod_DynamicField
    {
        int id;
        string name;


        public int ID { get => id; }
        public string NAME { get => name; }

        private Mod_DynamicField(DataRow dr)
        {
            id = int.Parse(dr["Id"].ToString());
            name = dr["Name"].ToString();
        }

        public void Delete()
        {
            Connection.Con_DynamicFields.Delete_DynamicField(id, null);
           
        }

        public static Mod_DynamicField New(string Name)
        {
            DataTable dt = Connection.Con_DynamicFields.Insert_DynamicField(Name);

            return new Mod_DynamicField(dt.Rows[0]);
        }

        public Mod_DynamicField Update(string NewName)
        {
            Connection.Con_DynamicFields.Update_DynamicField(id, NewName);
            return GetById(id);

        }

        public static Mod_DynamicField GetById(int Id)
        {
            DataTable dt = Connection.Con_DynamicFields.Get_DynamicField(Id, null, null);
            if (dt.Rows.Count > 0)
            {
                return new Mod_DynamicField(dt.Rows[0]);
            }
            return null;
        }

        public static List<Mod_DynamicField> Get_All()
        {
           DataTable dt =  Connection.Con_DynamicFields.Get_DynamicField(null, null, null);
            if (dt != null)
            {
                List<Mod_DynamicField> l = new List<Mod_DynamicField>();
                foreach (DataRow dr in dt.Rows)
                {
                    l.Add(new Mod_DynamicField(dr));
                }
                return l;
            }
            return null;
        }

    }
}
