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
    public static  class InformManager
    {
        public static bool ADDcontent(Inform inform)
        {
            return InformService.ADDcontent(inform);
        }
        public static string FindAll(int id)
        {
            return InformService.FindAll(id);
        }
        public static DataTable FindAllInform(int id)
        {
            return InformService.FindAllInform(id);
        }
        public static bool DeleteInform(int Id)
        {
            return InformService.DeleteInform(Id);
        }
        public static DataTable FindById(int id)
        {
            return InformService.FindById(id);
        }
    }
}
