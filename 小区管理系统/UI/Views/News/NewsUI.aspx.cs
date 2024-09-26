using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.News
{
    public partial class NewsUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                int id = int.Parse(Request.QueryString["Id"].ToString());
                DataTable informTable = InformManager.FindById(id);

                if (informTable.Rows.Count > 0)
                {
                    DataRow row = informTable.Rows[0];
                    this.gonghao.Text = row["SenderId"].ToString();
                    this.name.Text = row["InformName"].ToString();
                    this.pople.Text = row["Sender"].ToString();
                    this.TextArea1.InnerText = row["content"].ToString();
                    this.date.Text = row["time"].ToString();
                    this.timeEnd.Text = row["timeEnd"].ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewsList.aspx");
        }
    }
}