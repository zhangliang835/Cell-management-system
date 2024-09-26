using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
namespace DAL
{
    public static class ResidentService
    {
        //新增
        /*    public static bool AddUser(Resident resident)
            {
                string sql = "insert into Resident values ('" + resident.Username + "','" + resident.Password + "','" + resident.Name + "'," + resident.Sex + ",'" + resident.Photo + "','"+resident.Phone+"','" + resident.HouseName + "')";
                return DBHelper.ExcuteSql(sql);
            }*/
        public static bool AddUser(Resident r)
        {
            string sql = "insert into Resident values('" + r.Username + "','" + r.Password + "','" + r.Name + "'," + r.Sex + ",'" + r.Photo + "','" + r.Phone + "','" + r.HouseName + "')";
            return DBHelper.ExcuteSql(sql);
        }
        //修改
        public static bool UpdateUser(Resident resident)
        {

            string sql = "update Resident set Username='" + resident.Username + "',Name='" + resident.Name + "',Sex=" + resident.Sex + ",Photo='" + resident.Photo + "',Phone='" + resident.Phone + "',HouseName='" + resident.HouseName + "'where Id=" + resident.Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        /*       //修改车辆信息
               public static bool UpdateUserCar(Resident resident)
               {

                   string sql = "update Resident set CarName='" + resident.CarName + "',CarPhoto='" + resident.CarPhoto + "'where Id=" + resident.Id + "";
                   return DBHelper.ExcuteSql(sql);
               }*/
        //删除
        public static bool DeleteUser(int Id)
        {
            string sql = "delete from Resident where Id = " + Id + "";
            return DBHelper.ExcuteSql(sql);
        }
        //查询小区现人口居住总数
        public static int FindAllNumber()
        {
            int totalResidentCount = 0;
            int totalFamilyCount = 0;

            try
            {
                // 查询Resident表的记录总数
                string countResidentSql = "SELECT COUNT(*) FROM Resident";
                totalResidentCount = Convert.ToInt32(DBHelper.GetDataTable(countResidentSql).Rows[0][0]);

                // 查询Family表的记录总数
                string countFamilySql = "SELECT COUNT(*) FROM Family";
                totalFamilyCount = Convert.ToInt32(DBHelper.GetDataTable(countFamilySql).Rows[0][0]);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error while fetching record counts: {ex.Message}");
            }

            // 返回两张表记录数之和
            return totalResidentCount + totalFamilyCount;

        }
        //查询全部
        public static DataTable FindAllUser()
        {
            //List<Resident> residentslist = new List<Resident>();
            string sql = "select * from Resident ";
            DataTable table = DBHelper.GetDataTable(sql);
            return table;
        }

        public static List<Resident> FindUserALL()
        {
            List<Resident> residentlist = new List<Resident>();
            string sql = "select*from Resident ";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                Resident resident = new Resident();
                resident.Id = (int)row.ItemArray[0];
                resident.Username = row.ItemArray[1].ToString();
                resident.Password = row.ItemArray[2].ToString();
                resident.Name = row.ItemArray[3].ToString();
                resident.Sex = (int)row.ItemArray[4];
                resident.Photo = row.ItemArray[5].ToString();
                resident.Phone = row.ItemArray[6].ToString();
                resident.HouseName = row.ItemArray[7].ToString();
                residentlist.Add(resident);
            }
            return residentlist;
        }
        //查询所有家庭成员
        public static List<Family> FindFamilyALL()
        {
            List<Family> families = new List<Family>();
            string sql = "select*from Family ";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                Family family = new Family();
                family.Id = (int)row.ItemArray[0];
                family.Name1 = row.ItemArray[1].ToString();
                family.ResidentId = (int)row.ItemArray[2];
                family.Relation = row.ItemArray[3].ToString();
                family.FamilyPhoto = row.ItemArray[4].ToString();
                family.FamilySex = (int)row.ItemArray[5];
                families.Add(family);
            }
            return families;
        }

