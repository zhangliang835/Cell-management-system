using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static  class FamilyServise
    {
        //查询家庭成员
        public static DataTable FindAll(int ID)
        {        
            string sql = "select f.*,r.Name from Family as f left join Resident as r on f.ResidentId = r.Id where r.Id = "+ID+"";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //报备家庭成员
        public static bool FamilyADD(Family family)
        {
            string sql = "insert into Family values ('" + family.Name1 + "'," + family.ResidentId + ",'" + family.Relation + "','" + family.FamilyPhoto + "',"+family.FamilySex+")";
            return DBHelper.ExcuteSql(sql);
        }
        //删除家庭成员

        public static bool DeleteFamily(int id)
        {
            string sql = "delete from Family where Id = " + id + "";
            return DBHelper.ExcuteSql(sql);
        }
    }
}
