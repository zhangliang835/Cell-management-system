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

namespace UI.Views.StaffXiTong
{
    public partial class JiaZhengNumber : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Into();
            }
        }

       public void Into()
        {
            string DingDan = ShangMenStaffManager.Finddanhao(PublicVariable.StaffId);//通过员工ID获取订单号
            DataTable data = ServeManager.FindByOrderNumber(DingDan);//根据订单号查询订单
            if (data.Rows.Count > 0)
            {
                DataRow row = data.Rows[0];

                this.dingdannumber.Text= row["OrderNumber"].ToString();
                this.leibie.Text = row["Name"].ToString();
                this.dingjin.Text= row["DownPayment"].ToString();
                this.price.Text = row["price"].ToString();
               this.shangmentime.Text = row["SMTime"].ToString();
               this.residentname.Text = row["ResName"].ToString();
               this.area.Text = row["Area"].ToString();
               this.phone.Text = row["Phone"].ToString();
               this.beizhu.Text = row["BeiZhu"].ToString();          
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /* Response.Write("<script>alert('请在此确认服务完成！');</script>");*/
            string DingDan = ShangMenStaffManager.Finddanhao(PublicVariable.StaffId);//通过员工ID获取订单号
            if (DingDan!="")
            {
                string dingjin = ServeManager.dingjin(DingDan);//通过订单号查询定金
                if (dingjin != "0.0000")//有定金
                {
                    if (string.IsNullOrEmpty(this.dingjia.Text))//如果未定价
                    {
                        // 使用客户端脚本打开模态对话框
                        string script = "$(function() { $('#myModal8').modal('show'); });";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                    }
                    else
                    {
                        double price; // 用来接收解析后的价格
                                      // 尝试将文本转换成double类型的价格
                        bool isValidPrice = double.TryParse(this.dingjia.Text, out price);

                        if (isValidPrice) // 如果文本成功转为double类型
                        {
                            // 根据订单号修改订单状态为已完成、修改价格为定价
                            Serve serve = new Serve();
                            serve.State = 0;
                            serve.price = Convert.ToString(price); // 使用解析后的double类型价格
                            serve.OrderNumber = DingDan;
                            ServeManager.UpdateStatePrice(serve);

                            // 清空员工数据的接单号和接单时间、修改工作状态为在职
                            ShangMenStaff staff = new ShangMenStaff();
                            staff.Id = PublicVariable.StaffId;
                            staff.State = 2;
                            staff.DingdanNumber = null;
                            staff.ChuQianTime = null;
                            ShangMenStaffManager.UpdateStateTime(staff);

                            // 使用客户端脚本打开模态对话框
                            string script = "$(function() { $('#myModal7').modal('show'); });";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                            Into();
                        }
                        else // 如果输入的文本不能转换成double类型
                        {
                            // 使用客户端脚本打开模态对话框
                            string script = "$(function() { $('#myModal4').modal('show'); });";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                        }
                    }
                }
                else//无定金
                {
                    //根据订单号修改订单状态为已完成
                    Serve serve = new Serve();
                    serve.State = 0;
                    serve.OrderNumber = DingDan;
                    ServeManager.UpdateServeState(serve);

                    //清空员工数据的接单号和接单时间、修改工作状态为在职
                    ShangMenStaff staff = new ShangMenStaff();
                    staff.Id = PublicVariable.StaffId;
                    staff.State = 2;
                    staff.DingdanNumber = null;
                    staff.ChuQianTime = null;
                    ShangMenStaffManager.UpdateStateTime(staff);
                    // 使用客户端脚本打开模态对话框
                    string script = "$(function() { $('#myModal7').modal('show'); });";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                    Into();
                }
            }
            else
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }
            
        }
    }
}