using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class VisitRecord
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string ResidentName { get; set; }
        public string RoomNumber { get; set; }
        public string ArrivalTime { get; set; }
        public int Leave { get; set; }
        public string DepartureTime { get; set; }
        public string Purpose { get; set; }
        public string jiaofei { get; set; }

        public VisitRecord(int id, string name, string phone, string residentName, string roomNumber, string arrivalTime, int leave, string departureTime, string purpose, string jiaofei)
        {
            Id = id;
            Name = name;
            Phone = phone;
            ResidentName = residentName;
            RoomNumber = roomNumber;
            ArrivalTime = arrivalTime;
            Leave = leave;
            DepartureTime = departureTime;
            Purpose = purpose;
            this.jiaofei = jiaofei;
        }

        public VisitRecord()
        {
        }
    }
}
