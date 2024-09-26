using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class Complaint
    {
        public int Id { get; set; }
        public int ResidentId { get; set; }
        public string  ResidentName { get; set; }
        public string  RoomNumber { get; set; }
        public string  Title { get; set; }
        public string  Content { get; set; }
        public string  Photo { get; set; }
        public string  Time { get; set; }
        public int State { get; set; }

        public Complaint(int id, int residentId, string residentName, string roomNumber, string title, string content, string photo, string time, int state)
        {
            Id = id;
            ResidentId = residentId;
            ResidentName = residentName;
            RoomNumber = roomNumber;
            Title = title;
            Content = content;
            Photo = photo;
            Time = time;
            State = state;
        }

        public Complaint()
        {
        }
    }
}
