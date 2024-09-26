using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.JiaZhengUI
{
    public partial class JiaZheng : System.Web.UI.Page
    {
        int a;
        int b;
        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }
        public void InitData()
        {

            this.ShangMenListTable.DataSource = ServeManager.FindAll();
            this.ShangMenListTable.DataBind();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table;
            string selectedFeeType = DropDownList1.SelectedValue;
            string state = this.inputDate1.Text;
            string end = this.inputDate2.Text;
            string resident = this.name.Text;
            string ordernumber = this.OrderNumber.Text;
            string selectstype = DropDownList2.SelectedValue;
            int stypeid = 9;
            switch (selectstype)
            {
                case "深度清洁":
                    stypeid = 1;
                    break;
                case "日常清洁":
                    stypeid = 2;
                    break;
                case "衣物洗护":
                    stypeid = 3;
                    break;
                case "全屋大扫除":
                    stypeid = 4;
                    break;
                case "油烟机清洗":
                    stypeid = 5;
                    break;
                case "冰箱清洗":
                    stypeid = 6;
                    break;
                case "管道疏通":
                    stypeid = 7;
                    break;
                case "维修服务":
                    stypeid = 8;
                    break;
            }
            switch (selectedFeeType)
            {
                case "已完成":
                    a = 0;
                    table = ServeManager.Findnametime(resident, state, end, a, stypeid, ordernumber);
                    break;
                case "退订":
                    a = 3;
                    table = ServeManager.Findnametime(resident, state, end, a, stypeid, ordernumber);
                    break;
                case "进行中":
                    a = 1;
                    table = ServeManager.Findnametime(resident, state, end, a, stypeid, ordernumber);
                    break;
                default:
                    a = 4;
                    table = ServeManager.Findnametime(resident, state, end, a, stypeid, ordernumber);
                    break;
            }

            this.ShangMenListTable.DataSource = table;
            this.ShangMenListTable.DataBind();
        }
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table;
            string selectstype = DropDownList2.SelectedValue;
            string selectedState = DropDownList1.SelectedValue;
            int paidStatus = 4;
            switch (selectedState)
            {
                case "已完成":
                    paidStatus = 0;
                    break;
                case "退订":
                    paidStatus = 3;
                    break;
                case "进行中":
                    paidStatus = 1;
                    break;
            }
            string state = this.inputDate1.Text;
            string end = this.inputDate2.Text;
            string resident = this.name.Text;
            string ordernumber = this.OrderNumber.Text;
            switch (selectstype)
            {
                case "深度清洁":
                    b = 1;
                    table = ServeManager.Findnametime(resident, state, end, paidStatus, b, ordernumber);
                    break;
                case "日常清洁":
                    b = 2;
                    table = ServeManager.Findnametime(resident, state, end, paidStatus, b, ordernumber);
                    break;
                case "衣物洗护":
                    b = 3;
                    table = ServeManager.Findnametime(resident, state, end, paidStatus, b, ordernumber);
                    break;
                case "全屋大扫除":
                    b = 4;
                    table = ServeManager.Findnametime(resident, state, end, paidStatus, b, ordernumber);
                    break;
                case "油烟机清洗":
                    b = 5;
                    table = ServeManager.Findnametime(resident, state, end, paidStatus, b, ordernumber);
                    break;
                case "冰箱清洗":
                    b = 6;
                    table = ServeManager.Findnametime(resident, state, end, paidStatus, b, ordernumber);
                    break;
                case "管道疏通":
                    b = 7;
                    table = ServeManager.Findnametime(resident, state, end, paidStatus, b, ordernumber);
                    break;
                case "维修服务":
                    b = 8;
                    table = ServeManager.Findnametime(resident, state, end, paidStatus, b, ordernumber);
                    break;
                default:
                    b = 9;
                    table = ServeManager.Findnametime(resident, state, end, paidStatus, b, ordernumber);

                    break;
            }

            this.ShangMenListTable.DataSource = table;
            this.ShangMenListTable.DataBind();
        }
        protected void select_Click(object sender, EventArgs e)
        {
            string selectedState = DropDownList1.SelectedValue;
            int paidStatus = 4;
            switch (selectedState)
            {
                case "进行中":
                    paidStatus = 1;
                    break;
                case "已完成":
                    paidStatus = 0;
                    break;
                case "退订":
                    paidStatus = 3;
                    break;
            }


            string selectstype = DropDownList2.SelectedValue;
            int stypeid = 9;
            switch (selectstype)
            {
                case "深度清洁":
                    stypeid = 1;
                    break;
                case "日常清洁":
                    stypeid = 2;
                    break;
                case "衣物洗护":
                    stypeid = 3;
                    break;
                case "全屋大扫除":
                    stypeid = 4;
                    break;
                case "油烟机清洗":
                    stypeid = 5;
                    break;
                case "冰箱清洗":
                    stypeid = 6;
                    break;
                case "管道疏通":
                    stypeid = 7;
                    break;
                case "维修服务":
                    stypeid = 8;
                    break;
            }
            if (paidStatus == 4 && stypeid == 9)
            {
                string ordernumber = this.OrderNumber.Text;
                string state = this.inputDate1.Text;
                string end = this.inputDate2.Text;
                string resident = this.name.Text;
                DataTable data = ServeManager.Findnametime2(resident, state, end , ordernumber);
                this.ShangMenListTable.DataSource = data;
                this.ShangMenListTable.DataBind();
            }
            else
            {
                string ordernumber = this.OrderNumber.Text;
                string state = this.inputDate1.Text;
                string end = this.inputDate2.Text;
                string resident = this.name.Text;
                DataTable data = ServeManager.Findnametime(resident, state, end, paidStatus, stypeid, ordernumber);
                this.ShangMenListTable.DataSource = data;
                this.ShangMenListTable.DataBind();
            }
 /*           ;
            DataTable table = ServeManager.FindByOrderNumber(ordernumber);
            this.ShangMenListTable.DataSource = table;
            this.ShangMenListTable.DataBind();*/
        }

        protected void Look_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString();//订单ID
            string dingdanhao = ServeManager.dingdan(int.Parse(id));//根据订单ID查询订单号
            this.Repeater1.DataSource = AttendanceRecordManager.FingAllBydingdanhao(int.Parse(dingdanhao));//根据订单号查询相应订单记出勤记录
            this.Repeater1.DataBind();
            //打开模态对话框
            string script = "$(function() { $('#myModa2').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModa2", script, true);
        }
    }
}