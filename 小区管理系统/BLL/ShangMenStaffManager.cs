using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static  class ShangMenStaffManager
    {
        public static DataTable FindALL()
        {
            return ShangMenStaffService.FindALL();
        }
        public static bool AddJiaZhengStaff(ShangMenStaff staff)
        {
            return ShangMenStaffService.AddJiaZhengStaff(staff);
        }
        public static bool UpdateStateDinddanNumber(ShangMenStaff staff)
        {
            return ShangMenStaffService.UpdateStateDinddanNumber(staff);
        }
        public static DataTable FindJNOPPC(int ID)
        {
            return ShangMenStaffService.FindJNOPPC(ID);
        }
        public static DataTable Findnametime2(string reisentname, string jobnumber)
        {
            return ShangMenStaffService.Findnametime2(reisentname, jobnumber);
        }
        public static DataTable Findnametime(string residentName, int? paidStatus, int? sypeId, string jobnumber)
        {
            return ShangMenStaffService.Findnametime(residentName,paidStatus,sypeId,jobnumber);
        }
        public static DataTable FindALLById(int id)
        {
            return ShangMenStaffService.FindALLById(id);
        }
        public static bool Update(ShangMenStaff staff)
        {
            return ShangMenStaffService.Update(staff);
        }
        public static bool Delete(int id)
        {
            return ShangMenStaffService.Delete(id);
        }
        public static string Finddanhao(int id)
        {
            return ShangMenStaffService.Finddanhao(id);
        }
        public static string FindjobnumberById(int id)
        {
            return ShangMenStaffService.FindjobnumberById(id);
        }
        public static bool UpdateStateTime(ShangMenStaff staff)
        {
            return ShangMenStaffService.UpdateStateTime(staff);
        }
    }
}
