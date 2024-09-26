using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class Commodity
    {
        public int Id { get; set; }
        public string Label { get; set; }
        public string Introduce { get; set; }
        public string Price { get; set; }
        public string Integral { get; set; }
        public string Image { get; set; }

        public Commodity(int id, string label, string introduce, string price, string integral, string image)
        {
            Id = id;
            Label = label;
            Introduce = introduce;
            Price = price;
            Integral = integral;
            Image = image;
        }

        public Commodity()
        {
        }
    }
}
