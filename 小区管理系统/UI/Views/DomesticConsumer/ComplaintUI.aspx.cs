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
    public partial class ComplaintUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int Id;
                int residentId;
                // 获取用户ID，优先从QueryString获取，如果没有则尝试从Session获取
                if (Request.QueryString["Id"] != null)
                {
                    Id = int.Parse(Request.QueryString["Id"].ToString());
                    //根据主键Id查询
                    Model.Complaint complaint = ComplaintManager.FindALLById(Id);
                    this.ResidentName.Text = complaint.ResidentName;
                    this.RoomNumber.Text = complaint.RoomNumber;
                    this.Headline.Text = complaint.Title;
                    this.TextArea1.InnerText = complaint.Content;
                    this.NoticePhotoView.ImageUrl = complaint.Photo;
                }   
                else 
                {
                    residentId = PublicVariable.Login;
                    //根据业主Id查询
                   Resident resident =   ResidentManager.FindUserById(residentId);
                  
                    
                        this.ResidentName.Text = resident.Name;
                        this.RoomNumber.Text = resident.HouseName;
                    
                }
         
            }

        }

        protected void Uploading_Click(object sender, EventArgs e)
        {
            Model.Complaint complaint = new Model.Complaint();
            complaint.ResidentId = PublicVariable.Login;
            complaint.ResidentName = this.ResidentName.Text;
            complaint.RoomNumber = this.RoomNumber.Text;
            complaint.Title = this.Headline.Text;
            complaint.Content = this.TextArea1.InnerText;
            complaint.Time = DateTime.Now.ToString();
            complaint.Photo = this.NoticePhotoView.ImageUrl;
            if (Request.QueryString["Id"] == null)
            {
                bool flag = ComplaintManager.AddComplaint(complaint);
                if (flag)
                {

                    Response.Redirect("ComplaintList.aspx");
                }
                else
                {
                    Response.Write("<script>alert('上传失败');</script>");
                }
            }
            else
            {
                complaint.Id = int.Parse(Request.QueryString["Id"].ToString());
                bool flag = ComplaintManager.UpdateComplaint(complaint);
                if (flag)
                {

                    Response.Redirect("ComplaintList.aspx");
                }
                else
                {
                    Response.Write("<script>alert('上传失败');</script>");
                }
            }
        }

        protected void PhotoUpload_Click(object sender, EventArgs e)
        {

            if (this.Photo.HasFile)//判断是否有正在等待上传的文件
            {
                //获取上传文件的名称
                string fileName = this.Photo.FileName;
                string fillX = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();
                //把文件后缀转换成大写或小写

                //fillX = fillX.ToUpper();//大写
                if (fillX == "jpg" || fillX == "png")
                {
                    //获取文件上传的路径
                    string path = Server.MapPath("~/upload/");
                    //实现文件上传
                    this.Photo.SaveAs(path + fileName);
                    //图片预览
                    this.NoticePhotoView.ImageUrl = "~/upload/" + fileName;
                }
                else
                {
                    //文件类型不正确
                    Response.Write("<script>alert('文件格式不正确');</script>");
                }
            }
        }

        protected void PhotoUpload_Click1(object sender, EventArgs e)
        {

        }

        protected void Uploading_Click1(object sender, EventArgs e)
        {

        }
    }
}