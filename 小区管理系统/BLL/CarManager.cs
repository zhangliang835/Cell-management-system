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
    public static  class CarManager
    {
        public static DataTable FindAllCar()
        {
            return CarService.FindAllCar();
        }
        public static bool AddCar(Car car)
        {
            return CarService.AddCar(car);
        }
        public static bool UpdateCar(Car car)
        {
            return CarService.UpdateCar(car);
        }
        public static int FindCarId(int a)
        {
            return CarService.FindCarId(a);
        }
        public static DataTable FindMHAllCar(string name, string ownername)
        {
            return CarService.FindMHAllCar(name, ownername);
        }
        public static DataTable FindBuyCar()
        {
            return CarService.FindBuyCar();
        }
        public static DataTable FindLeaseCar()
        {
            return CarService.FindLeaseCar();
        }
        public static DataTable FindCarAllByOwnerId(int id)
        {
            return CarService.FindCarAllByOwnerId(id);
        }
        public static bool DeleteCar(int id)
        {
            return CarService.DeleteCar(id);
        }
    }
}
