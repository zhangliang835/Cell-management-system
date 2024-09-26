using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
     public  class Inform
    {
        public int Id { get; set; }
       
        public string InformName { get; set; }
        public string SenderId { get; set; }
        public string Sender { get; set; }
        public int ResidentId { get; set; }

        public string content { get; set; }
        public string time { get; set; }
        public string timeEnd { get; set; }

        public Inform(int id, string informName, string senderId, string sender, int residentId, string content, string time, string timeEnd)
        {
            Id = id;
            InformName = informName;
            SenderId = senderId;
            Sender = sender;
            ResidentId = residentId;
            this.content = content;
            this.time = time;
            this.timeEnd = timeEnd;
        }

        public Inform()
        {
        }
    }

}
