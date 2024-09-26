using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class Staff
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Sex { get; set; }
        public int Age { get; set; }

        public string Photo { get; set; }
        public string Phone { get; set; }
        public int Department { get; set; }

        public Staff(int id, string name, int sex, int age, string photo, string phone, int department)
        {
            Id = id;
            Name = name;
            Sex = sex;
            Age = age;
            Photo = photo;
            Phone = phone;
            Department = department;
        }

        public Staff()
        {
        }
    }
}
