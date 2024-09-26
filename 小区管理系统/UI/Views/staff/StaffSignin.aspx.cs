using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using  BLL;
using System.Data;
namespace UI.Views.staff
{
    public partial class StaffSignin : System.Web.UI.Page
    {
        int userId;
        private Random random; // 声明Random实例
        protected void Page_Load(object sender, EventArgs e)
        { 

            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    userId = int.Parse(Request.QueryString["Id"].ToString());
                }
                else if (PublicVariable.Login != 0)
                {
                    userId = PublicVariable.Login;
                }
                else
                {
                    return;
                }
                PopulateUserInfo(userId);
                random = new Random(); // 在页面加载时初始化Random实例
            }
        }
        private void PopulateUserInfo(int userId)
        {
            DataTable table = ShangMenStaffManager.FindALLById(userId);

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
        

            if (Request.QueryString["Id"] != null)
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
                staff.Id = int.Parse(Request.QueryString["Id"]);
                bool flag = ShangMenStaffManager.Update(staff);
                if (flag)
                {
                    Response.Redirect("~/Views/staff/StaffList2.aspx");
                }
                else
                {
                    Response.Write("<script>alert('修改失败');</script>");
                }
            }
            else
            {
                if (random == null)
                {
                    random = new Random();
                }
                ShangMenStaff staff2 = new ShangMenStaff();
                staff2.UserName = this.UserName.Text;
                staff2.Posswork = this.Password.Text;
                staff2.State = 2;
                staff2.Grade = 1;
                staff2.Name = this.Name.Text;
                staff2.Sex = int.Parse(this.Sex.Value);
                staff2.Age = int.Parse(this.Age.Text);
                staff2.Phone = this.Phone.Text;
                staff2.Photo = this.UserPhotoView.ImageUrl;
                staff2.Department = int.Parse(this.Department.Value);
                staff2.ChuQianTime = "";
                staff2.JobNumber = GenerateJobNumber(staff2.Department, staff2.Sex, staff2.Age);
                bool flag = ShangMenStaffManager.AddJiaZhengStaff(staff2);
                if (flag)
                {
                    Response.Redirect("~/Views/staff/StaffList2.aspx");

                }
                else
                {
                    Response.Write("<script>alert('注册失败');</script>");
                }

            }
          
        }

        // 生成工号:
        private string GenerateJobNumber(int departmentId, int sex, int age)
        {
            string randomPart = random.Next(10000).ToString("D4"); // 使用已声明并初始化的Random实例生成四位随机数并格式化为字符串
            return $"{departmentId}{sex}{age}{randomPart}";
        }
    }
}