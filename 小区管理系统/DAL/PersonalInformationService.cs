using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public static  class PersonalInformationService
    {
        public static Resident FindUserById(int id)
        {
            List<Resident> residentalist = new List<Resident>();
            string sql = "select*from Resident where Id = " + id + "";
            DataTable table = DBHelper.GetDataTable(sql);
            foreach (DataRow row in table.Rows)
            {
                Resident resident = new Resident();
                resident.Id = (int)row.ItemArray[0];
                resident.Username = row.ItemArray[1].ToString();
                resident.Password = row.ItemArray[2].ToString();
                resident.Name = row.ItemArray[3].ToString();
                resident.Sex = (int)row.ItemArray[4];
                resident.Photo = row.ItemArray[5].ToString();
                resident.Phone = row.ItemArray[6].ToString();
             
              
                resident.HouseName = row.ItemArray[7].ToString();
                residentalist.Add(resident);
            }
            return residentalist.Count > 0 ? residentalist[0] : null;
        }
    }
}
