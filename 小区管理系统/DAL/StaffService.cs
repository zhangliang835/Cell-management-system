using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static  class StaffService
    {
      // 查询所有员工
      public static DataTable FindALL()
        {
            string sql = "select * from Staff";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        } 
        //新增员工
        public static bool ADDStaff(Staff staff)
        {
            string sql = "insert into Staff values('" + staff.Name+"',"+staff.Sex+","+staff.Age+",'"+staff.Photo+"','"+staff.Phone+"',"+staff.Department+")";
            return DBHelper.ExcuteSql(sql);
        }
        //修改
        public static bool UpdateStaff(Staff staff)
        {
            string sql = "update Staff set Name='" + staff.Name + "',Sex=" + staff.Sex + ",Age="+staff.Age+",Photo='"+staff.Photo+"',Phone='"+staff.Phone+ "',Department="+staff.Department+"where Id = "+staff.Id+"";
            return DBHelper.ExcuteSql(sql);
        }
        
        //删除
        public static bool DeleteStaff(Staff staff)
        {
            string sql = "delete from Staff where Id = "+staff.Id+"";
            return DBHelper.ExcuteSql(sql);
        }
        //根据ID查询员工信息
        public static DataTable FindByID(int id)
        {
            string sql = "select * from Staff where Id = "+id+"";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        public static DataTable FindByID2(int id)
        {
            string sql = "select * from ShangMenStaff where Id = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        public static DataTable Findnametime2(string reisentname)
        {
            string sqk = "SELECT * FROM Staff WHERE 1=1";

            if (!string.IsNullOrEmpty(reisentname))
            {
                sqk += "and Name LIKE '%" + reisentname + "%' ";
            }
            DataTable table = DBHelper.GetDataTable(sqk);
            return table;
        }

        public static DataTable Findnametime(string residentName,int? paidStatus)
        {
            string sql = "SELECT * FROM Staff WHERE 1=1";

            if (paidStatus != 5)
            {
                sql += $" AND Department = {paidStatus.Value}";
            }

            if (!string.IsNullOrEmpty(residentName))
            {
                sql += " AND Name LIKE '%" + residentName + "%'";
            }
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //根据员工ID查询业主密码
        public static string Findpassword(int ID)
        {
            string sql = "SELECT Posswork FROM ShangMenStaff WHERE Id = " + ID + "";
            DataTable table = DBHelper.GetDataTable(sql);

            if (table != null && table.Rows.Count > 0)
            {

                string mima = Convert.ToString(table.Rows[0]["Posswork"]);
                return mima; // 返回用户ID表示登录成功
            }
            else
            {
                return "00"; // 返回一个非有效ID表示登录失败
            }
        }
        //修改密码
        public static bool Updatepassword(ShangMenStaff staff)
        {

            string sql = "update ShangMenStaff set Posswork='" + staff.Posswork + "'where Id=" + staff.Id + "";
            return DBHelper.ExcuteSql(sql);
        }
    }
}
