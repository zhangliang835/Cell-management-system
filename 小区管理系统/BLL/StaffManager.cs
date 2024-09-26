using DAL;
using Model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static  class StaffManager
    {
        public static DataTable FindALL()
        {
            return StaffService.FindALL();
        }
        public static bool ADDStaff(Staff staff)
        {
            return StaffService.ADDStaff(staff);
        }
        public static DataTable Findnametime2(string reisentname)
        {
            return StaffService.Findnametime2(reisentname);
        }
        public static DataTable Findnametime(string residentName, int? paidStatus)
        {
            return StaffService.Findnametime(residentName, paidStatus);
        }
        public static DataTable FindByID(int id)
        {
            return StaffService.FindByID(id);
        }
        public static DataTable FindByID2(int id)
        {
            return StaffService.FindByID2(id);
        }
        public static bool UpdateStaff(Staff staff)
        {
            return StaffService.UpdateStaff(staff);
        }
        public static bool DeleteStaff(Staff staff)
        {
            return StaffService.DeleteStaff(staff);
        }
        public static string Findpassword(int ID)
        {
            return StaffService.Findpassword(ID);
        }
        public static bool Updatepassword(ShangMenStaff staff)
        {
            return StaffService.Updatepassword(staff);
        }
    }
}
