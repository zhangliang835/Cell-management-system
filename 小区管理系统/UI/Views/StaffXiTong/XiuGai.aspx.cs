using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.StaffXiTong
{
    public partial class XiuGai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Into();
            }
        }
        public void Into()
        {
            DataTable table = ShangMenStaffManager.FindALLById(PublicVariable.StaffId);

            if (table.Rows.Count > 0)
            {
                DataRow row = table.Rows[0];
                this.UserName.Text = row["UserName"].ToString();
                this.Password.Text = row["Posswork"].ToString();
                this.Name.Text = row["Name"].ToString();
                this.Sex.Value = row["Sex"].ToString();
                this.Age.Text = row["Age"].ToString();
                this.UserPhotoView.ImageUrl = row["Photo"].ToString();
                this.Phone.Text = row["Phone"].ToString();
                this.Department.Value = row["Department"].ToString();
            }
        }
        protected void UserPhotoUpload_Click(object sender, EventArgs e)
        {
            if (this.UserPhoto.HasFile)//判断是否有正在等待上传的文件
            {
                //获取上传文件的名称
                string fileName = this.UserPhoto.FileName;
                string fillX = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();
                //把文件后缀转换成大写或小写

                //fillX = fillX.ToUpper();//大写
                if (fillX == "jpg" || fillX == "png")
                {
                    //获取文件上传的路径
                    string path = Server.MapPath("~/upload/");
                    //实现文件上传
                    this.UserPhoto.SaveAs(path + fileName);
                    //图片预览
                    this.UserPhotoView.ImageUrl = "~/upload/" + fileName;
                }
                else
                {
                    //文件类型不正确
                    Response.Write("<script>alert('文件格式不正确');</script>");
                }
            }
        }
        protected void SigninButton_Click(object sender, EventArgs e)
        {
            ShangMenStaff staff = new ShangMenStaff();
            staff.Name = this.Name.Text;
            staff.Sex = int.Parse(this.Sex.Value);
            staff.Age = int.Parse(this.Age.Text);
            staff.Photo = this.UserPhotoView.ImageUrl;
            staff.Phone = this.Phone.Text;
            staff.UserName = this.UserName.Text;
            staff.Posswork = this.Password.Text;
            staff.Department = int.Parse(this.Department.Value);
            staff.Id = PublicVariable.StaffId;
            bool flag = ShangMenStaffManager.Update(staff);
            if (flag)
            {
                Response.Redirect("~/Views/StaffXiTong/GeRenZhongXin.aspx");
            }
            else
            {
                Response.Write("<script>alert('修改失败');</script>");
            }
        }
    }
}



