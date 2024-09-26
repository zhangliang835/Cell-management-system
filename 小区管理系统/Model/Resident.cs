using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class Resident
    {
        /// <summary>
        /// 用户编号
        /// 主键 int 不能为空 自增
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 用户姓名
        /// varcher(50) 不能为空
        /// </summary>
        public string Username { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public int Sex { get; set; }
        public string Photo  { get; set; }
        public string Phone  { get; set; }   
        public string HouseName { get; set; }

        public Resident(int id, string username, string password, string name, int sex, string photo, string phone, string houseName)
        {
            Id = id;
            Username = username;
            Password = password;
            Name = name;
            Sex = sex;
            Photo = photo;
            Phone = phone;
            HouseName = houseName;
        }

        public Resident()
        {
        }
    }
}