        //根据主键Id查询
        public static Resident FindUserById(int id)
        {
            List<Resident> residentalist = new List<Resident>();
            string sql = "select*from Resident where Id = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                Resident resident = new Resident();
                resident.Id = (int)row.ItemArray[0];
                resident.Username = row.ItemArray[1].ToString();
                resident.Password = row.ItemArray[2].ToString();
                resident.Name = row.ItemArray[3].ToString();
                resident.Sex = (int)row.ItemArray[4];
                resident.Photo = row.ItemArray[5].ToString();
                resident.Phone = row.ItemArray[6].ToString();
                resident.HouseName = row.ItemArray[7].ToString();

                residentalist.Add(resident);
            }
            return residentalist.Count > 0 ? residentalist[0] : null;
        }

        //模糊查询
        public static List<Resident> FindUserByOrther(string name, string phone, string housename)
        {
            List<Resident> residentslist = new List<Resident>();
            string sql = "SELECT * FROM Resident WHERE Name LIKE '%" + name + "%' and Phone LIKE '%" + phone + "%' and HouseName like'%" + housename + "%' ";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                Resident resident = new Resident();
                resident.Id = (int)row.ItemArray[0];
                resident.Username = row.ItemArray[1].ToString();
                resident.Password = row.ItemArray[2].ToString();
                resident.Name = row.ItemArray[3].ToString();
                resident.Sex = (int)row.ItemArray[4];
                resident.Photo = row.ItemArray[5].ToString();
                resident.Phone = row.ItemArray[6].ToString();
                resident.HouseName = row.ItemArray[7].ToString();

                residentslist.Add(resident);
            }
            return residentslist;
        }
        //根据用户名、密码查询
        /*     public static bool LOGIN(string username, string password)
             {


                 // 使用非参数化查询（实际项目中应避免）
                 string sql = "SELECT * FROM Resident WHERE Username = '" + username + "' AND Password = '" + password + "'";
                 DataTable table = DBHelper.GetDataTable(sql);
                 if (table != null && table.Rows.Count > 0)
                 {
                     return true; // 登录成功
                 }
                 else
                 {
                     return false; // 登录失败
                 }
             }*/
        //业主登录
        public static int LOGIN(string username, string password)
        {

            string sql = "SELECT Id FROM Resident WHERE Username = '" + username + "' AND Password = '" + password + "'";
            DataTable table = DBHelper.GetDataTable(sql);

            if (table != null && table.Rows.Count > 0)
            {
                // 获取登录成功的用户ID
                int userId = Convert.ToInt32(table.Rows[0]["Id"]);
                return userId; // 返回用户ID表示登录成功
            }
            else
            {
                return -1; // 返回一个非有效ID表示登录失败
            }
        }
        //维修工人登录
        public static int StaffLogin(string username, string password)
        {
            string sql = "SELECT Id FROM ShangMenStaff WHERE UserName = '" + username + "' AND Posswork = '" + password + "'";
            DataTable table = DBHelper.GetDataTable(sql);
            if (table != null && table.Rows.Count > 0)
            {
                // 获取登录成功的用户ID
                int userId = Convert.ToInt32(table.Rows[0]["Id"]);
                return userId; // 返回用户ID表示登录成功
            }
            else
            {
                return -1; // 返回一个非有效ID表示登录失败
            }
        }

        //根据业主ID查询业主密码
        public static string Findpassword(int ID)
        {
            string sql = "SELECT Password FROM Resident WHERE Id = "+ID+"";
            DataTable table = DBHelper.GetDataTable(sql);

            if (table != null && table.Rows.Count > 0)
            {
             
                string mima = Convert.ToString(table.Rows[0]["Password"]);
                return mima; // 返回用户ID表示登录成功
            }
            else
            {
                return "00"; // 返回一个非有效ID表示登录失败
            }
        }
        //修改密码
        public static bool Updatepassword(Resident resident)
        {

            string sql = "update Resident set Password='" + resident.Password + "'where Id=" + resident.Id + "";
            return DBHelper.ExcuteSql(sql);
        }

    }
}



