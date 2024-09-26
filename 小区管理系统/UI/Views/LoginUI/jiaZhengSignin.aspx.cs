using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.Views.JiaZhengUI;

namespace UI.Views.LoginUI
{
    public partial class jiaZhengSignin : System.Web.UI.Page
    {
        private Random random; // 声明Random实例
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                random = new Random(); // 在页面加载时初始化Random实例
            }
        }
        //注册
        protected void SigninButton_Click(object sender, EventArgs e)
        {
            if (random == null)
            {
                random = new Random();
            }
            ShangMenStaff staff = new ShangMenStaff();
            staff.UserName = this.UserName.Text;
            staff.Posswork = this.Password.Text;
            staff.State = 2;
            staff.Grade = 1;
            staff.Name = this.Name.Text;
            staff.Sex = int.Parse(this.Sex.Value);
            staff.Age = int.Parse(this.Age.Text);
            staff.Phone = this.Phone.Text;
            staff.Photo = this.UserPhotoView.ImageUrl;
            staff.Department = int.Parse(this.Department.Value);
            staff.ChuQianTime = "";
            staff.JobNumber = GenerateJobNumber(staff.Department, staff.Sex, staff.Age);
            bool flag = ShangMenStaffManager.AddJiaZhengStaff(staff);
            if (flag)
            {
                Response.Redirect("~/Views/LoginUI/JiaZhengLogin.aspx");
            }
            else
            {
                Response.Write("<script>alert('注册失败');</script>");
            }
        }
        // 生成工号:
        private string GenerateJobNumber(int departmentId, int sex, int age)
        {
            string randomPart = random.Next(10000).ToString("D4"); // 使用已声明并初始化的Random实例生成四位随机数并格式化为字符串
            return $"{departmentId}{sex}{age}{randomPart}";
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
    }
}