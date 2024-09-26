using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using DAL;
using System.Data;
namespace BLL
{
    public static  class ResidentManager
    {
        //新增
        public static bool AddUser(Resident resident)
        {
            return DAL.ResidentService.AddUser(resident);
        }
        //修改
         public static bool UpdateUser(Resident resident)
        {
            return ResidentService.UpdateUser(resident);
        }
        //删除
        public static bool DeleteUser(int id)
        {
            return DAL.ResidentService.DeleteUser(id);
        }
        //查询全部
        public static DataTable FindAllUser()
        {
            return DAL.ResidentService.FindAllUser();
        }
        public static Resident FindUserById(int id)
        {
            return DAL.ResidentService.FindUserById(id);
        }

        /*    public static bool LOGIN(string username, string password)
            {

                return DAL.ResidentService.LOGIN(username, password);
            }*/
        public static int LOGIN(string username, string password)
        {
            return DAL.ResidentService.LOGIN(username, password);
        }
        public static List<Resident> FindUserByOrther(string name, string phone,  string housename)
        {
            return ResidentService.FindUserByOrther(name, phone, housename);
        }
        public static int StaffLogin(string username, string password)
        {
            return ResidentService.StaffLogin(username, password);
        }
        public static List<Resident> FindUserALL()
        {
            return ResidentService.FindUserALL();
        }
  /*      public static bool UpdateUserCar(Resident resident)
        {
            return ResidentService.UpdateUserCar(resident);
        }*/
        public static int FindAllNumber()
        {
            return ResidentService.FindAllNumber();
        }
        public static List<Family> FindFamilyALL()
        {
            return ResidentService.FindFamilyALL();
        }
        public static string Findpassword(int ID)
        {
            return ResidentService.Findpassword(ID);
        }
           public static bool Updatepassword(Resident resident)
        {
            return ResidentService.Updatepassword(resident);
        }
    }
}
