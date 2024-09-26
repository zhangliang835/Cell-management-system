using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static  class ServeService
    {
        //新增
        public static bool Add(Serve serve)
        {
            string sql = "insert into Serve values ('" + serve.Name + "','" + serve.price + "','" + serve.OrderNumber + "','" + serve.Area + "','" + serve .SMTime + "','" + serve .Phone + "',"+serve.ResId+",'" + serve.ResName + "','" + serve.BeiZhu + "',"+serve.State+",'"+serve.DownPayment+"',"+serve.Type+","+serve.FenPei+","+serve.Grade+",'"+serve.Estimate+"')";
            return DBHelper.ExcuteSql(sql);
        }

        //查询全部
        public static DataTable FindAll()
        {        
            string sql = "select * from Serve order by case State when 1 then 1 when 0 then 2 when 3 then 3 else 5 end";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //根据业主ID查询订单
        public static DataTable FindAllByResidentID(int id)
        {
            string sql = "select * from Serve  where ResId = "+id+ " order by case State when 1 then 1 when 0 then 2 when 3 then 3 else 5 end";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //获取上门时间
        public static DateTime FindShangMenTime(int id)
        {
            string sql = "select SMTime from Serve where Id = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);
            if (table.Rows.Count > 0)
            {
                DateTime shangMenTime = Convert.ToDateTime(table.Rows[0]["SMTime"]);
                return shangMenTime;
            }
            else
            {
                throw new Exception("没有找到对应Id的数据"); 
            }
        }
        //业主对服务进行打分评价
        public static bool UpdateServeGrade(Serve serve)
        {
            string sql = "update Serve set Grade=" + serve.Grade + ",Estimate = '" + serve.Estimate+"'where Id="+serve.Id+"";
            return DBHelper.ExcuteSql(sql);
        }
        //修改进度状态
        public static bool UpdateServeState(Serve serve)
        {
            string sql = "update Serve set State=" + serve.State + "where OrderNumber=" +serve.OrderNumber+ "";
            return DBHelper.ExcuteSql(sql);
        }
        //修改进度状态、价格
        public static bool  UpdateStatePrice(Serve serve)
        {
            string sql = "update Serve set State=" + serve.State + ", price='" + serve.price+"' where OrderNumber=" + serve.OrderNumber + "";
            return DBHelper.ExcuteSql(sql);
        }
        //修改分配进度
        public static bool UpdateServeFenPei(Serve serve)
        {
            string sql = "update Serve set FenPei=" + serve.FenPei + " where Id = "+serve.Id+"";
            return DBHelper.ExcuteSql(sql);
        }
        //项目名称模糊查询、上门时间查询
        public static DataTable Findnametime2(string reisentname, string state, string end,string ordernumber)
        {
            string sql = "SELECT * FROM Serve WHERE 1=1";

            if (!string.IsNullOrEmpty(reisentname))
            {
                sql += "and Name LIKE '%" + reisentname + "%' ";
            }
            if (!string.IsNullOrEmpty(state) && !string.IsNullOrEmpty(end))
            {
                DateTime startDate = DateTime.ParseExact(state, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                DateTime endDate = DateTime.ParseExact(end, "yyyy-MM-dd", CultureInfo.InvariantCulture).AddDays(1).AddTicks(-1); // 添加一天再减去一个ticks，使得endDate是整天的结束时刻

                sql += $"and SMTime BETWEEN '{startDate.ToString("yyyy-MM-dd HH:mm:ss")}' AND '{endDate.ToString("yyyy-MM-dd HH:mm:ss")}'";
            }
            if (!string.IsNullOrEmpty(ordernumber))
            {
                sql += "and OrderNumber LIKE '%" + ordernumber + "%'";
            }
            if (!string.IsNullOrEmpty(state) && string.IsNullOrEmpty(end))
            {
                sql += $"and CONVERT(date, SMTime) = CONVERT(date, '{state}')";
            }
            sql += " ORDER BY CASE State WHEN 1 THEN 1 WHEN 0 THEN 2 WHEN 3 THEN 3 ELSE 5 END";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }

        //项目名称模糊查询、上门时间、项目类型、状态查询

        public static DataTable Findnametime(string residentName, string startDate, string endDate, int? paidStatus, int? sypeId,string ordernumber)
        {
            string sql = "SELECT * FROM Serve WHERE 1=1";
            if (paidStatus != 4)
            {
                sql += $" AND State = {paidStatus.Value}";
            }
            if (sypeId != 9)
            {
                sql += $" AND Type = {sypeId.Value}";
            }
            if (!string.IsNullOrEmpty(ordernumber))
            {
                sql += "and OrderNumber LIKE '%" + ordernumber + "%'";
            }
            if (!string.IsNullOrEmpty(residentName))
            {
                sql += " AND Name LIKE '%" + residentName + "%'";
            }

            if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
            {
                DateTime startDate2 = DateTime.ParseExact(startDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                DateTime endDate2 = DateTime.ParseExact(endDate, "yyyy-MM-dd", CultureInfo.InvariantCulture).AddDays(1).AddTicks(-1); // 添加一天再减去一个ticks，使得endDate是整天的结束时刻

                sql += $"and SMTime BETWEEN '{startDate2.ToString("yyyy-MM-dd HH:mm:ss")}' AND '{endDate2.ToString("yyyy-MM-dd HH:mm:ss")}'";
            }
            if (!string.IsNullOrEmpty(startDate) && string.IsNullOrEmpty(endDate))
            {
                sql += $"and CONVERT(date, SMTime) = CONVERT(date, '{startDate}')";
            }
            sql += " ORDER BY CASE State WHEN 1 THEN 1 WHEN 0 THEN 2 WHEN 3 THEN 3 ELSE 5 END";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //根据Id查询订单号
        public static string dingdan(int id)
        {
            string sql = "select OrderNumber from Serve where Id = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);
            if (table != null && table.Rows.Count > 0)
            {
              
                string ordernumber = Convert.ToString(table.Rows[0]["OrderNumber"]);
                return ordernumber;
            }
            else
            {
                return "0"; 
            }
        }

        //根据订单号查询
        public static DataTable FindByOrderNumber (string ordernumber)
        {
            string sql = "select * from Serve where OrderNumber='"+ordernumber+"'";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //根据订单号查询定金
        public static string dingjin(string number)
        {
            string sql = "select DownPayment from Serve where OrderNumber = "+ number+"";
            DataTable table = DBHelper.GetDataTable(sql);
            if (table != null && table.Rows.Count > 0)
            {
               
                string dingjin = Convert.ToString(table.Rows[0]["DownPayment"]);
                return dingjin;
            }
            else
            {
                return "0";
            }
        }
        //项目名称模糊查询、上门时间查询
        public static DataTable Findnametime4(string reisentname, string state, string end, string ordernumber,int residentid)
        {
            string sql = "SELECT * FROM Serve WHERE 1=1";

            if (!string.IsNullOrEmpty(reisentname))
            {
                sql += "and Name LIKE '%" + reisentname + "%' ";
            }
            if (!string.IsNullOrEmpty(state) && !string.IsNullOrEmpty(end))
            {
                DateTime startDate = DateTime.ParseExact(state, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                DateTime endDate = DateTime.ParseExact(end, "yyyy-MM-dd", CultureInfo.InvariantCulture).AddDays(1).AddTicks(-1); // 添加一天再减去一个ticks，使得endDate是整天的结束时刻

                sql += $"and SMTime BETWEEN '{startDate.ToString("yyyy-MM-dd HH:mm:ss")}' AND '{endDate.ToString("yyyy-MM-dd HH:mm:ss")}'";
            }
            if (!string.IsNullOrEmpty(ordernumber))
            {
                sql += "and OrderNumber LIKE '%" + ordernumber + "%'";
            }
            if (!string.IsNullOrEmpty(state) && string.IsNullOrEmpty(end))
            {
                sql += $"and CONVERT(date, SMTime) = CONVERT(date, '{state}')";
            }
            sql += "and ResId = " + residentid + "";
            sql += " ORDER BY CASE State WHEN 1 THEN 1 WHEN 0 THEN 2 WHEN 3 THEN 3 ELSE 5 END";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }

        //项目名称模糊查询、上门时间、项目类型、状态查询

        public static DataTable Findnametime3(string residentName, string startDate, string endDate, int? paidStatus, int? sypeId, string ordernumber,int residentid)
        {
            string sql = "SELECT * FROM Serve WHERE 1=1";
            if (paidStatus != 4)
            {
                sql += $" AND State = {paidStatus.Value}";
            }
            if (sypeId != 9)
            {
                sql += $" AND Type = {sypeId.Value}";
            }
            if (!string.IsNullOrEmpty(ordernumber))
            {
                sql += "and OrderNumber LIKE '%" + ordernumber + "%'";
            }
            if (!string.IsNullOrEmpty(residentName))
            {
                sql += " AND Name LIKE '%" + residentName + "%'";
            }

            if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
            {
                DateTime startDate2 = DateTime.ParseExact(startDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                DateTime endDate2 = DateTime.ParseExact(endDate, "yyyy-MM-dd", CultureInfo.InvariantCulture).AddDays(1).AddTicks(-1); // 添加一天再减去一个ticks，使得endDate是整天的结束时刻

                sql += $"and SMTime BETWEEN '{startDate2.ToString("yyyy-MM-dd HH:mm:ss")}' AND '{endDate2.ToString("yyyy-MM-dd HH:mm:ss")}'";
            }
            if (!string.IsNullOrEmpty(startDate) && string.IsNullOrEmpty(endDate))
            {
                sql += $"and CONVERT(date, SMTime) = CONVERT(date, '{startDate}')";
            }
            sql += "and ResId = "+residentid+"";
           sql += " ORDER BY CASE State WHEN 1 THEN 1 WHEN 0 THEN 2 WHEN 3 THEN 3 ELSE 5 END";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
    }
}
