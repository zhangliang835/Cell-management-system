using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace BLL
{
    public static  class HouseManager
    {
        public static bool ADDHouse(House house)
        {
            return HouseService.ADDHouse(house);
        }
        public static bool DeleteHouse(int id)
        {
            return HouseService.DeleteHouse(id);
        }
        public static DataTable FindAllHouse()
        {
            return HouseService.FindAllHouse();
        }
        public static DataTable FindAllHouseByID(int id)
        {
            return HouseService.FindAllHouseByID(id);
        }
        public static DataTable FindHouse()
        {
            return HouseService.FindHouse();
        }
        public static DataTable FindNoHouse()
        {
            return HouseService.FindNoHouse();
        }
        public static bool UpdateHouse(House house)
        {
            return HouseService.UpdateHouse(house);
        }
        public static bool UpdateHouse2(House house)
        {
            return HouseService.UpdateHouse2(house);
        }
        public static DataTable FindHouseByResidentRoomNumber(string name, string housename)
        {
            return HouseService.FindHouseByResidentRoomNumber(name, housename);
        }
        public static double FindHouseArea(int id)
        {
            return HouseService.FindHouseArea(id);
        }
        public static string FindHouseOwnerName(string roomNumber)
        {
            return HouseService.FindHouseOwnerName(roomNumber);
        }
        public static int FindHouseOwnerID(string name)
        {
            return HouseService.FindHouseOwnerID(name);
        }
        public static int FindOwnerIdByHouseId(int id)
        {
            return HouseService.FindOwnerIdByHouseId(id);
        }
        public static int FindHouseIdByOrderID(int id)
        {
            return HouseService.FindHouseIdByOrderID(id);
        }
    }
}
