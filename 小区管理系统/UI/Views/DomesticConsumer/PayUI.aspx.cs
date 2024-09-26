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
    public partial class PayUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }
        public void InitData()
        {

            List<Model.ServiceCharge> services = ServiceChargeManager.FindServiceChargeById(PublicVariable.Login);
            this.ServiceChargeListTable.DataSource = services;
            this.ServiceChargeListTable.DataBind();

        }

        protected void Accomplish_Click(object sender, EventArgs e)
        {
            List<ServiceCharge> services = ServiceChargeManager.FindButton(1);
            this.ServiceChargeListTable.DataSource = services;
            this.ServiceChargeListTable.DataBind();
        }

        protected void Undone_Click(object sender, EventArgs e)
        {

            List<ServiceCharge> services = ServiceChargeManager.FindButton(0);
            this.ServiceChargeListTable.DataSource = services;
            this.ServiceChargeListTable.DataBind();
        }

        protected void Overdue_Click(object sender, EventArgs e)
        {
            List<ServiceCharge> services = ServiceChargeManager.FindButton(2);
            this.ServiceChargeListTable.DataSource = services;
            this.ServiceChargeListTable.DataBind();
        }

        protected void PayButton_Click(object sender, EventArgs e)
        {
            /*  Button payButton = (Button)sender;
              string id = payButton.CommandArgument;
  */
            string id = ((Button)sender).CommandArgument.ToString();
            // 将 Id 存储到 Session 中
            Session["ServiceChargeId"] = id;
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);




        }

        protected void PayButton2_Click(object sender, EventArgs e)
        {
            // 从 Session 中取出 Id
            string id = Session["ServiceChargeId"] as string;

            if (!string.IsNullOrEmpty(id))
            {
                int chargeId;
                if (int.TryParse(id, out chargeId))
                {
                    // 接下来使用获取到的 id 执行更新操作...
                    ServiceCharge service = new ServiceCharge();
                    service.PaidStatus = 1;
                    service.PaymentTime = DateTime.Now.ToString();
                    service.Id = chargeId;
                    ServiceChargeManager.UpdateServiceCharge(service);

                    // 清除 Session 中存储的 Id
                    Session.Remove("ServiceChargeId");

                   
                }
                else
                {
                    // 输出错误信息，或者处理无效Id的情况
                    Response.Write("<script>alert('未能正确识别缴费ID，请检查！');</script>");
                }
            }
            else
            {
                // 输出错误信息，表示 Session 中没有找到 Id
                Response.Write("<script>alert('未能在 Session 中找到缴费ID，请刷新页面重试！');</script>");
            }
        }
    }
}