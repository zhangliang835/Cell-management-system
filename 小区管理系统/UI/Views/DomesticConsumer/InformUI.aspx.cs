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
    public partial class InformUI : System.Web.UI.Page
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
                    Model.Inform inform = new Model.Inform
                    {

                        time = row["time"].ToString(),
                        content = row["content"].ToString(),
                        InformName = row["InformName"].ToString(),
                        Sender = row["Sender"].ToString()
                    };
                    this.name.Text = inform.InformName;
                    this.date.Text = inform.time.ToString(); // 注意此处Time首字母大写，假设对应类属性名称
                    this.TextArea1.InnerText = inform.content;
                    this.pople.Text = inform.Sender;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("InformList.aspx");
        }
    }
}