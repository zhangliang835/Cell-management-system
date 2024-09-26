using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
namespace UI.Views.CarUI
{
    public partial class CarUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }
        public void InitData()
        {
           /* List<Model.Car> car = CarManager.FindAllCar();*/
            this.CarListTable.DataSource = CarManager.FindAllCar();
            this.CarListTable.DataBind();

        }
    

        //模糊查询事件
        protected void select_Click(object sender, EventArgs e)
        {
            string name = this.selectCar.Text;
            string ownername = this.selectname.Text;

            this.CarListTable.DataSource = CarManager.FindMHAllCar(name,ownername);
            this.CarListTable.DataBind();
        }

        protected void Buy_Click(object sender, EventArgs e)
        {
            this.CarListTable.DataSource = CarManager.FindBuyCar();
            this.CarListTable.DataBind();
        }

        protected void Lease_Click(object sender, EventArgs e)
        {
            this.CarListTable.DataSource = CarManager.FindLeaseCar();
            this.CarListTable.DataBind();
        }
        protected void CarDelete_Click_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString();
            Session["CarID"] = id;
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal2').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }
        protected void DeleteCar_Click(object sender, EventArgs e)
        {
            CarManager.DeleteCar(int.Parse(Session["CarID"].ToString()));
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal8').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            InitData();
        }
    }
}