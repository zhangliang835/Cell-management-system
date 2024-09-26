using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class ServiceCharge
    {
        public int Id { get; set; }
        public int SypeId { get; set; }
        public string StateTime { get; set; }
        public int ResidentId { get; set; }
        public string ResidentName { get; set; }
        public string RoomNumber { get; set; }
        public string PaymentAmount { get; set; }
        public int PaidStatus { get; set; }
        public string PaymentTime { get; set; }
        public string After { get; set; }
        public string Before { get; set; }
        public string DiffValue { get; set; }

        public ServiceCharge(int id, int sypeId, string stateTime, int residentId, string residentName, string roomNumber, string paymentAmount, int paidStatus, string paymentTime, string after, string before, string diffValue)
        {
            Id = id;
            SypeId = sypeId;
            StateTime = stateTime;
            ResidentId = residentId;
            ResidentName = residentName;
            RoomNumber = roomNumber;
            PaymentAmount = paymentAmount;
            PaidStatus = paidStatus;
            PaymentTime = paymentTime;
            After = after;
            Before = before;
            DiffValue = diffValue;
        }

        public ServiceCharge()
        {
        }
    }
}
