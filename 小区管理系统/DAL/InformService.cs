using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static  class InformService
    {
        public static bool ADDcontent(Inform inform)
        {
            string sql = "insert into Inform values('"+inform.InformName+"','"+inform.SenderId+ "','"+inform.Sender+"',"+inform.ResidentId+",'" + inform.content + "','"+inform.time+"','"+inform.timeEnd+"' ) ";
            return DBHelper.ExcuteSql(sql);
        }
        //查询通知姓名编号
        public static string FindAll(int id)
        {
            string sql = "select content from Inform where ResidentId = "+id+" ";
            DataTable table = DBHelper.GetDataTable(sql);
            if (table != null && table.Rows.Count > 0)
            {         
                string cont = table.Rows[0]["content"].ToString();
                return cont; 
            }
            else
            {
                return null; 
            }
        }
        public static DataTable FindAllInform(int id)
        {
            string sql = "select * from Inform where ResidentId = "+id+"";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }

        public static bool DeleteInform(int Id)
        {
            string sql = "delete from Inform where Id = " + Id + "";
            return DBHelper.ExcuteSql(sql);
        }

        public static DataTable FindById(int id)
        {
            string sql = "select * from Inform where Id = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
    }
}
