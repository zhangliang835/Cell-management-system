using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.JiaZhengUI
{
    public partial class YuanGongUI : System.Web.UI.Page
    {
        int a;
        int b;
        protected void Page_Load(object sender, EventArgs e)
        {
            Into();
        }
        public void Into()
        {
            this.ShangMenStaffTableList.DataSource = ShangMenStaffManager.FindALL();
            this.ShangMenStaffTableList.DataBind();
        }

        protected void fenpei_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] != null)
            {
                //修改员工工作状态和接单号、接单时间
                int ID = int.Parse(((Button)sender).CommandArgument);//员工ID
                int id = int.Parse(Request.QueryString["Id"]); //订单id
                string a = ServeManager.dingdan(id);
                ShangMenStaff staff = new ShangMenStaff();
                staff.State = 1;
                staff.DingdanNumber = a;
                staff.Id = ID;
                staff.ChuQianTime = DateTime.Now.ToString();
                ShangMenStaffManager.UpdateStateDinddanNumber(staff);

                //为AttendanceRecord表添加出勤记录
                DataTable table = ShangMenStaffManager.FindJNOPPC(ID);
                if (table.Rows.Count > 0)
                {
                    DataRow row = table.Rows[0];

                    AttendanceRecord attendance = new AttendanceRecord();
                    
                    // 将DataTable中的数据转换并赋值给AttendanceRecord对象的属性
                    attendance.OrderNumber = row["DingdanNumber"].ToString();
                    attendance.JobNumber = row["JobNumber"].ToString();
                    attendance.Name = row["Name"].ToString();
                    attendance.Phone = row["Phone"].ToString();
                    attendance.Photo = row["Photo"].ToString();                
                    attendance.ChuQianTime = row["ChuQianTime"].ToString();
                    AttendanceRecordManager.ADDAttendanceRecord(attendance); 
                }

                //修改分配进度
                Serve serve = new Serve();
                serve.Id = id;
                serve.FenPei = 2;
                ServeManager.UpdateServeFenPei(serve);
                Into();
            }
            else
            {
                Response.Write("<script>alert('请先往前小区订单界面点击分配按钮！');</script>");
            }              
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table;
            string selectedFeeType = DropDownList1.SelectedValue;
            string name = this.Name.Text;
            string jobnumber = this.JobNumber.Text;
            string selectstype = DropDownList2.SelectedValue;
            int stypeid = 3;
            switch (selectstype)
            {
                case "保洁部":
                    stypeid = 1;
                    break;
                case "维修部":
                    stypeid = 2;
                    break;
            }
            switch (selectedFeeType)
            {
                case "家政接单":
                    a = 1;
                    table = ShangMenStaffManager.Findnametime(name, a, stypeid, jobnumber);
                    break;
                case "在职":
                    a = 2;
                    table = ShangMenStaffManager.Findnametime(name, a, stypeid, jobnumber);
                    break;
                case "请假":
                    a = 3;
                    table = ShangMenStaffManager.Findnametime(name, a, stypeid, jobnumber);
                    break;
                default:
                    a = 4;
                    table = ShangMenStaffManager.Findnametime(name, a, stypeid, jobnumber);
                    break;
            }

            this.ShangMenStaffTableList.DataSource = table;
            this.ShangMenStaffTableList.DataBind();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable data = new DataTable();
            string selectstype = DropDownList2.SelectedValue;
            string name = this.Name.Text;
            string jobnumber = this.JobNumber.Text;

            string selectedState = DropDownList1.SelectedValue;
            int paidStatus = 4;
            switch (selectedState)
            {
                case "家政接单":
                    paidStatus = 1;
                    break;
                case "在职":
                    paidStatus = 2;
                    break;
                case "请假":
                    paidStatus = 3;
                    break;          
            }

            switch (selectstype)
            {
                case "保洁部":
                    b = 1;
                    data = ShangMenStaffManager.Findnametime(name,paidStatus, b, jobnumber);
                    break;
                case "维修部":
                    b = 2;
                    data = ShangMenStaffManager.Findnametime(name, paidStatus, b, jobnumber);
                    break;
                default:
                    b = 3;
                    data = ShangMenStaffManager.Findnametime(name, paidStatus, b, jobnumber);
                    break;

            }

            this.ShangMenStaffTableList.DataSource = data;
            this.ShangMenStaffTableList.DataBind();
        }
        protected void select_Click(object sender, EventArgs e)
        {
            string selectedState = DropDownList1.SelectedValue;
            int paidStatus = 4;
            switch (selectedState)
            {
                case "家政接单":
                    paidStatus = 1;
                    break;
                case "在职":
                    paidStatus = 2;
                    break;
                case "请假":
                    paidStatus = 3;
                    break;
            }


            string selectstype = DropDownList2.SelectedValue;
            int stypeid = 3;
            switch (selectstype)
            {
                case "保洁部":
                    stypeid = 1;
                    break;
                case "维修部":
                    stypeid = 2;
                    break;
            }
            if (paidStatus == 4 && stypeid == 3)
            {
                string name = this.Name.Text;
                string jobnumber = this.JobNumber.Text;
                DataTable data = ShangMenStaffManager.Findnametime2(name, jobnumber);
                this.ShangMenStaffTableList.DataSource = data;
                this.ShangMenStaffTableList.DataBind();
            }
            else
            {
                string name = this.Name.Text;
                string jobnumber = this.JobNumber.Text;
                DataTable data = ShangMenStaffManager.Findnametime(name, paidStatus, stypeid, jobnumber);
                this.ShangMenStaffTableList.DataSource = data;
                this.ShangMenStaffTableList.DataBind();
            }
        }
    }
}