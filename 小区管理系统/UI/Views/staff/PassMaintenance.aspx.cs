using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
namespace UI.Views.MaintenanceRecordUI
{
    public partial class PassMaintenance1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = PublicVariable.MaintainId;
                /* int id = (int)Session["MaintainId"];*/
                Model.MaintenanceRecord maintenance = MaintenanceRecordManager.FindAllById(id);
                if (maintenance != null)
                {
                    this.UserName.Text = maintenance.ResidentName;
                    this.RoomNumber.Text = maintenance.RoomNumber;
                    this.IssueDescription.Text = maintenance.IssueDescription;
                    this.PhotoBeforeView.ImageUrl = maintenance.PhotoBefore;
                    this.ApplyTime.Text = maintenance.ApplyTime;
             
                }
                else
                {
                }
            }
        }
/*        public void InitData()
        {
            List<Model.Staff> repairers = StaffManager.FindAllUser();
            this.RepairerListTable.DataSource = repairers;
            this.RepairerListTable.DataBind();

        }
*/
        protected void SelectRepairerButton_Click(object sender, EventArgs e)
        {
            int a = int.Parse(((Button)sender).CommandArgument.ToString());
            this.RepairerID.Text = a.ToString();
    
        }

        protected void Affirm_Click(object sender, EventArgs e)
        {
            MaintenanceRecord maintenance = new MaintenanceRecord();
            maintenance.RepairerID = int.Parse(this.RepairerID.Text);
            maintenance.Status = 3;
            maintenance.Id = PublicVariable.MaintainId;
            MaintenanceRecordManager.UpdateMaintenance(maintenance);
            Response.Redirect("~/Views/MaintenanceRecordUI/MaintenanceRecordUI.aspx");
        }
    }
}