using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.LoginUI
{
    public partial class RepairerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click1(object sender, EventArgs e)
        {                
                string username = this.UserName.Text;
                string password = this.Password.Text;

                // 调用普通用户登录验证方法并获取用户ID
                int userId = BLL.ResidentManager.StaffLogin(username, password);
               
                if (userId > 0) // 登录成功
                {
                PublicVariable.StaffId = userId;
                // 重定向到指定页面
                Response.Redirect("~/Views/StaffXiTong/GeRenZhongXin.aspx");
                }
                else
                {
                    Response.Write("<script>alert('登录失败');</script>");
                    this.Password.Text = ""; // 清空密码框内容
                }          
        }
    }
}