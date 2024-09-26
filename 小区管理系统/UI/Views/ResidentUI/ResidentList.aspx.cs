using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;

namespace UI.Views.ResidentUI
{
    public partial class ResidentList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//数据初始化
            {
                InitData();

                //男女比例统计
                List<Model.Resident> residents = ResidentManager.FindUserALL();
                int maleCount = residents.Count(r => r.Sex == 1);
                int femaleCount = residents.Count(r => r.Sex == 0);
                List<Model.Family> families = ResidentManager.FindFamilyALL();
                int maleCount2 = families.Count(f => f.FamilySex == 1);
                int femaleCount2 = families.Count(f => f.FamilySex == 0);
                int man = maleCount + maleCount2;
                int woman = femaleCount + femaleCount2;
                ViewState["MaleCount"] = man;
                ViewState["FemaleCount"] = woman;
            }
        }
        public void InitData()
        {
            List<Model.Resident> residents = ResidentManager.FindUserALL();
            this.ResidentListTable.DataSource = residents;
            this.ResidentListTable.DataBind();
            this.renkou.Text = ResidentManager.FindAllNumber().ToString();
        }

        //用户删除
        protected void ResidentDelete_Click_Click(object sender, EventArgs e)
        {
            Session["residentDelete"] = ((Button)sender).CommandArgument.ToString();
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal4').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }
        protected void shanchu_Click(object sender, EventArgs e)
        {
            bool flag = ResidentManager.DeleteUser(int.Parse(Session["residentDelete"].ToString()));
            if (flag == true)  //删除成功
            {
              
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
            Session.Remove("residentDelete"); // 清除Session，无论更新成功与否都应清除
        }
        protected void select_Click(object sender, EventArgs e)
        {
            string name = this.selectname.Text;
            string phone = this.selectphone.Text;
           
            string housename = this.selecthousename.Text;
            List<Model.Resident> residents = ResidentManager.FindUserByOrther(name, phone , housename);
            this.ResidentListTable.DataSource = residents;
            this.ResidentListTable.DataBind();
        }

        protected void family_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString();

            this.Repeater1.DataSource = FamilyManager.FindAll(int.Parse(id));
            this.Repeater1.DataBind();
            //打开模态对话框
            string script = "$(function() { $('#myModa2').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModa2", script, true);
        }

      
    }
}