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
    public partial class JiaZhengNumberList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }
        public void InitData()
        {
            string jobnumber = ShangMenStaffManager.FindjobnumberById(PublicVariable.StaffId);//根据员工ID获取工号
            this.ResidentListTable.DataSource = AttendanceRecordManager.FingAllByJobNumber(jobnumber); //根据工号查询出勤记录
            this.ResidentListTable.DataBind();
        }

        protected void select_Click(object sender, EventArgs e)
        {
            string ordernumber = this.OrderNumber.Text;
            string number = ShangMenStaffManager.FindjobnumberById(PublicVariable.StaffId);//根据员工ID获取工号
            string state = this.inputDate1.Text;
            string end = this.inputDate2.Text;
            DataTable data = AttendanceRecordManager.Findnametime2(state, end, ordernumber, number);
            this.ResidentListTable.DataSource = data;
            this.ResidentListTable.DataBind();
        }

    }
}