using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
using System.Data;
namespace UI.Views.StaffXiTong
{
    public partial class QingJia : System.Web.UI.Page
    {
        Inform inform = new Inform();
        string informname;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            string selectedFeeType = DropDownList1.SelectedValue;
            switch (selectedFeeType)
            {
                case "事假":
                    informname = "事假";

                    break;
                case "病假":
                    informname = "病假";
                    break;
                default:
                    break;
            }
        }
        protected void Uploading_Click(object sender, EventArgs e)
        {
            // 获取当前选中的请假类型
            string selectedFeeType = DropDownList1.SelectedValue;

            // 根据选中的请假类型设置inform的InformName属性
            switch (selectedFeeType)
            {
                case "事假":
                    inform.InformName = "事假";
                    break;
                case "病假":
                    inform.InformName = "病假";
                    break;
                default:
                    // 如果没有匹配项，可以设置一个默认值或者抛出异常
                    inform.InformName = "未知类型";
                    break;
            }

            string name;
            string gonghao;
         
            DataTable table = ShangMenStaffManager.FindALLById(PublicVariable.StaffId);
            if(table.Rows.Count > 0)
            {
                DataRow row = table.Rows[0];
                 gonghao = row["JobNumber"].ToString();
                 name = row["Name"].ToString();
                inform.Sender = name;
                inform.SenderId = gonghao;
                inform.time = this.inputDate1.Text;
                inform.timeEnd = this.inputDate2.Text;
                inform.content = this.TextArea1.InnerText;
                inform.ResidentId = 1;        
                InformManager.ADDcontent(inform);
             
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }
        

        }
   
    }
}