using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static  class CommodityService
    {
        public static List<Commodity> FindALL()
        {
            List<Commodity> commodities = new List<Commodity>();
            string sql = "select*from Commodity ";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                Commodity commodity = new Commodity();
                commodity.Id = (int)row.ItemArray[0];
                commodity.Label = row.ItemArray[1].ToString();
                commodity.Introduce = row.ItemArray[2].ToString();
                commodity.Price = row.ItemArray[3].ToString();          
                commodity.Integral = row.ItemArray[4].ToString();
                commodity.Image = row.ItemArray[5].ToString();

                commodities.Add(commodity);
            }
            return commodities;
        }
    }
}
