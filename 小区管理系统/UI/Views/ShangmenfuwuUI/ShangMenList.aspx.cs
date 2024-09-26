using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using System.Data;
namespace UI.Views.ShangmenfuwuUI
{
    public partial class ShangMenList : System.Web.UI.Page
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
            
            this.ShangMenListTable.DataSource = ServeManager.FindAllByResidentID(int.Parse(Session["UserId"].ToString()));
            this.ShangMenListTable.DataBind();
          
        }

        protected void ResidentDelete_Click_Click(object sender, EventArgs e)
        {
            Button deleteButton = (Button)sender;
            Session["tuidingID"] = deleteButton.CommandArgument;
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal4').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }
        protected void qvxiao_Click(object sender, EventArgs e)
        {
            var order = ServeManager.FindShangMenTime(int.Parse(Session["tuidingID"].ToString()));
            DateTime smTime = Convert.ToDateTime(order);
            DateTime now = DateTime.Now;
            TimeSpan timeDifference = smTime - now;
            Serve serve = new Serve();
            serve.State = 3;
            serve.OrderNumber = ServeManager.dingdan(int.Parse(Session["tuidingID"].ToString()));
            serve.Id = int.Parse(Session["tuidingID"].ToString());
            ServeManager.UpdateServeState(serve);
            if (timeDifference.TotalHours > 1)
            {
               
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                InitData();
            }
            else
            {
               /* Response.Write("<script>alert('您好，您在上门一小时内取消服务，将收取支付金额的30%最多30元，剩余支付金额按支付通道原路转回，请注意查收!');</script>");*/
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal7').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                InitData();
            }
            Session.Remove("tuidingID"); // 清除Session，无论更新成功与否都应清除
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable table;
            string selectedFeeType = DropDownList1.SelectedValue;
            string state = this.inputDate1.Text;
            string end = this.inputDate2.Text;
            string resident = this.name.Text;
            string ordernumber = this.OrderNumber.Text;
            int residentID = int.Parse(Session["UserId"].ToString());
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
                    table = ServeManager.Findnametime3(resident, state, end, a, stypeid, ordernumber, residentID);
                    break;
                case "退订":
                    a = 3;
                    table = ServeManager.Findnametime3(resident, state, end, a, stypeid, ordernumber, residentID);
                    break;
                case "进行中":
                    a = 1;
                    table = ServeManager.Findnametime3(resident, state, end, a, stypeid, ordernumber, residentID);
                    break;
                default:
                    a = 4;
                    table = ServeManager.Findnametime3(resident, state, end, a, stypeid, ordernumber, residentID);
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
            int residentID = int.Parse(Session["UserId"].ToString());
            switch (selectstype)
            {
                case "深度清洁":
                    b = 1;
                    table = ServeManager.Findnametime3(resident, state, end, paidStatus, b, ordernumber, residentID);
                    break;
                case "日常清洁":
                    b = 2;
                    table = ServeManager.Findnametime3(resident, state, end, paidStatus, b, ordernumber, residentID);
                    break;
                case "衣物洗护":
                    b = 3;
                    table = ServeManager.Findnametime3(resident, state, end, paidStatus, b, ordernumber, residentID);
                    break;
                case "全屋大扫除":
                    b = 4;
                    table = ServeManager.Findnametime3(resident, state, end, paidStatus, b, ordernumber, residentID);
                    break;
                case "油烟机清洗":
                    b = 5;
                    table = ServeManager.Findnametime3(resident, state, end, paidStatus, b, ordernumber, residentID);
                    break;
                case "冰箱清洗":
                    b = 6;
                    table = ServeManager.Findnametime3(resident, state, end, paidStatus, b, ordernumber, residentID);
                    break;
                case "管道疏通":
                    b = 7;
                    table = ServeManager.Findnametime3(resident, state, end, paidStatus, b, ordernumber, residentID);
                    break;
                case "维修服务":
                    b = 8;
                    table = ServeManager.Findnametime3(resident, state, end, paidStatus, b, ordernumber, residentID);
                    break;
                default:
                    b = 9;
                    table = ServeManager.Findnametime3(resident, state, end, paidStatus, b, ordernumber, residentID);

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
                int residentID = int.Parse(Session["UserId"].ToString());
                DataTable data = ServeManager.Findnametime4(resident, state, end, ordernumber, residentID);
                this.ShangMenListTable.DataSource = data;
                this.ShangMenListTable.DataBind();
            }
            else
            {
                string ordernumber = this.OrderNumber.Text;
                string state = this.inputDate1.Text;
                string end = this.inputDate2.Text;
                string resident = this.name.Text;
                int residentID = int.Parse(Session["UserId"].ToString());
                DataTable data = ServeManager.Findnametime3(resident, state, end, paidStatus, stypeid, ordernumber, residentID);
                this.ShangMenListTable.DataSource = data;
                this.ShangMenListTable.DataBind();
            }

        }

        protected void button_Click(object sender, EventArgs e)
        {
            Session["pingjiaID"] =  ((Button)sender).CommandArgument.ToString();
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#ratingModal').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }

        protected void TiJiao_Click(object sender, EventArgs e)
        {
            Serve serve = new Serve();
            serve.Estimate = commentText.InnerText; // 获取评论文本

            // 获取隐藏字段中的星级评价分值
            if (!string.IsNullOrEmpty(ratingValue.Value))
            {
                serve.Grade = Convert.ToInt32(ratingValue.Value);
            }
            else
            {
                // 如果没有评级值，则可以选择设置默认值或适当处理
                serve.Grade = 0; // 示例：如果没有评级，则默认为0
            }
            serve.Id =int.Parse(Session["pingjiaID"].ToString());
            bool flag = ServeManager.UpdateServeGrade(serve);
            if (flag)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal8').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }
            else
            {
                Response.Write("<script>alert('评价失败!');</script>");
            }
            InitData();
        }

    
    }
}