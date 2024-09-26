using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.Complaint
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
       
            this.ComplaintListView.DataSource = ComplaintManager.FindAll();
            this.ComplaintListView.DataBind();

        }

        protected void Look_Click(object sender, EventArgs e)
        {   
            Session["tousuId"] = ((Button)sender).CommandArgument.ToString();
            Response.Redirect("~/Views/Complaint/ComplaintUI.aspx");
        }
    }

}
