using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.ResidentUI
{
    public partial class ResidentFinishUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
       /*     if (!IsPostBack)
            {
                int id = PublicVariable.PepairerUiPassID;
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
            }*/
        }
        protected void PhotoAfterUpload_Click(object sender, EventArgs e)
        {
            if (this.PhotoAfter.HasFile)//判断是否有正在等待上传的文件
            {
                //获取上传文件的名称
                string fileName = this.PhotoAfter.FileName;
                string fillX = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();
                //把文件后缀转换成大写或小写

                //fillX = fillX.ToUpper();//大写
                if (fillX == "jpg" || fillX == "png")
                {
                    //获取文件上传的路径
                    string path = Server.MapPath("~/maintainUpload/");
                    //实现文件上传
                    this.PhotoAfter.SaveAs(path + fileName);
                    //图片预览
                    this.PhotoAfterView.ImageUrl = "~/maintainUpload/" + fileName;
                }
                else
                {
                    //文件类型不正确
                    Response.Write("<script>alert('文件格式不正确');</script>");
                }
            }
        }

/*        protected void Affirm_Click(object sender, EventArgs e)
        {
            int id = PublicVariable.PepairerUiPassID;
            MaintenanceRecord maintenance = new MaintenanceRecord();
            maintenance.expenses = this.Money.Text;
            maintenance.Id = id;
            maintenance.RepairEndTime = DateTime.Now.ToString();
            maintenance.PhotoAfter = this.PhotoAfterView.ImageUrl;
            maintenance.Status = 2;
            bool flag = MaintenanceRecordManager.UpdateMaintenance3(maintenance);
            if (flag)
            {
                Response.Redirect("RepairerUI.aspx");
            }
        }*/
    }
}