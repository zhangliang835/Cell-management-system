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
    public static  class VisitRecordManager
    {
        public static DataTable FindAllVisitRecord()
        {
            return VisitRecordService.FindAllVisitRecord();
        }
        public static bool AdddVR(VisitRecord visit)
        {
            return VisitRecordService.AdddVR(visit);
        }
        public static bool UpdateVR(VisitRecord visit)
        {
            return VisitRecordService.UpdateVR(visit);
        }
        public static DataTable Findnametime(string name, string startDate, string endDate, int? paidStatus)
        {
            return VisitRecordService.Findnametime(name, startDate, endDate, paidStatus);
        }
        public static DataTable Findnametime2(string reisentname, string state, string end)
        {
            return VisitRecordService.Findnametime2(reisentname, state, end);
        }
    }
}
