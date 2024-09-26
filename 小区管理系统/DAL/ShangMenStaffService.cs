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
    public static  class ShangMenStaffService
    {
        //查询家政所有员工信息
        public static DataTable FindALL()
        {
            string sql = "select * from ShangMenStaff";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }   
        //根据ID查询信息
        public static DataTable FindALLById(int id)
        {
            string sql = "select * from ShangMenStaff where Id="+id+"";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //添加员工
        public static bool AddJiaZhengStaff(ShangMenStaff staff)
        {
            string sql = "insert into ShangMenStaff values('"+staff.UserName+"','"+staff.Posswork+"','"+staff.JobNumber+"','"+staff.Name+"',"+staff.Sex+","+staff.Age+",'"+staff.Phone+"','"+staff.Photo+"',"+staff.Department+","+staff.State+","+staff.Grade+",'"+staff.DingdanNumber+"','"+staff.ChuQianTime+"')";
            return DBHelper.ExcuteSql(sql);
        }
        //修改员工信息
        public static bool UpdateJiaZhengStaff(ShangMenStaff staff)
        {
            string sql = "update ShangMenStaff set UserName='"+staff.UserName+ "',Posswork='"+staff.Posswork+ "',JobNumber='"+staff.JobNumber+ "',Name='"+staff.Name+ "',Sex="+staff.Sex+ ",Age="+staff.Age+ ",Phone='"+staff.Phone+ "',Photo='"+staff.Photo+ "',Department="+staff.Department+ ",State="+staff.State+ ",Grade="+staff.Grade+"";
            return DBHelper.ExcuteSql(sql);
        }  
        public static bool Update(ShangMenStaff staff)
        {
            string sql = "update ShangMenStaff set UserName='"+staff.UserName+ "',Posswork='"+staff.Posswork+ "',Name='"+staff.Name+ "',Sex="+staff.Sex+ ",Age="+staff.Age+ ",Phone='"+staff.Phone+ "',Photo='"+staff.Photo+ "',Department="+staff.Department+ " where Id="+staff.Id+"";
            return DBHelper.ExcuteSql(sql);
        }
        public static bool UpdateStateDinddanNumber(ShangMenStaff staff)
        {
            string sql = "update ShangMenStaff set State="+staff.State+ ",DingdanNumber='"+staff.DingdanNumber+ "',ChuQianTime='"+staff.ChuQianTime + "' where Id = " + staff.Id+"";
            return DBHelper.ExcuteSql(sql);
        }
        //删除
        public static bool Delete(int id)
        {
            string sql = "delete from ShangMenStaff where Id = " + id + "";
            return DBHelper.ExcuteSql(sql);
        }
        //根据员工ID查询员工家政接单单号
        public static string Finddanhao(int id)
        {
            string sql = "select DingdanNumber from ShangMenStaff where Id =" + id + "";
            DataTable table = DBHelper.GetDataTable(sql);
            if (table != null && table.Rows.Count > 0)
            {
                string dingdan = Convert.ToString(table.Rows[0]["DingdanNumber"]);
                return dingdan; 
            }
            else
            {
                string a = "NO";
                return a; 
            }
        }
        //根据员工ID查询工号
        public static string FindjobnumberById(int id)
        {
            string sql = "select JobNumber from ShangMenStaff where Id =" + id + "";
            DataTable table = DBHelper.GetDataTable(sql);
            if (table != null && table.Rows.Count > 0)
            {
                string dingdan = Convert.ToString(table.Rows[0]["JobNumber"]);
                return dingdan;
            }
            else
            {
                string a = "NO";
                return a;
            }
        }
        //删除员工接单号、接单时间内容、修改工作状态
        public static bool UpdateStateTime(ShangMenStaff staff)
        {
            string sql = "update ShangMenStaff set DingdanNumber='" + staff.DingdanNumber + "',ChuQianTime='" + staff.ChuQianTime + "',State="+staff.State+"where Id = "+staff.Id+"";
            return DBHelper.ExcuteSql(sql);
        }
        //获取员工工号、订单单号、姓名、电话、照片、出勤时间
        public static DataTable FindJNOPPC(int ID)
        {
            string sql = "select DingdanNumber,JobNumber,Name,Phone,Photo,ChuQianTime from ShangMenStaff where Id = "+ID + "";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //姓名、工号模糊查询
        public static DataTable Findnametime2(string reisentname, string jobnumber)
        {
            string sql = "SELECT * FROM ShangMenStaff WHERE 1=1";

            if (!string.IsNullOrEmpty(reisentname))
            {
                sql += "and Name LIKE '%" + reisentname + "%' ";
            }
            if (!string.IsNullOrEmpty(jobnumber))
            {
                sql += "and JobNumber LIKE '%" + jobnumber + "%'";
            }
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }

        //姓名、工号模糊查询、部门、工作状态

        public static DataTable Findnametime(string residentName, int? paidStatus, int? sypeId, string jobnumber)
        {
            string sql = "SELECT * FROM ShangMenStaff WHERE 1=1";
           if (paidStatus != 4)
            {
                sql += $" AND State = {paidStatus.Value}";
            }
            if (sypeId != 5)
            {
                sql += $" AND Department = {sypeId.Value}";
            }
            if (!string.IsNullOrEmpty(jobnumber))
            {
                sql += "and JobNumber LIKE '%" + jobnumber + "%'";
            }
            if (!string.IsNullOrEmpty(residentName))
            {
                sql += " AND Name LIKE '%" + residentName + "%'";
            }
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }


    }
}
