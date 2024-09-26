using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace UI.Views.ServiceChargeUI
{
    public partial class ServiceChargeUI : System.Web.UI.Page
    {
        int a;
        int b;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitData();
                
            }
        }
        public void InitData()
        {

         
            string name = this.name.Text;
            if (!string.IsNullOrEmpty(name))
            {
                var summary = ServiceChargeManager.GetServiceChargeSummary2(name);

                this.wuyeyingshou.Text = summary.TotalWuye.ToString("0.00");
                this.wuyeshishou.Text = summary.TotalShishouWuye.ToString("0.00");

                this.wuyeqianfei.Text = summary.TotalQianfeiWuye.ToString("0.00");

                this.shuifeiyingshou.Text = summary.TotalShuiFei.ToString("0.00");
                this.shuifeishishou.Text = summary.TotalShishouShuiFei.ToString("0.00");
                this.shuifeiqianfei.Text = summary.TotalQianfeiShuiFei.ToString("0.00");

                this.dianfeiyingshou.Text = summary.TotalDianFei.ToString("0.00");
                this.dianfeishishou.Text = summary.TotalShishouDianFei.ToString("0.00");
                this.dianfeiqianfei.Text = summary.TotalQianfeiDianFei.ToString("0.00");
                List<Model.ServiceCharge> services = ServiceChargeManager.FindAllServiceCharge();
                this.ServiceChargeListTable.DataSource = services;
                this.ServiceChargeListTable.DataBind();
            }
            else
            {
                var summary = ServiceChargeManager.GetServiceChargeSummary1();

                this.wuyeyingshou.Text = summary.TotalWuye.ToString("0.00");
                this.wuyeshishou.Text = summary.TotalShishouWuye.ToString("0.00");

                this.wuyeqianfei.Text = summary.TotalQianfeiWuye.ToString("0.00");

                this.shuifeiyingshou.Text = summary.TotalShuiFei.ToString("0.00");
                this.shuifeishishou.Text = summary.TotalShishouShuiFei.ToString("0.00");
                this.shuifeiqianfei.Text = summary.TotalQianfeiShuiFei.ToString("0.00");

                this.dianfeiyingshou.Text = summary.TotalDianFei.ToString("0.00");
                this.dianfeishishou.Text = summary.TotalShishouDianFei.ToString("0.00");
                this.dianfeiqianfei.Text = summary.TotalQianfeiDianFei.ToString("0.00");
                List<Model.ServiceCharge> services = ServiceChargeManager.FindAllServiceCharge();
                this.ServiceChargeListTable.DataSource = services;
                this.ServiceChargeListTable.DataBind();
            }           
        }  
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table;
            string selectedFeeType = DropDownList1.SelectedValue;
            string state = this.inputDate1.Text;
            string end = this.inputDate2.Text;
            string resident = this.name.Text;

            string selectstype = DropDownList2.SelectedValue;
            int stypeid = 4;
            switch (selectstype)
            {
                case "物业费":
                    stypeid = 1;
                    break;
                case "水费":
                    stypeid = 2;
                    break;
                case "电费":
                    stypeid = 3;
                    break;
            }
            switch (selectedFeeType)
            {
                case "已缴费":
                    a = 1;
                    table = ServiceChargeManager.Findnametime(resident, state, end, a, stypeid);
                    break;
                case "未缴费":
                    a = 0;
                    table = ServiceChargeManager.Findnametime(resident, state, end, a, stypeid);
                    break;
                case "待确认":
                    a = 3;
                    table = ServiceChargeManager.Findnametime(resident, state, end, a,stypeid);
                    break;
                default:
                    a = 4;
                    table = ServiceChargeManager.Findnametime(resident, state, end, a, stypeid); 
                    /* table = ServiceChargeManager.Findnametime2(resident, state, end); */
                    break;
            }

            this.ServiceChargeListTable.DataSource = table;
            this.ServiceChargeListTable.DataBind();
        }    
        
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table;
            string selectstype = DropDownList2.SelectedValue;
            string selectedState = DropDownList1.SelectedValue;
            int paidStatus = 4;
            switch (selectedState)
            {
                case "已缴费":
                    paidStatus = 1;
                    break;
                case "未缴费":
                    paidStatus = 0;
                    break;
                case "待确认":
                    paidStatus = 3;
                    break;
            }
            string state = this.inputDate1.Text;
            string end = this.inputDate2.Text;
            string resident = this.name.Text;

            switch (selectstype)
            {
                case "物业费":
                    b = 1;
                    table = ServiceChargeManager.Findnametime(resident, state, end, paidStatus,b);
                    break;
                case "水费":
                    b = 2;
                    table = ServiceChargeManager.Findnametime(resident, state, end, paidStatus,b);
                    break;
                case "电费":
                    b = 3;
                    table = ServiceChargeManager.Findnametime(resident, state, end, paidStatus,b);
                    break;
                default:
                    b = 4;
                    table = ServiceChargeManager.Findnametime(resident, state, end, paidStatus, b);
                    /*  table = ServiceChargeManager.Findnametime2(resident, state, end);*/

                    break;
            }

            this.ServiceChargeListTable.DataSource = table;
            this.ServiceChargeListTable.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString(); //主键ID
            int ID = ServiceChargeManager.FindAll(int.Parse(id));  //业主ID        
            Inform inform = new Inform();
            inform.ResidentId = ID;
            inform.InformName = "欠费缴纳";
            inform.Sender = "系统管理员"; 
            inform.content = $"尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！";
            inform.time = DateTime.Now.ToString();
            bool flag = InformManager.ADDcontent(inform);
            if (flag)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }
            else
            {
                Response.Write("<script>alert('通知失败');</script>");
            }
        }

        protected void yijiaocuijiao_Click(object sender, EventArgs e)
        {
            // 确定筛选条件，这里假设筛选所有未缴费和逾期的记录
            List<ServiceCharge> overdueUnpaidServices = ServiceChargeManager.FindNO();
            foreach (var service in overdueUnpaidServices)
            {
                int residentId = service.ResidentId; // 获取业主ID

       
                Inform inform = new Inform();
                inform.ResidentId = residentId;
                inform.InformName = "欠费缴纳";
                inform.Sender = "系统管理员"; 
                inform.content = $"尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！";
                inform.time = DateTime.Now.ToString();
                bool notificationAdded = InformManager.ADDcontent(inform);     
            }
            if (overdueUnpaidServices.Count > 0)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal7').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }
            else
            {
                Response.Write("<script>alert('当前没有符合条件的业主需要催缴。');</script>");
            }
        }

        protected void fabu_Click(object sender, EventArgs e)
        {

            List<Resident> reslist = ResidentManager.FindUserALL();
            bool allSuccess = true;
            foreach (var service in reslist)
            {
                ServiceCharge service1 = new ServiceCharge();
                service1.StateTime = DateTime.Now.ToString();
                service1.ResidentId = service.Id;
                service1.ResidentName = service.Name;
                service1.RoomNumber = service.HouseName;
                service1.SypeId = 1;
                double area = HouseManager.FindHouseArea(service.Id);
                service1.PaymentAmount = area.ToString();
                service1.PaidStatus = 0;       
                bool flag = ServiceChargeManager.ADDservice(service1);
                if (!flag)
                {
                    allSuccess = false;
                }
            }
            if (allSuccess)
            {            // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal8').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                InitData();
            }
            else
            {

            }
        }

        protected void select_Click(object sender, EventArgs e)
        {
            string selectedState = DropDownList1.SelectedValue;
            int paidStatus = 4;
            switch (selectedState)
            {
                case "已缴费":
                    paidStatus = 1;
                    break;
                case "未缴费":
                    paidStatus = 0;
                    break;
                case "待确认":
                    paidStatus = 3;
                    break;
            }


            string selectstype = DropDownList2.SelectedValue;
            int stypeid = 4;
            switch (selectstype)
            {
                case "物业费":
                    stypeid = 1;
                    break;
                case "水费":
                    stypeid = 2;
                    break;
                case "电费":
                    stypeid = 3;
                    break;
            }
            if (paidStatus == 4 && stypeid==4)
            {
                string state = this.inputDate1.Text;
                string end = this.inputDate2.Text;
                string resident = this.name.Text;

                DataTable data = ServiceChargeManager.Findnametime2(resident, state, end);
                this.ServiceChargeListTable.DataSource = data;
                this.ServiceChargeListTable.DataBind();
            }
            else
            {
                string state = this.inputDate1.Text;
                string end = this.inputDate2.Text;
                string resident = this.name.Text;

                DataTable data = ServiceChargeManager.Findnametime(resident, state, end, paidStatus, stypeid);
                this.ServiceChargeListTable.DataSource = data;
                this.ServiceChargeListTable.DataBind();
            }

        }
    }
}