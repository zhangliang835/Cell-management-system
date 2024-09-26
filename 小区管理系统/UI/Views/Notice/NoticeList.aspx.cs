using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.Notice
{
    public partial class NoticeLiset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitData();
            }
        }
        public void InitData()
        {
            List<Model.Notice> notices = NoticeManager.FindAllNotice();
            NoticeViewList.DataSource = notices;
            NoticeViewList.DataBind();
        }

        protected void ResidentDelete_Click_Click(object sender, EventArgs e)
        {

           Session["gonggaoID"] =  ((Button)sender).CommandArgument.ToString();
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal4').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);

        }

        protected void shanchu_Click(object sender, EventArgs e)
        {
            bool flag = NoticeManager.DeleteNotice(int.Parse(Session["gonggaoID"].ToString()));
            if (flag == true)
            {
                //删除成功
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                InitData();
            }
            else
            {
                //删除失败
                Response.Write("<script>('用户数据删除失败')</script>");
            }
        }
    }
}