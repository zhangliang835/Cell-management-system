using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.DomesticConsumer
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

 
        protected void Button1_Click1(object sender, EventArgs e)
        {
            // 如果需要在服务器端执行任何操作，请在此处完成...

            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }
    }
}