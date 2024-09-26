using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class House
    {
        public int Id { get; set; }
        public string RoomNumber { get; set; }
        public string Type { get; set; }
        public double Area { get; set; }
        public int? OwnerId { get; set; }
        public string OwnerName { get; set; }

        public House(int id, string roomNumber, string type, double area, int? ownerId, string ownerName)
        {
            Id = id;
            RoomNumber = roomNumber;
            Type = type;
            Area = area;
            OwnerId = ownerId;
            OwnerName = ownerName;
        }

        public House()
        {
        }
    }
}
