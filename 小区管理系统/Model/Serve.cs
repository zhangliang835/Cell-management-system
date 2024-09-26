using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class Serve
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string price { get; set; }
        /// <summary>
        /// 订单号
        /// </summary>
        public string OrderNumber { get; set; }
        public string Area { get; set; }
        /// <summary>
        /// 上面时间
        /// </summary>
        public string SMTime { get; set; }
        public string Phone { get; set; }
        public int ResId { get; set; }
        public string ResName { get; set; }
        public string BeiZhu { get; set; }
        public int State { get; set; }
        public int Type { get; set; }
        public string DownPayment { get; set; }
        public int FenPei { get; set; }
        public int Grade { get; set; }
        public string Estimate { get; set; }

        public Serve(int id, string name, string price, string orderNumber, string area, string sMTime, string phone, int resId, string resName, string beiZhu, int state, int type, string downPayment, int fenPei, int grade, string estimate)
        {
            Id = id;
            Name = name;
            this.price = price;
            OrderNumber = orderNumber;
            Area = area;
            SMTime = sMTime;
            Phone = phone;
            ResId = resId;
            ResName = resName;
            BeiZhu = beiZhu;
            State = state;
            Type = type;
            DownPayment = downPayment;
            FenPei = fenPei;
            Grade = grade;
            Estimate = estimate;
        }

        public Serve()
        {
        }
    }
}
