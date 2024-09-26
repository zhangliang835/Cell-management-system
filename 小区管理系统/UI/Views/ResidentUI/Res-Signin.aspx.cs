using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.ResidentUI
{
    public partial class Res_Signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
            }
        }



        //注册
        protected void SigninButton_Click(object sender, EventArgs e)
        {
            // 获取所有房屋列表
            DataTable allHousesDataTable = HouseManager.FindAllHouse();
            bool houseExists = false;
            foreach (DataRow houseRow in allHousesDataTable.Rows)   // 检查输入的房屋名称是否在所有房屋列表中存在
            {
                if (houseRow["RoomNumber"].ToString().Equals(this.HouseName.Text, StringComparison.OrdinalIgnoreCase))
                {
                    houseExists = true;
                    break;
                }
            }
            if (!houseExists)//不存在
            {
                Response.Write("<script>alert('注册失败，输入的房屋不存在。');</script>");
                return;
            }
            if (houseExists)//存在
            {
                // 检查该房屋是否已经有业主入住
                DataTable dataTable = HouseManager.FindHouse();
                bool flag = false;
                foreach (DataRow row in dataTable.Rows)//遍历，查看输入的房产名是否已被注册
                {
                    if (row["RoomNumber"].ToString().Equals(this.HouseName.Text, StringComparison.OrdinalIgnoreCase))
                    {
                        flag = true;
                        break;
                    }
                }
                if (flag)
                {
                    // 如果房子已经被注册，则通知用户此房已有业主
                    Response.Write("<script>alert('注册失败，该房屋已有业主入住。');</script>");
                }
                else
                {
                    // 如果房子存在并且没有业主入住，则继续注册流程
                    Model.Resident resident = new Model.Resident(0,
                        this.UserName.Text,
                        this.Password.Text,
                        this.Name.Text,
                        Convert.ToInt32(this.Sex.Value),
                        this.UserPhotoView.ImageUrl,
                        this.Phone.Text,
                        this.HouseName.Text);

                    bool flag2 = ResidentManager.AddUser(resident);
                    if (flag2)
                    {
                        // 注册成功，重定向到登录页面
                        Response.Redirect("~/Views/ResidentUI/ResidentList.aspx");
                    }
                    else
                    {
                        // 注册失败，弹出提示
                        Response.Write("<script>alert('注册失败，请稍后再试或联系管理员');</script>");
                    }
                }
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


    }
}