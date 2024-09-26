using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.ShangmenfuwuUI
{
    public partial class WeiXiuList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void baocunarea_Click(object sender, EventArgs e)
        {
            this.Area1.Text = this.AREA.Text + " " + this.Peple.Text + " " + this.Phone.Text;
        }

        protected void baocuntime_Click(object sender, EventArgs e)
        {
            this.Time1.Text = this.shangmenshijian.Text;
        }

        protected void yvyue_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.SelectedServiceName.Value) && !string.IsNullOrEmpty(this.SelectedPrice.Value) &&
                !string.IsNullOrEmpty(this.Phone.Text) && !string.IsNullOrEmpty(this.Peple.Text) && !string.IsNullOrEmpty(this.AREA.Text))
            {
                Serve server = new Serve();
                server.ResName = this.Peple.Text;
                server.ResId = int.Parse(Session["UserId"].ToString());
                server.Phone = this.Phone.Text;
                server.Area = this.AREA.Text;
                server.Name = this.SelectedServiceName.Value;
                server.DownPayment = this.SelectedPrice.Value;
                server.State = 1;
                server.FenPei = 1;
                server.Type = 8;
                //生成订单号
                // 获取当前时间戳，转化为毫秒级，然后取后10位
                long timestampPart = (long)(DateTime.UtcNow - new DateTime(1970, 1, 1)).TotalMilliseconds % 10000000;
                Random random = new Random((int)timestampPart);

                // 添加2位随机数（可以根据需要调整）
                int randomPart = random.Next(100);

                // 拼接订单号
                string orderNumber = $"{timestampPart:0000000}{randomPart:00}";
                server.OrderNumber = orderNumber.PadLeft(12, '0'); // 若不满12位，左侧补零

                //调整时间格式
                if (DateTime.TryParse(this.shangmenshijian.Text, out DateTime parsedTime))
                {
                    server.SMTime = parsedTime.ToString();
                }
                else
                {
                    // 错误处理：无法将用户输入转换为日期时间
                    Response.Write("<script>alert('上门时间格式不正确，请重新输入！');</script>");
                    return;
                }
                server.BeiZhu = this.BeiZhu.Text;
                DateTime smtime = Convert.ToDateTime(server.SMTime);
                DateTime now = DateTime.Now;
                TimeSpan timeDifference = smtime - now;
                if (timeDifference.TotalHours < 2)
                {
                    Response.Write("<script>alert('请预定两小时以外的时间段！');</script>");

                }
                else
                {
                    ServeManager.Add(server);
                    string script = "$(function() { $('#myModal2').modal('show'); });";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowmyModal2", script, true);
                }
            }
            else
            {
                Response.Write("<script>alert('请选择服务项目！');</script>");
            }
        }
    }
}