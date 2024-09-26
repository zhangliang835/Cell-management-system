using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.Notice
{
    public partial class NoticeUI : System.Web.UI.Page
    {
        int a;
        int b;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }
        public void InitData()
        {
            List<Model.ServiceCharge> services = ServiceChargeManager.FindServiceChargeById(Convert.ToInt32(Session["UserId"]));
            this.ServiceChargeListTable.DataSource = services;
            this.ServiceChargeListTable.DataBind();

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table;
            string selectedFeeType = DropDownList1.SelectedValue;
            string state = this.inputDate1.Text;
            string end = this.inputDate2.Text;
          

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
                    table = ServiceChargeManager.Findnametime3( state, end, a, stypeid, Convert.ToInt32(Session["UserId"]));
                    break;
                case "未缴费":
                    a = 0;
                    table = ServiceChargeManager.Findnametime3( state, end, a, stypeid, Convert.ToInt32(Session["UserId"]));
                    break;
                case "待确认":
                    a = 3;
                    table = ServiceChargeManager.Findnametime3( state, end, a, stypeid, Convert.ToInt32(Session["UserId"]));
                    break;
                default:
                    a = 4;
                    table = ServiceChargeManager.Findnametime3( state, end, a, stypeid, Convert.ToInt32(Session["UserId"]));

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
         

            switch (selectstype)
            {
                case "物业费":
                    b = 1;
                    table = ServiceChargeManager.Findnametime3( state, end, paidStatus, b, Convert.ToInt32(Session["UserId"]));
                    break;
                case "水费":
                    b = 2;
                    table = ServiceChargeManager.Findnametime3( state, end, paidStatus, b, Convert.ToInt32(Session["UserId"]));
                    break;
                case "电费":
                    b = 3;
                    table = ServiceChargeManager.Findnametime3( state, end, paidStatus, b, Convert.ToInt32(Session["UserId"]));
                    break;
                default:
                    b = 4;
                    table = ServiceChargeManager.Findnametime3( state, end, paidStatus, b, Convert.ToInt32(Session["UserId"]));
                    break;
            }

            this.ServiceChargeListTable.DataSource = table;
            this.ServiceChargeListTable.DataBind();
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
            if (paidStatus == 4 && stypeid == 4)
            {
                string state = this.inputDate1.Text;
                string end = this.inputDate2.Text;
             

                DataTable data = ServiceChargeManager.Findnametime4( state, end, Convert.ToInt32(Session["UserId"]));
                this.ServiceChargeListTable.DataSource = data;
                this.ServiceChargeListTable.DataBind();
            }
            else
            {
                string state = this.inputDate1.Text;
                string end = this.inputDate2.Text;
               

                DataTable data = ServiceChargeManager.Findnametime3(state, end, paidStatus, stypeid, Convert.ToInt32(Session["UserId"]));
                this.ServiceChargeListTable.DataSource = data;
                this.ServiceChargeListTable.DataBind();
            }

        }

        protected void PayButton2_Click(object sender, EventArgs e)
        {
            int id = PublicVariable.ServiceChargeId;
            if (id != 0)
            {
                // 接下来使用获取到的 id 执行更新操作...
                ServiceCharge service = new ServiceCharge();
                service.PaidStatus = 3;
                service.PaymentTime = DateTime.Now.ToString();
                service.Id = id;
                ServiceChargeManager.UpdateServiceCharge(service);
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                InitData();
            }
            else
            {
                Response.Write("<script>alert('未能找到缴费ID，请刷新页面重试！');</script>");
            }
        }

        protected void PayButton_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString();
            PublicVariable.ServiceChargeId = int.Parse(id);
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }


    }
}