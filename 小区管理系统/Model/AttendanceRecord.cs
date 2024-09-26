using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class AttendanceRecord
    {
        public int Id { get; set; }
        public string OrderNumber { get; set; }
        public string JobNumber { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Photo { get; set; }
        public string ChuQianTime { get; set; }

        public AttendanceRecord(int id, string orderNumber, string jobNumber, string name, string phone, string photo, string chuQianTime)
        {
            Id = id;
            OrderNumber = orderNumber;
            JobNumber = jobNumber;
            Name = name;
            Phone = phone;
            Photo = photo;
            ChuQianTime = chuQianTime;
        }

        public AttendanceRecord()
        {
        }
    }
}
