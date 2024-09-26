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
    public static  class CarbranManager
    {
        public static bool UpdateCarbran(Carbarn carbran)
        {
            return CarbranService.UpdateCarbarn(carbran);
        }
        public static bool UpdateCarbarn2(Carbarn carbarn)
        {
            return CarbranService.UpdateCarbarn2(carbarn);
        }
        public static bool ADDCarbarn(Carbarn carbarn)
        {
            return CarbranService.ADDCarbarn(carbarn);
        }
        public static DataTable FindMHAllCarbarn(string name, string ownername)
        {
            return CarbranService.FindMHAllCarbarn(name, ownername);
        }
        public static DataTable FindAllCarbarn()
        {
            return CarbranService.FindAllCarbarn();
        }
        public static string FindCarbarnName(int id)
        {
            return CarbranService.FindCarbarnName(id);
        }
        public static bool UpdateCarbarn3(Carbarn carbarn)
        {
            return CarbranService.UpdateCarbarn3(carbarn);
        }
        public static bool DeleteCarbarn(int id)
        {
            return CarbranService.DeleteCarbarn(id);
        }
        public static int FindCarbarnResidentId(int id)
        {
            return CarbranService.FindCarbarnResidentId(id);
        }
    }
}
