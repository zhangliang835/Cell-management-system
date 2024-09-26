using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
namespace UI.Views.DomesticConsumer
{
    public partial class Maintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              

                // 假设PublicVariable.Login存储的是当前登录用户的ID
                int id = PublicVariable.Login;

                // 使用ResidentManager的FindUserById方法查找指定ID的居民信息
                Resident foundResident = ResidentManager.FindUserById(id);

                // 如果FindUserById方法返回了有效的居民信息，则将其姓名和房间号赋值给界面控件
                if (foundResident != null)
                {
                    this.UserName1.Text = foundResident.Name;
                    this.RoomNumber1.Text = foundResident.HouseName;
                }
                else
                {
                    // 处理找不到居民信息的情况
                    Console.WriteLine("无法找到ID为 {0} 的居民信息", id);
                    // 或者提示用户信息未找到等界面友好操作
                }
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
        

            Model.MaintenanceRecord maintenance = new Model.MaintenanceRecord();
            maintenance.ResidentId = PublicVariable.Login;
            maintenance.ResidentName = this.UserName1.Text;
            maintenance.RoomNumber = this.RoomNumber1.Text;
            maintenance.IssueDescription = this.TextArea1.InnerText;
            maintenance.PhotoBefore = this.PhotoBeforeView.ImageUrl;
            maintenance.ApplyTime = DateTime.Now.ToString();
            bool flag = MaintenanceRecordManager.AddMaintenance(maintenance);
            if (flag)
            {
                Response.Redirect("MaintenanceList.aspx");
            }
            else
            {
                Response.Write("<script>alert('提交失败');</script>");
            }
          
        }

        //报修图片上传
        protected void PhotoBeforeUpload_Click(object sender, EventArgs e)
        {
            if (this.PhotoBefore.HasFile)//判断是否有正在等待上传的文件
            {
                //获取上传文件的名称
                string fileName = this.PhotoBefore.FileName;
                string fillX = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();
                //把文件后缀转换成大写或小写

                //fillX = fillX.ToUpper();//大写
                if (fillX == "jpg" || fillX == "png")
                {
                    //获取文件上传的路径
                    string path = Server.MapPath("~/maintainUpload/");
                    //实现文件上传
                    this.PhotoBefore.SaveAs(path + fileName);
                    //图片预览
                    this.PhotoBeforeView.ImageUrl = "~/maintainUpload/" + fileName;
                }
                else
                {
                    //文件类型不正确
                    Response.Write("<script>alert('文件格式不正确');</script>");
                }
            }
        }
    }
}