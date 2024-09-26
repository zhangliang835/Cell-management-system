using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static  class AdministratorManager
    {
        public static bool AdministratorLogin(string username, string password)
        {
            return AdministratorService.AdminLogin(username, password);
        }
    }
}
