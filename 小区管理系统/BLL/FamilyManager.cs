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
    public static  class FamilyManager
    {
        public static DataTable FindAll(int ID)
        {
            return FamilyServise.FindAll(ID);
        }
        public static bool FamilyADD(Family family)
        {
            return FamilyServise.FamilyADD(family);
        }
        public static bool DeleteFamily(int id)
        {
            return FamilyServise.DeleteFamily(id);
        }
    }
}
