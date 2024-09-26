using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
namespace UI.Views.LoginUI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LoginButton_Click1(object sender, EventArgs e)
        {
            // 获取勾选框状态
            bool isAdmin = Request.Form["isAdmin"] == "on";

            if (isAdmin)
            {
                string adminUsername = this.UserName.Text;
                string adminPassword = this.Password.Text;
                // 调用管理员登录验证方法
                bool flag = BLL.AdministratorManager.AdministratorLogin(adminUsername, adminPassword);
                if (flag)
                {
                    Response.Redirect("~/Views/ResidentUI/ResidentList.aspx");
                }
                else
                {
                    Response.Write("<script>alert('管理员登录失败');</script>");
                    this.Password.Text = ""; // 清空密码框内容
                }
            }
            else
            {
                string username = this.UserName.Text;
                string password = this.Password.Text;

                // 调用普通用户登录验证方法并获取用户ID
                int userId = BLL.ResidentManager.LOGIN(username, password);         
                if (userId > 0) // 登录成功
                {
                    PublicVariable.Login = userId;//将ID传给公共变量Login
                    Session["UserId"] = userId;//将ID传给Session
                    // 重定向到指定页面
                    Response.Redirect("~/Views/DomesticConsumer/PersonalInformation.aspx");
                }
                else
                {
                    Response.Write("<script>alert('登录失败');</script>");
                    this.Password.Text = ""; // 清空密码框内容
                }
            }
        }
    }
}