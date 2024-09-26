using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.DomesticConsumer
{
    public partial class ComplaintList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//数据初始化
            {
                InitData();
            }
        }
        public void InitData()
        {
            int id = PublicVariable.Login;
            List<Model.Complaint> complaints = ComplaintManager.FindAllByResidentId(id);
            this.ComplaintListView.DataSource = complaints;
            this.ComplaintListView.DataBind();

        }

        protected void ResidentDelete_Click_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
         bool flag =   ComplaintManager.DeleteComplaint(id);
            if (flag)
            {
                InitData();
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }
        }
    }
}