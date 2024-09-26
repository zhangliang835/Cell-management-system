using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class Carbarn
    {
        public int Id { get; set; }
        public string CarbarnName { get; set; }

        public int ResidentId { get; set; }
        public string ResidentName { get; set; }
        public string Phone { get; set; }
        public int State { get; set; }

        public Carbarn(int id, string carbarnName, int residentId, string residentName, string phone, int state)
        {
            Id = id;
            CarbarnName = carbarnName;
            ResidentId = residentId;
            ResidentName = residentName;
            Phone = phone;
            State = state;
        }

        public Carbarn()
        {
        }
    }

}
