using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
namespace UI.Views.RepairerUI
{
    public partial class RepairerUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)//数据初始化
            {
                {
                    InitData();
                }
            }


        }
        public void InitData()
        {
            /*int a = PublicVariable.RepairerId;

            List<Model.MaintenanceRecord> maintenances = MaintenanceRecordManager.FindAllByIdSta(a);
            this.MaintenanceListTable.DataSource = maintenances;
            this.MaintenanceListTable.DataBind();*/
        }

/*        protected void PassButton_Click(object sender, EventArgs e)
        {
            PublicVariable.PepairerUiPassID = int.Parse(((Button)sender).CommandArgument.ToString());
            MaintenanceRecord maintenance = new MaintenanceRecord();
            maintenance.Id = PublicVariable.PepairerUiPassID;
            maintenance.RepairStartTime = DateTime.Now.ToString();
            bool flag = MaintenanceRecordManager.UpdateMaintenance2(maintenance);
            if (flag)
            {
                Response.Redirect("RepairerFinishUI.aspx");
            }
            else
            {
                Response.Write("<script>alert('处理失败');</script>");
            }

        }*/
    }
}