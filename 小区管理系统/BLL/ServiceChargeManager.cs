using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static  class ServiceChargeManager
    {
        public static List<ServiceCharge> FindAllServiceCharge()
        {
            return ServiceChargeService.FindAllServiceCharge();
        }
        public static bool CheckRecordExists(string roomNumber, DateTime date, int SypeId)
        {
            return ServiceChargeService.CheckRecordExists(roomNumber,date,SypeId);
        }
        public static List<ServiceCharge> FindButton(int paidStatus)
        {
            return ServiceChargeService.FindButton(paidStatus);
        }
        public static List<ServiceCharge> FindServiceChargeById(int id)
        {
            return ServiceChargeService.FindServiceChargeById(id);
        }
        public static bool UpdateServiceCharge(ServiceCharge serviceCharge)
        {
            return ServiceChargeService.UpdateServiceCharge(serviceCharge);
        }
        public static bool UpdateSer(ServiceCharge serviceCharge)
        {
            return ServiceChargeService.UpdateSer(serviceCharge);
        }
        public static int FindAll(int id)
        {
            return ServiceChargeService.FindAll(id);
        }
        public static List<ServiceCharge> FindButton1(int paidStatus, int id)
        {
            return ServiceChargeService.FindButton1(paidStatus,id);
        }
        public static List<ServiceCharge> FindNO()
        {
            return ServiceChargeService.FindNO();
        }
        public static bool ADDservice(ServiceCharge service)
        {
            return ServiceChargeService.AddService(service);
        }
        public static List<ServiceCharge> FindAllServiceChargeed()
        {
            return ServiceChargeService.FindAllServiceChargeed();
        }
        public static DataTable Findnametime(string residentName, string startDate, string endDate, int? paidStatus, int? sypeId)
        {
            return ServiceChargeService.Findnametime(residentName, startDate, endDate, paidStatus, sypeId);
        }
     
        public static DataTable Findnametime2(string reisentname, string state, string end)
        {
            return ServiceChargeService.Findnametime2(reisentname, state, end);
        }
        public static DataTable FindAllServiceCharge2()
        {
            return ServiceChargeService.FindAllServiceCharge2();
        }
        public static DataTable Findnametime5(string residentName, string startDate, string endDate, int? paidStatus, int? sypeId)
        {
            return ServiceChargeService.Findnametime5(residentName, startDate, endDate, paidStatus, sypeId);
        }
     
        public static DataTable Findnametime6(string reisentname, string state, string end)
        {
            return ServiceChargeService.Findnametime6(reisentname, state, end);
        }
        public static double Findwuye()
        {
            return ServiceChargeService.Findwuye();
        }
        public static double Findwuyeshishou()
        {
            return ServiceChargeService.Findwuyeshishou();
        }
        public static double Findwuyeqianfei()
        {
            return ServiceChargeService.Findwuyeqianfei();
        }


        public static (double TotalWuye, double TotalShishouWuye, double TotalQianfeiWuye,
       double TotalShuiFei, double TotalShishouShuiFei, double TotalQianfeiShuiFei,
       double TotalDianFei, double TotalShishouDianFei, double TotalQianfeiDianFei)
GetServiceChargeSummary2(string residentname)
        {
            return ServiceChargeService.GetServiceChargeSummary2( residentname);
        }   

        public static (double TotalWuye, double TotalShishouWuye, double TotalQianfeiWuye,
       double TotalShuiFei, double TotalShishouShuiFei, double TotalQianfeiShuiFei,
       double TotalDianFei, double TotalShishouDianFei, double TotalQianfeiDianFei)
GetServiceChargeSummary1()
        {
            return ServiceChargeService.GetServiceChargeSummary1( );
        }


        public static DataTable Findshuifei()
        {
            return ServiceChargeService.Findshuifei();
        }
        public static DataTable Findnametime3( string startDate, string endDate, int? paidStatus, int? sypeId, int ID)
        {
            return ServiceChargeService.Findnametime3(startDate, endDate, paidStatus, sypeId, ID);
        }
        public static DataTable Findnametime4(string state, string end, int ID)
        {
            return ServiceChargeService.Findnametime4( state, end, ID);
        }
    }
}
