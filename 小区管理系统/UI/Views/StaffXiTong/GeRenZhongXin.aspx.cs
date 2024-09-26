using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.StaffXiTong
{
    public partial class GeRenZhongXin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Into();
        }

        public void Into()
        {
            
            DataTable table = ShangMenStaffManager.FindALLById(PublicVariable.StaffId);
            if (table.Rows.Count > 0)
            {
                DataRow row = table.Rows[0];
                this.name.Text = row["Name"].ToString();
                this.UserName.Text = row["UserName"].ToString();
                this.userphone.Text = row["Phone"].ToString();
                this.usersex.Text = row["Sex"].ToString() == "1" ? "男" : "女";
                this.age.Text = row["Age"].ToString();
                this.number.Text = row["JobNumber"].ToString();
                this.bumen.Text = row["Department"].ToString() == "1" ? "保洁部" :
                    row["Department"].ToString() == "2" ? "维修部" :
                    row["Department"].ToString() == "3" ? "安保部" :
                    row["Department"].ToString() == "4" ? "绿化部" : "";
                this.jiedan.Text = row["State"].ToString() == "1" ? "家政接单中" :
                    row["State"].ToString() == "2" ? "在职" :
                    row["State"].ToString() == "3" ? "请假" : "";

                this.UserPhoto2.ImageUrl = row["Photo"].ToString();
            }
        }

        protected void bianji_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/StaffXiTong/XiuGai.aspx");
        }

    
    }
}