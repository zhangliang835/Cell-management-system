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
    public static  class AttendanceRecordManager
    {
        public static bool ADDAttendanceRecord(AttendanceRecord a)
        {
            return AttendanceRecordService.ADDAttendanceRecord(a);
        }
        public static DataTable FingAllBydingdanhao(int id)
        {
            return AttendanceRecordService.FingAllBydingdanhao(id);
        }
        public static DataTable FingAllByJobNumber(string jobnumber)
        {
            return AttendanceRecordService.FingAllByJobNumber(jobnumber);
        }
        public static DataTable Findnametime2(string state, string end, string ordernumber,string number)
        {
            return AttendanceRecordService.Findnametime2(state, end, ordernumber, number);
        }
    }
}
