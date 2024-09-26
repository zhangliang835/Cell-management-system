using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
namespace UI.Views.VisitRecordUI
{
    public partial class VisitRecordUIAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SigninButton_Click(object sender, EventArgs e)
        {
            VisitRecord v = new VisitRecord();
            v.Name = this.Name.Text;
            v.Phone = this.Phone.Text;
            v.ResidentName = this.ResidentName.Text;
            v.RoomNumber = this.HouseName.Text;
            v.ArrivalTime = DateTime.Now.ToString();
            v.Purpose = this.Purpose.Text;
            v.Leave = 0;
            bool flag = VisitRecordManager.AdddVR(v);
            if (flag)
            {
                Response.Redirect("VisitRecordList.aspx");
            }
        }
    }
}