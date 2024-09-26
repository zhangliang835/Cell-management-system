using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace DAL
{
    public static class HouseService
    {
        //房产登记
        public static bool ADDHouse(House house)
        {
            string ownerIdValue = house.OwnerId.HasValue ? house.OwnerId.ToString() : "NULL";
            string sql = "INSERT INTO House VALUES('" + house.RoomNumber + "','" + house.Type + "'," + house.Area + "," + ownerIdValue + ",'" + house.OwnerName + "')";
            return DBHelper.ExcuteSql(sql);
        }
        //房产删除
        public static bool DeleteHouse(int id)
        {

            string sql = "delete from House where Id = " + id + "";
            return DBHelper.ExcuteSql(sql);
        }
        //查询已入住房子
        public static DataTable FindHouse()
        {
        /*    string sql = "SELECT * FROM House WHERE OwnerId IS NOT NULL";*/
            string sql = "select h.*, r.Phone from House as h left join Resident as r on h.OwnerId = r.Id WHERE OwnerId IS NOT NULL";
            return DBHelper.GetDataTable(sql);
        }
        //查询未入住房子
        public static DataTable FindNoHouse()
        {
            string sql = "select h.*, r.Phone from House as h left join Resident as r on h.OwnerId = r.Id WHERE OwnerId IS NULL";
            return DBHelper.GetDataTable(sql);
        }
        //修改房产信息
        public static bool UpdateHouse(House house)
        {
            string sql = "update  House set RoomNumber = '" + house.RoomNumber + "', Type='" + house.Type + "',Area=" + house.Area + " where Id = " + house.Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        //初始化 
        public static bool UpdateHouse2(House house)
        {
            string sql = "update  House set OwnerId = "+house.OwnerId+ ",OwnerName = '"+house.OwnerName+"'where Id = " + house.Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        //根据姓名和房产号查询房子
        public static DataTable FindHouseByResidentRoomNumber(string name, string housename)
        {
            /*1=1表示始终为真*/
            string sql = "select h.*, r.Phone from House as h left join Resident as r on h.OwnerId = r.Id  WHERE 1=1";

            if (!string.IsNullOrEmpty(name))
            {
                sql += " AND OwnerName LIKE '%" + name + "%'";
            }            
                sql += " AND RoomNumber LIKE '%" + housename + "%'";            
            return DBHelper.GetDataTable(sql);
        }

        //查询所有房子信息
        public static DataTable FindAllHouse()
        {
            string sql = "select h.*, r.Phone " +
             "from House as h left join Resident as r on h.OwnerId = r.Id";          
            return DBHelper.GetDataTable(sql);
        }
        //根据房产ID查询房产信息
        public static DataTable FindAllHouseByID(int id)
        {
            string sql = "select h.*, r.Phone " +
             "from House as h left join Resident as r on h.OwnerId = r.Id where h.Id="+id+"";
            return DBHelper.GetDataTable(sql);
        }
        //查询房产单元面积，用于计算物业费
        public static double FindHouseArea(int id)
        {
            string sql = "select Area from House where OwnerId = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);

            if (!string.IsNullOrEmpty(table.Rows[0]["Area"].ToString()))
            {
                double area = Convert.ToInt32(table.Rows[0]["Area"]);
                return area;
            }
            else
            {
                return -1;
            }
        }
        //根据房产名称查询业主姓名
        public static string FindHouseOwnerName(string roomNumber)
        {
            string sql = "select OwnerName from House where RoomNumber ='" + roomNumber + "'";
            DataTable table = DBHelper.GetDataTable(sql);

            if (!string.IsNullOrEmpty(table.Rows[0]["OwnerName"].ToString()))
            {
                return table.Rows[0]["OwnerName"].ToString(); // 直接返回字符串类型的结果
            }
            else
            {
                return "-1"; // 如果确实需要返回一个特殊标识，这里也应返回字符串类型
            }
        }

        //根据房产名称查询业主ID
        public static int FindHouseOwnerID(string name)
        {
            string sql = "select OwnerId from House where RoomNumber ='"+name+"'";
            DataTable table = DBHelper.GetDataTable(sql);

            if (!string.IsNullOrEmpty(table.Rows[0]["OwnerId"].ToString()))
            {
                int ownerid = Convert.ToInt32(table.Rows[0]["OwnerId"]);
                return ownerid;
            }
            else
            {
                return -1;
            }
        }
        //根据房产ID查询业主ID
        public static int FindOwnerIdByHouseId(int id)
        {
            string sql = "select OwnerId from House where Id =" + id + "";
            DataTable table = DBHelper.GetDataTable(sql);

            if (!string.IsNullOrEmpty(table.Rows[0]["OwnerId"].ToString()))
            {
                int ownerid = Convert.ToInt32(table.Rows[0]["OwnerId"]);
                return ownerid;
            }
            else
            {
                return -1;
            }
        }
        //根据业主ID查询房产ID
        public static int FindHouseIdByOrderID(int id)
        {
            string sql = "select Id from House where OwnerId =" + id + "";
            DataTable table = DBHelper.GetDataTable(sql);

            if (!string.IsNullOrEmpty(table.Rows[0]["Id"].ToString()))
            {
                int ID = Convert.ToInt32(table.Rows[0]["Id"]);
                return ID;
            }
            else
            {
                return -1;
            }
        }
    }
}
