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
    public static  class ServeManager
    {
        public static bool Add(Serve serve)
        {
            return ServeService.Add(serve );
        }
        public static DataTable FindAll()
        {
            return ServeService.FindAll();
        }
        public static DataTable FindAllByResidentID(int id)
        {
            return ServeService.FindAllByResidentID(id);
        }
        public static DateTime FindShangMenTime(int id)
        {
            return ServeService.FindShangMenTime(id);
        }
        public static bool UpdateServeState(Serve serve)
        {
            return ServeService.UpdateServeState(serve);
        }
        public static bool UpdateServeGrade(Serve serve)
        {
            return ServeService.UpdateServeGrade(serve);
        }
        public static bool UpdateStatePrice(Serve serve)
        {
            return ServeService.UpdateStatePrice(serve);
        }
        public static DataTable Findnametime2(string reisentname, string state, string end,string ordernumber)
        {
            return ServeService.Findnametime2(reisentname, state, end, ordernumber);
        }
        public static DataTable Findnametime(string residentName, string startDate, string endDate, int? paidStatus, int? sypeId,string ordernumber)
        {
            return ServeService.Findnametime(residentName, startDate, endDate,paidStatus,sypeId, ordernumber);
        }
        public static string dingdan(int id)
        {
            return ServeService.dingdan(id);
        }
        public static bool UpdateServeFenPei(Serve serve)
        {
            return ServeService.UpdateServeFenPei(serve);
        }
        public static DataTable FindByOrderNumber(string ordernumber)
        {
            return ServeService.FindByOrderNumber(ordernumber);
        }
        public static string dingjin(string number)
        {
            return ServeService.dingjin(number);
        }
        public static DataTable Findnametime4(string reisentname, string state, string end, string ordernumber, int residentid)
        {
            return ServeService.Findnametime4(reisentname,state,end,ordernumber,residentid);
        }
        public static DataTable Findnametime3(string residentName, string startDate, string endDate, int? paidStatus, int? sypeId, string ordernumber, int residentid)
        {
            return ServeService.Findnametime3(residentName, startDate, endDate, paidStatus,sypeId, ordernumber,residentid);
        }
    }
}
