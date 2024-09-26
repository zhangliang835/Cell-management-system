using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using System.Data;
namespace UI.Views.Carbarn
{
    public partial class CarbarnList : System.Web.UI.Page
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
   
            this.CarbarnListUI.DataSource = CarbranManager.FindAllCarbarn();
            this.CarbarnListUI.DataBind();

        }

        protected void CarbarnDelete_Click_Click(object sender, EventArgs e)
        {
            Session["chekushanchu"] = ((Button)sender).CommandArgument.ToString();
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal5').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }
        protected void ShanChu_Click(object sender, EventArgs e)
        {
            int Id = int.Parse(Session["chekushanchu"].ToString());//主键

            int ResidentId = CarbranManager.FindCarbarnResidentId(Id);//业主ID
            if (ResidentId > 0)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal12').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);

            }
            else
            {
                bool flag = CarbranManager.DeleteCarbarn(int.Parse(Session["chekushanchu"].ToString()));
                if (flag == true)
                {
                    // 使用客户端脚本打开模态对话框
                    string script = "$(function() { $('#myModal6').modal('show'); });";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                    //删除成功
                    InitData();
                }
                else
                {
                    //删除失败
                    Response.Write("<script>('删除失败')</script>");
                }
                Session.Remove("chekushanchu"); // 清除Session，无论更新成功与否都应清除
            }
        }
        //新增登记车库
        protected void CarbarnADD_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.ADDcarbarn.Text))
            {

                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal8').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }
            else
            {
                DataTable AllCarbarnTable = CarbranManager.FindAllCarbarn();//查询所有车库
                bool carbarnlist = false;
                foreach (DataRow dataRow in AllCarbarnTable.Rows)//检查新增输入的车库名称是否已经被登记过
                {
                    if (dataRow["CarbarnName"].ToString().Equals(this.ADDcarbarn.Text, StringComparison.OrdinalIgnoreCase))
                    {
                        carbarnlist = true;
                        break;
                    }
                }
                if (carbarnlist == false)//如果没有登记过
                {
                    Model.Carbarn carbarn = new Model.Carbarn();
                    carbarn.CarbarnName = this.ADDcarbarn.Text;
                    bool flag = CarbranManager.ADDCarbarn(carbarn);
                    if (flag)
                    {
                        // 使用客户端脚本打开模态对话框
                        string script = "$(function() { $('#myModal10').modal('show'); });";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                        InitData();
                    }
                }
                else//如果登记过
                {
                    // 使用客户端脚本打开模态对话框
                    string script = "$(function() { $('#myModal1').modal('show'); });";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                }
            }  
        }
        //模糊查询事件
        protected void select_Click(object sender, EventArgs e)
        {
            string name = this.selectCarbarnname.Text;
            string ownername = this.selectPeople.Text;

            this.CarbarnListUI.DataSource = CarbranManager.FindMHAllCarbarn(name, ownername);
            this.CarbarnListUI.DataBind();
        }

        //初始化
        protected void CarbarnUpdate_Click_Click(object sender, EventArgs e)
        {
            Session["cabarnchushihua"] = ((Button)sender).CommandArgument.ToString();
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal4').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }
        protected void chushihua_Click(object sender, EventArgs e)
        {
            Model.Carbarn carbarn = new Model.Carbarn();
            carbarn.ResidentName = "";
            carbarn.ResidentId = 0;
            carbarn.State = 0;
            carbarn.Phone = "";
            carbarn.Id = int.Parse(Session["cabarnchushihua"].ToString());
            bool flag = CarbranManager.UpdateCarbarn2(carbarn);
            if (flag)
            {       // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal9').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                InitData();
            }
            Session.Remove("cabarnchushihua"); // 清除Session
        }
        protected void UpdateCarbarn_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString();
            Session["carbarnID"] = int.Parse(id);
            string carbarnname = CarbranManager.FindCarbarnName(int.Parse(id));
            this.CarbarnId.Text = carbarnname;
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }

        protected void Updatecarbarnname_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.CarbarnId.Text))
            {
                Model.Carbarn carbarn = new Model.Carbarn();
                carbarn.CarbarnName = this.CarbarnId.Text;
                carbarn.Id = int.Parse(Session["carbarnID"].ToString());
                DataTable AllCarbarnTable = CarbranManager.FindAllCarbarn();//查询所有车库
                bool carbarnlist = false;
                foreach (DataRow dataRow in AllCarbarnTable.Rows)//检查新增输入的车库名称是否已经被登记过
                {
                    if (dataRow["CarbarnName"].ToString().Equals(this.CarbarnId.Text, StringComparison.OrdinalIgnoreCase))
                    {
                        carbarnlist = true;
                        break;
                    }
                }
                if (carbarnlist == false)//如果没有登记过
                {

                    bool flag = CarbranManager.UpdateCarbarn3(carbarn);
                    if (flag)
                    {
                        // 使用客户端脚本打开模态对话框
                        string script = "$(function() { $('#myModal11').modal('show'); });";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                        InitData();
                    }
                }
                else//如果登记过
                {
                    // 使用客户端脚本打开模态对话框
                    string script = "$(function() { $('#myModal3').modal('show'); });";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                }
                Session.Remove("carbarnID");//清除Session
            }
            else
            {
 
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal10').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }
         
        }

      
    }
}



