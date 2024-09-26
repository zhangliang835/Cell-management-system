using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.DomesticConsumer
{
    public partial class InformList : System.Web.UI.Page
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
            int ID = PublicVariable.Login;
            // 前端使用Repeater控件或其他循环控件来显示多条通知
            this.repeaterInforms.DataSource = InformManager.FindAllInform(ID);
            this.repeaterInforms.DataBind();
        }
        protected void delete_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString();
            bool flag = InformManager.DeleteInform(int.Parse(id));
            if (flag == true)
            {
                //删除成功
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
