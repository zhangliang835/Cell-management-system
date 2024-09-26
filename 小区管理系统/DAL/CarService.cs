using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
namespace DAL
{
    public static class CarService
    {
        //查询所有车辆
        public static DataTable FindAllCar()
        {
            string sql = "select c.*,r.Phone from Car as c join Resident as r on c.OwnerId = r.Id";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        //模糊查询
        public static DataTable FindMHAllCar(string name,string ownername)
        {
            string sql = "select c.*,r.Phone from  Car as c join Resident as r on c.OwnerId = r.Id and c.Name LIKE '%" + name + "%' and c.OwnerName LIKE '%" + ownername + "%' ";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }

        //增加车辆
        public static bool AddCar(Car car)
        {
            string sql = "INSERT INTO Car (Name, Photo, OwnerId, OwnerName) VALUES ('" + car.Name + "', '" + car.Photo + "', " + car.OwnerId + ", '" + car.OwnerName + "')";
            return DBHelper.ExcuteSql(sql);
        }  
        //删除车辆
        public static bool DeleteCar(int id)
        {
            string sql = "delete from Car where Id = " + id + "";
            return DBHelper.ExcuteSql(sql);
        }
        //修改车辆信息
        public static bool UpdateCar(Car car)
        {
            string sql = "UPDATE Car SET Name='" + car.Name + "', Photo='" + car.Photo + "', OwnerId=" + car.OwnerId + ", OwnerName='" + car.OwnerName + "' WHERE Id = " + car.Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        //根据车主Id查询车辆
        public static int FindCarId(int a)
        {
            string sql = "select Id from Car where OwnerId = "+a+"";
            DataTable table = DBHelper.GetDataTable(sql);
            if (table != null && table.Rows.Count > 0)
            {
               
                int carId = Convert.ToInt32(table.Rows[0]["Id"]);
                return carId; 
            }
            else
            {
                return -1; 
            }
        }
        //根据车主Id查询车辆
        public static DataTable FindCarAllByOwnerId(int id)
        {
            string sql = "select * from Car where OwnerId = "+id+"";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
        // 查询车库购买的车辆
        public static DataTable FindBuyCar()
        {
            string sql = "select ca.Id,ca.Name,ca.Photo,ca.OwnerId,ca.OwnerName,cn.CarbarnName,cn.State from Car as ca join Carbarn as cn ON ca.Id = cn.CarId  where cn.State = 1 ";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }   // 查询车库租借的车辆
        public static DataTable FindLeaseCar()
        {
            string sql = "select ca.Id,ca.Name,ca.Photo,ca.OwnerId,ca.OwnerName,cn.CarbarnName,cn.State from Car as ca join Carbarn as cn ON ca.Id = cn.CarId  where cn.State = 0";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }
    }
}

