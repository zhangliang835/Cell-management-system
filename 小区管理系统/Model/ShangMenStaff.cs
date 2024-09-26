using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class ShangMenStaff
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Posswork { get; set; }
        public string JobNumber { get; set; }
        public string Name { get; set; }
        public int Sex { get; set; }
        public int Age { get; set; }
        public string Phone { get; set; }
        public string Photo { get; set; }
        public int Department { get; set; }
        public int State { get; set; }
        public int Grade { get; set; }
        public string DingdanNumber { get; set; }
        public string ChuQianTime { get; set; }

        public ShangMenStaff(int id, string userName, string posswork, string jobNumber, string name, int sex, int age, string phone, string photo, int department, int state, int grade, string dingdanNumber, string chuQianTime)
        {
            Id = id;
            UserName = userName;
            Posswork = posswork;
            JobNumber = jobNumber;
            Name = name;
            Sex = sex;
            Age = age;
            Phone = phone;
            Photo = photo;
            Department = department;
            State = state;
            Grade = grade;
            DingdanNumber = dingdanNumber;
            ChuQianTime = chuQianTime;
        }

        public ShangMenStaff()
        {
        }
    }

}
