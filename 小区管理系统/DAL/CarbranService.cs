using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static  class CarbranService
    {
        //修改 （报备车库）、
        public static bool UpdateCarbarn(Carbarn carbarn)
        {
            string sql = "Update Carbarn set  ResidentId=" + carbarn.ResidentId + ",ResidentName = '" + carbarn.ResidentName + "',Phone='" + carbarn.Phone + "',State=" + carbarn.State + " where CarbarnName = '"+ carbarn.CarbarnName+"'";
            return DBHelper.ExcuteSql(sql);
        }
        //修改车库编号
        public static bool UpdateCarbarn3(Carbarn carbarn)
        {
            string sql = "Update Carbarn set CarbarnName = '"+carbarn.CarbarnName+"' where Id = '" + carbarn.Id + "'";
            return DBHelper.ExcuteSql(sql);
        }
        //初始化
        public static bool UpdateCarbarn2(Carbarn carbarn)
        {
            string sql = "Update Carbarn set  ResidentId=" + carbarn.ResidentId + ",ResidentName = '" + carbarn.ResidentName + "',Phone='" + carbarn.Phone + "',State=" + carbarn.State + " where Id = '" + carbarn.Id + "'";
            return DBHelper.ExcuteSql(sql);
        }
        //新增
        public static bool ADDCarbarn(Carbarn carbarn)
        {
            string sql = "insert into Carbarn values('"+carbarn.CarbarnName+"',"+carbarn.ResidentId+",'"+carbarn.ResidentName+"','"+carbarn.Phone+"',"+carbarn.State+")";
            return DBHelper.ExcuteSql(sql);
        }
        //模糊查询
        public static DataTable FindMHAllCarbarn(string name, string ownername)
        {
            string sql = "select * from Carbarn where CarbarnName LIKE '%" + name + "%' and ResidentName LIKE '%" + ownername + "%' ";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //删除
        public static bool DeleteCarbarn(int id)
        {
            string sql = "delete from Carbarn where Id = " + id + "";
            return DBHelper.ExcuteSql(sql);
        }
        //查询所有车库信息
        public static DataTable FindAllCarbarn()
        {
         
            string sql = "select * from Carbarn";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //根据主键查询车库编号
        public static string FindCarbarnName(int id)
        {
            string sql = "select CarbarnName from Carbarn where Id = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);

            if (!string.IsNullOrEmpty(table.Rows[0]["CarbarnName"].ToString()))
            {
                string carbarnname = Convert.ToString(table.Rows[0]["CarbarnName"]);
                return carbarnname;
            }
            else
            {
                return "0";
            }
        }
        //查询车库所有者ID
        public static int FindCarbarnResidentId(int id)
        {
            string sql = "select ResidentId from Carbarn where Id = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);
          
            if (!string.IsNullOrEmpty(table.Rows[0]["ResidentId"].ToString()))
            {
                int residentid = Convert.ToInt32(table.Rows[0]["ResidentId"]);
                return residentid;
            }
            else
            {
                return -1;
            }
        }
        public static double FindHouseArea(int id)
        {
            string sql = "select Area from House where OwnerId = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);

            if (!string.IsNullOrEmpty(table.Rows[0]["Area"].ToString()))
            {
                double residentid = Convert.ToInt32(table.Rows[0]["Area"]);
                return residentid;
            }
            else
            {
                return -1;
            }
        }
    }
}
