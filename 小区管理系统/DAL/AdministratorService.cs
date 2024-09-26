using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static  class AdministratorService
    {
        public static bool AdminLogin(string username, string password)
        {       
            string sql = "SELECT * FROM Administrator WHERE UserName = '" + username + "' and Password = '" + password + "'";
            DataTable table = DBHelper.GetDataTable(sql);
            if (table != null && table.Rows.Count > 0)
            {
                return true; // 登录成功
            }
            else
            {
                return false; // 登录失败
            }
        }
    }
}
