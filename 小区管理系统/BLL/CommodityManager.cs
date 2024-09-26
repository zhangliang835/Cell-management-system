using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static  class CommodityManager
    {
        public static List<Commodity> FindALL()
        {
            return CommodityService.FindALL();
        }
    }
}
