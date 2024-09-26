using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class Administrator
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }

        public Administrator(int id, string userName, string password)
        {
            Id = id;
            UserName = userName;
            Password = password;
        }

        public Administrator()
        {
        }
    }
}
