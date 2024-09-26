using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
using System.Data;
namespace UI.Views.Notice
{
    public partial class NoticeUI1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int Id;

                // 获取用户ID，优先从QueryString获取，如果没有则尝试从Session获取
                if (Request.QueryString["Id"] != null)
                {
                    Id = int.Parse(Request.QueryString["Id"].ToString());
                }            
                else
                {                  
                    return;
                }
                // 调用一个单独的方法来处理查询用户数据并填充界面的工作
                NoticeInfo(Id);
            }
        }

        //根据Id--页面展示方法
        public  void NoticeInfo(int Id)
        {
            Model.Notice notice = NoticeManager.FindALLById(Id);

            this.Headline1.Text = notice.Title;
            this.TextArea1.InnerText = notice.Content;
            this.NoticePhotoView.ImageUrl = notice.Photo;            
        }

        protected void PhotoUpload_Click(object sender, EventArgs e)
        {
            if (this.NoticePhoto.HasFile)//判断是否有正在等待上传的文件
            {
                //获取上传文件的名称
                string fileName = this.NoticePhoto.FileName;
                string fillX = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();
                //把文件后缀转换成大写或小写

                //fillX = fillX.ToUpper();//大写
                if (fillX == "jpg" || fillX == "png")
                {
                    //获取文件上传的路径
                    string path = Server.MapPath("~/upload/");
                    //实现文件上传
                    this.NoticePhoto.SaveAs(path + fileName);
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

        protected void Uploading_Click(object sender, EventArgs e)
        {
            Model.Notice notice = new Model.Notice();
            notice.Title = this.Headline1.Text;
            notice.Content = this.TextArea1.InnerText;
            notice.PublishTime = DateTime.Now.ToString();
            notice.Photo = this.NoticePhotoView.ImageUrl;
            string selectedFeeType = DropDownList1.SelectedValue;
            switch (selectedFeeType)
            {
                case "全体业主":
                    notice.FaSongID = 1;//针对业主的公告
                    break;
                case "全体工作人员":
                    notice.FaSongID = 2;//针对员工的公告
                    break;
                default:
                    break;
            }
            if (Request.QueryString["Id"] == null)
            {
                bool flag = NoticeManager.AddNotice(notice);
                if (flag)
                {

                    Response.Redirect("NoticeList.aspx");
                }
                else
                {
                    Response.Write("<script>alert('上传失败');</script>");
                }
            }
            else
            {
                notice.Id = int.Parse(Request.QueryString["Id"].ToString());
                bool flag = NoticeManager.UpdateNotice(notice);
                if (flag)
                {

                    Response.Redirect("NoticeList.aspx");
                }
                else
                {
                    Response.Write("<script>alert('上传失败');</script>");
                }
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedFeeType = DropDownList1.SelectedValue;   
            switch (selectedFeeType)
            {
                case "全体业主":                   
                    break;
                case "全体工作人员":               
                    break;
                default:                 
                    break;
            }
        }

    }
}