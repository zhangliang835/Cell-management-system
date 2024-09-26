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
    public static  class VisitRecordService
    {
        //查询所有访客记录
        public static DataTable FindAllVisitRecord()
        {
            string sql = "select * from VisitRecord order by case Leave when 1 then 1 when 0 then 2 ELSE 5 END;";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //添加访客记录
        public static bool AdddVR(VisitRecord visit)
        {
            string sql = "INSERT INTO VisitRecord(Name, Phone, ResidentName,  RoomNumber, ArrivalTime, Leave, DepartureTime, Purpose) VALUES (@Name, @Phone, @ResidentName, @RoomNumber, @ArrivalTime, @Leave, @DepartureTime, @Purposes)";
            Dictionary<string, object> parameters = new Dictionary<string, object>()
      {
          { "@Name", visit.Name },
          { "@Phone", visit.Phone},
          { "@ResidentName",visit.ResidentName },
          { "@RoomNumber", visit.RoomNumber},
          { "@Leave", visit.Leave },
          { "@Purposes",visit.Purpose},
          { "@ArrivalTime", (object)visit.ArrivalTime ?? DBNull.Value }, // 将null转为DBNull
          { "@DepartureTime", (object)visit.DepartureTime ?? DBNull.Value },
      };

            return DBHelper2.ExecuteNonQueryWithParameters(sql, parameters);
        }
        //修改访客离开时间
        public static bool UpdateVR(VisitRecord visit)
        {
            string sql = "update VisitRecord set DepartureTime = '"+visit.DepartureTime+ "',Leave = "+visit.Leave+" where Id = "+visit.Id+"";
            return DBHelper.ExcuteSql(sql);
        }

        //姓名模糊查询、时间查询、状态
        public static DataTable Findnametime2(string reisentname, string state, string end)
        {
            string sqk = "SELECT * FROM VisitRecord WHERE 1=1";

            if (!string.IsNullOrEmpty(reisentname))
            {
                sqk += "and Name LIKE '%" + reisentname + "%' ";
            }
            if (!string.IsNullOrEmpty(state) && !string.IsNullOrEmpty(end))
            {
              /*  sqk += "and ArrivalTime BETWEEN '" + state + "' and '" + end + "' ";*/

                DateTime startDate = DateTime.ParseExact(state, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                DateTime endDate = DateTime.ParseExact(end, "yyyy-MM-dd", CultureInfo.InvariantCulture).AddDays(1).AddTicks(-1); // 添加一天再减去一个ticks，使得endDate是整天的结束时刻

                sqk += $"and ArrivalTime BETWEEN '{startDate.ToString("yyyy-MM-dd HH:mm:ss")}' AND '{endDate.ToString("yyyy-MM-dd HH:mm:ss")}'";

            }
            if (!string.IsNullOrEmpty(state) && string.IsNullOrEmpty(end))
            {
              /*  sqk += "and ArrivalTime = '" + state + "' ";*/

                sqk += $"and CONVERT(date, ArrivalTime) = CONVERT(date, '{state}')";

            }
            DataTable table = DBHelper.GetDataTable(sqk);
            return table;
        }

        public static DataTable Findnametime(string name, string startDate, string endDate, int? paidStatus)
        {
            string sql = "SELECT * FROM VisitRecord WHERE 1=1";

            if (paidStatus == 4)
            {

            }
            else if (paidStatus != 4)
            {
                sql += $" AND Leave = {paidStatus.Value}";
            }


            if (!string.IsNullOrEmpty(name))
            {
                sql += " AND Name LIKE '%" + name + "%'";
            }

            if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
            {
                DateTime startDate2 = DateTime.ParseExact(startDate, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                DateTime endDate2 = DateTime.ParseExact(endDate, "yyyy-MM-dd", CultureInfo.InvariantCulture).AddDays(1).AddTicks(-1); // 添加一天再减去一个ticks，使得endDate是整天的结束时刻

                sql += $"and ArrivalTime BETWEEN '{startDate2.ToString("yyyy-MM-dd HH:mm:ss")}' AND '{endDate2.ToString("yyyy-MM-dd HH:mm:ss")}'";
            }

            if (!string.IsNullOrEmpty(startDate) && string.IsNullOrEmpty(endDate))
            {
                /*  sql += "and ArrivalTime = '" + startDate + "' ";*/

                sql += $"and CONVERT(date, ArrivalTime) = CONVERT(date, '{startDate}')";
            }
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
    }
}
