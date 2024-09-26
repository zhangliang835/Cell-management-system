using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Car
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Photo { get; set; }
        public int OwnerId { get; set; }
        public string OwnerName { get; set; }

        public Car(int id, string name, string photo, int ownerId, string ownerName)
        {
            Id = id;
            Name = name;
            Photo = photo;
            OwnerId = ownerId;
            OwnerName = ownerName;
        }

        public Car()
        {
        }
    }
}
