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
    public static  class AttendanceRecordService
    {
        //登记员工出勤记录
        public static bool ADDAttendanceRecord(AttendanceRecord a)
        {
            string sql = "insert into AttendanceRecord values('"+a.OrderNumber+"','"+a.JobNumber+"','"+a.Name+"','"+a.Phone+"','"+a.Photo+"','"+a.ChuQianTime+"')";
            return DBHelper.ExcuteSql(sql);
        }
        //根据订单号查询员工出勤记录
       public static DataTable FingAllBydingdanhao(int id)
        {
            string sql = "select * from AttendanceRecord where OrderNumber = " + id+"";
            DataTable table = DBHelper
                .GetDataTable(sql);
            return table;
        }
        //根据员工工号查询出勤记录
        public static DataTable FingAllByJobNumber(string jobnumber)
        {
            string sql = "select * from AttendanceRecord where JobNumber = " + jobnumber + "";
            DataTable table = DBHelper
                .GetDataTable(sql);
            return table;
        }
        //根据出勤时间、订单号查询
        public static DataTable Findnametime2( string state, string end, string ordernumber,string number)
        {
            string sql = "SELECT * FROM AttendanceRecord WHERE 1=1 and JobNumber = '"+number+"'";

            if (!string.IsNullOrEmpty(state) && !string.IsNullOrEmpty(end))
            {
                DateTime startDate = DateTime.ParseExact(state, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                DateTime endDate = DateTime.ParseExact(end, "yyyy-MM-dd", CultureInfo.InvariantCulture).AddDays(1).AddTicks(-1); // 添加一天再减去一个ticks，使得endDate是整天的结束时刻

                sql += $"and ChuQianTime BETWEEN '{startDate.ToString("yyyy-MM-dd HH:mm:ss")}' AND '{endDate.ToString("yyyy-MM-dd HH:mm:ss")}'";
            }
            if (!string.IsNullOrEmpty(ordernumber))
            {
                sql += "and OrderNumber LIKE '%" + ordernumber + "%'";
            }
            if (!string.IsNullOrEmpty(state) && string.IsNullOrEmpty(end))
            {
                sql += $"and CONVERT(date, ChuQianTime) = CONVERT(date, '{state}')";
            }
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
    }
}
