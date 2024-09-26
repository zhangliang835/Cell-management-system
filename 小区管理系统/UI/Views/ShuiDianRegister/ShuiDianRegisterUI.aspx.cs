using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.ShuiDianRegister
{
    public partial class ShuiDianRegisterUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(SangCi.Text) && !string.IsNullOrEmpty(BenCi.Text))
            {
                double sangciValue, benciValue;
                if (double.TryParse(SangCi.Text, out sangciValue) && double.TryParse(BenCi.Text, out benciValue))
                {
                    BiaoCha.Text = (benciValue - sangciValue).ToString();
                }
                else
                {
                    BiaoCha.Text = ""; // 清空表值差文本框，因为输入可能无法转换为数字
                }
            }
        }

        protected void SigninButton_Click(object sender, EventArgs e)
        {
            ServiceCharge service = new ServiceCharge();

            service.ResidentId = HouseManager.FindHouseOwnerID(this.RoomNumber.Text);
            service.ResidentName = HouseManager.FindHouseOwnerName(this.RoomNumber.Text).ToString();
            service.RoomNumber = this.RoomNumber.Text;
            service.SypeId = int.Parse(this.LeiBie.Value);
            service.After = this.BenCi.Text;
            service.Before = this.SangCi.Text;
            service.DiffValue = this.BiaoCha.Text;
            service.PaymentAmount = this.sum.Text;
            service.PaidStatus = 0;
            service.StateTime = DateTime.Now.ToString();
            bool flag2 = ServiceChargeManager.CheckRecordExists(service.RoomNumber, DateTime.Parse(service.StateTime), service.SypeId);
            if (!flag2)
            {
                bool flag = ServiceChargeManager.ADDservice(service);
                if (flag)
                {
                    // 使用客户端脚本打开模态对话框
                    string script = "$(function() { $('#myModal7').modal('show'); });";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                }
                else
                {
                    Response.Write("<script>alert('登记失败');</script>");
                }
            }
            else
            {

                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal2').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
              /*  string feeType = service.SypeId == 2 ? "水费" : service.SypeId == 3 ? "电费" : "费用";
                Response.Write($"<script>alert('无法登记，该业主本月已登记过{feeType}');</script>");*/
            }
        }        
        }
    }
