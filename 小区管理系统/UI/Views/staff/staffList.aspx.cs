using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.MaintenanceRecordUI
{
    public partial class MaintenanceRecordUI : System.Web.UI.Page
    {
        int a;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//数据初始化
            {
                InitData();
            }
        }
        public void InitData()
        {
            this.MaintenanceListTable.DataSource = StaffManager.FindALL();
            this.MaintenanceListTable.DataBind();        
        }

        protected void PassButton_Click(object sender, EventArgs e)
        {
           PublicVariable.MaintainId = int.Parse(((Button)sender).CommandArgument.ToString());
         
         
            Response.Redirect("~/Views/MaintenanceRecordUI/PassMaintenance.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table;
            string selectedFeeType = DropDownList1.SelectedValue;
            string resident = this.name.Text;          
            switch (selectedFeeType)
            {
                case "安保部":
                    a = 1;
                    table = StaffManager.Findnametime(resident,a);
                    break;
                case "保洁部":
                    a = 2;
                    table = StaffManager.Findnametime(resident, a);
                    break;
                case "绿化部":
                    a = 3;
                    table = StaffManager.Findnametime(resident, a);
                    break;  
                case "维修部":
                    a = 4;
                    table = StaffManager.Findnametime(resident, a);
                    break;
                default:
                    a = 5;
                    table = StaffManager.Findnametime(resident, a);
                    break;
            }

            this.MaintenanceListTable.DataSource = table;
            this.MaintenanceListTable.DataBind();
        }

        protected void select_Click(object sender, EventArgs e)
        {
            string selectedState = DropDownList1.SelectedValue;
            int paidStatus = 5;
            switch (selectedState)
            {
                case "安保部":
                    paidStatus = 1;
                    break;
                case "保洁部":
                    paidStatus = 2;
                    break;
                case "绿化部":
                    paidStatus = 3;
                    break;
                case "维修部":
                    paidStatus = 4;
                    break;
            }

            if (paidStatus == 5 )
            {
                string resident = this.name.Text;
                DataTable data = StaffManager.Findnametime2(resident);
                this.MaintenanceListTable.DataSource = data;
                this.MaintenanceListTable.DataBind();
            }
            else
            {
                string resident = this.name.Text;
                DataTable data = StaffManager.Findnametime(resident, paidStatus);
                this.MaintenanceListTable.DataSource = data;
                this.MaintenanceListTable.DataBind();
            }

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Staff staff = new Staff();
            staff.Id = id;
            bool flag = StaffManager.DeleteStaff(staff);
            if (flag == true)
            {
                //删除成功
                InitData();
            }
            else
            {
                //删除失败
                Response.Write("<script>('删除失败')</script>");
            }
        }
    }
}