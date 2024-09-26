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
    public static  class NoticeManager
    {
        public static List<Notice> FindAllNotice()
        {
            return NoticeService.FindAllNotice();
        }
        public static DataTable FindAllStaff()
        {
            return NoticeService.FindAllStaff();
        }
        public static DataTable FindAllResident()
        {
            return NoticeService.FindAllResident();
        }
        public static bool AddNotice(Notice notice)
        {
            return NoticeService.AddNotice(notice);
        }
        public static bool UpdateNotice(Notice notice)
        {
            return NoticeService.UpdateNotice(notice);
        }
        public static Notice FindALLById(int id)
        {
            return NoticeService.FindALLById(id);
        }
        public static bool DeleteNotice(int Id)
        {
            return NoticeService.DeleteNotice(Id);
        }
    }
}
