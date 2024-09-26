using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.DomesticConsumer
{
    public partial class MaintenanceRecord : System.Web.UI.Page
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
            int a = PublicVariable.Login;  
            List<Model.MaintenanceRecord> maintenances = MaintenanceRecordManager.FindById(a);
            this.MaintenanceListTable.DataSource = maintenances;
            this.MaintenanceListTable.DataBind();

        }

        protected void AffirmButton_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument.ToString();
           Model.MaintenanceRecord maintenance = new Model.MaintenanceRecord();
            maintenance.Status = 1;
            maintenance.Id = int.Parse(id);
            bool flag = MaintenanceRecordManager.UpdateMaintenance4(maintenance);
            if (flag)
            {
                InitData();
            }
            else
            {
              
            }
        }
    }
}