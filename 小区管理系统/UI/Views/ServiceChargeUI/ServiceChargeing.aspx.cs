using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.ServiceChargeUI
{
    public partial class ServiceChargeing : System.Web.UI.Page
    {
        int a;
        int b;
        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }
        public void InitData()
        {

            List<Model.ServiceCharge> services = ServiceChargeManager.FindAllServiceChargeed();
            this.ServiceChargeListTable.DataSource = services;
            this.ServiceChargeListTable.DataBind();

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
                case "未缴费":
                    a = 0;
                    table = ServiceChargeManager.Findnametime5(resident, state, end, a, stypeid);
                    break;
                case "待确认":
                    a = 3;
                    table = ServiceChargeManager.Findnametime5(resident, state, end, a, stypeid);
                    break;
                default:
                    a = 4;
                    table = ServiceChargeManager.Findnametime5(resident, state, end, a, stypeid);
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
                    table = ServiceChargeManager.Findnametime5(resident, state, end, paidStatus, b);
                    break;
                case "水费":
                    b = 2;
                    table = ServiceChargeManager.Findnametime5(resident, state, end, paidStatus, b);
                    break;
                case "电费":
                    b = 3;
                    table = ServiceChargeManager.Findnametime5(resident, state, end, paidStatus, b);
                    break;
                default:
                    b = 4;
                    table = ServiceChargeManager.Findnametime5(resident, state, end, paidStatus, b);

                    break;
            }

            this.ServiceChargeListTable.DataSource = table;
            this.ServiceChargeListTable.DataBind();
        }

        //线下缴费
        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString(); //主键ID
            ServiceCharge service = new ServiceCharge();
            service.PaidStatus = 1;
            service.Id = int.Parse(id);
            service.PaymentTime = DateTime.Now.ToString();
            bool flag = ServiceChargeManager.UpdateServiceCharge(service);
            if (flag)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal8').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }
            else
            {
                Response.Write("<script>alert('线下缴费失败');</script>");
            }
            InitData();
        }

    

        protected void Button2_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString();

            ServiceCharge service = new ServiceCharge();
            service.PaidStatus = 1;
            service.Id = int.Parse(id);
            bool flag = ServiceChargeManager.UpdateSer(service);
            if (flag)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal7').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }
            else
            {
                Response.Write("<script>alert('确认失败');</script>");
            }
            InitData();
        }
        protected void select_Click(object sender, EventArgs e)
        {
            string selectedState = DropDownList1.SelectedValue;
            int paidStatus = 4;
            switch (selectedState)
            {
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
            if (paidStatus == 4 && stypeid == 4)
            {
                string state = this.inputDate1.Text;
                string end = this.inputDate2.Text;
                string resident = this.name.Text;

                DataTable data = ServiceChargeManager.Findnametime6(resident, state, end);
                this.ServiceChargeListTable.DataSource = data;
                this.ServiceChargeListTable.DataBind();
            }
            else
            {
                string state = this.inputDate1.Text;
                string end = this.inputDate2.Text;
                string resident = this.name.Text;

                DataTable data = ServiceChargeManager.Findnametime5(resident, state, end, paidStatus, stypeid);
                this.ServiceChargeListTable.DataSource = data;
                this.ServiceChargeListTable.DataBind();
            }

        }
    }

}