using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.VisitRecordUI
{
    public partial class VisitRecordList : System.Web.UI.Page
    {
        int a;
      /*  int b;*/
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitData();
            }

            
        }
        public void InitData()
        {
            this.VisitRecordListTable.DataSource = VisitRecordManager.FindAllVisitRecord();
            this.VisitRecordListTable.DataBind();
        }
        protected void Leave_Click_Click(object sender, EventArgs e)
        {
            
            VisitRecord v = new VisitRecord();
            string id = ((Button)sender).CommandArgument.ToString();
            v.Id = int.Parse(id);
            v.Leave = 1;
            v.DepartureTime = DateTime.Now.ToString();
            bool flag = VisitRecordManager.UpdateVR(v);
            if (flag)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                InitData();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table;
            string selectedFeeType = DropDownList1.SelectedValue;
            string state = this.inputDate1.Text;
            string end = this.inputDate2.Text;
            string resident = this.name.Text;        
            switch (selectedFeeType)
            {
                case "已离开":
                    a = 1;
                    table = VisitRecordManager.Findnametime(resident, state, end, a);
                    break;
                case "未离开":
                    a = 0;
                    table = VisitRecordManager.Findnametime(resident, state, end, a );
                    break;
                default:
                    a = 4;
                    table = VisitRecordManager.Findnametime(resident, state, end, a);
                    break;
            }

            this.VisitRecordListTable.DataSource = table;
            this.VisitRecordListTable.DataBind();
        }
        protected void select_Click(object sender, EventArgs e)
        {
            string selectedState = DropDownList1.SelectedValue;
            int paidStatus = 4;
            switch (selectedState)
            {
                case "已离开":
                    paidStatus = 1;
                    break;
                case "未离开":
                    paidStatus = 0;
                    break;
            }
            if (paidStatus == 4)
            {
                string state = this.inputDate1.Text;
                string end = this.inputDate2.Text;
                string resident = this.name.Text;

                DataTable data = VisitRecordManager.Findnametime2(resident, state, end);
                this.VisitRecordListTable.DataSource = data;
                this.VisitRecordListTable.DataBind();
            }
            else
            {
                string state = this.inputDate1.Text;
                string end = this.inputDate2.Text;
                string resident = this.name.Text;

                DataTable data = VisitRecordManager.Findnametime(resident, state, end, paidStatus);
                this.VisitRecordListTable.DataSource = data;
                this.VisitRecordListTable.DataBind();
            }

        }
    }
}