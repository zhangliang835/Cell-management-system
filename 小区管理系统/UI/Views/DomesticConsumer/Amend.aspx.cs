using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.DomesticConsumer
{
    public partial class Amend : System.Web.UI.Page
    {
        int userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    userId = int.Parse(Request.QueryString["Id"].ToString());
                }
                else
                {
                    if (Convert.ToInt32(Session["UserId"]) != 0)
                    {
                        userId = Convert.ToInt32(Session["UserId"]);
                    }
                }

                PopulateUserInfo(userId);
            }

        }
        private void PopulateUserInfo(int userId)
        {
            Model.Resident resident = ResidentManager.FindUserById(userId);

            if (resident != null)
            {
                this.UserName.Text = resident.Username;

                this.Name.Text = resident.Name;
                this.Sex.Value = resident.Sex.ToString() ;
                this.UserPhotoView.ImageUrl = resident.Photo;
                this.Phone.Text = resident.Phone;


                this.HouseName.Text = resident.HouseName;

            }
            else
            {
                // 处理找不到用户的情况，例如显示错误信息或重定向到错误页面
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
            Model.Resident resident = new Model.Resident();
            resident.Username = this.UserName.Text;
            resident.Name = this.Name.Text;
            resident.Sex = int.Parse(this.Sex.Value);
            resident.Photo = this.UserPhotoView.ImageUrl;
            resident.Phone = this.Phone.Text;
            resident.HouseName = this.HouseName.Text;
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
                Response.Write("<script>alert('无法修改，输入的房屋不存在。');</script>");

                return;
            }
            if (houseExists)//存在
            {
                if (Request.QueryString["Id"] == null)
                {
                    int updateId = HouseManager.FindHouseIdByOrderID(int.Parse(Session["UserId"].ToString())); // 获取要更新的房产的ID
                    DataTable data = HouseManager.FindAllHouseByID(updateId); // 查找原始的房产信息
                    DataRow row = data.Rows[0];

                    if (row["RoomNumber"].ToString() != null && !this.HouseName.Text.Equals(row["RoomNumber"].ToString(), StringComparison.OrdinalIgnoreCase))
                    {
                        // 如果房产号被试图更改，检查新房产号是否唯一
                        DataTable allHousesDataTable2 = HouseManager.FindAllHouse();
                        bool houseExists2 = false;
                        foreach (DataRow houseRow in allHousesDataTable2.Rows)   // 检查输入的房屋名称是否已登记
                        {
                            if (houseRow["RoomNumber"].ToString().Equals(this.HouseName.Text, StringComparison.OrdinalIgnoreCase))
                            {
                                houseExists2 = true;
                                break;
                            }
                        }
                        if (houseExists2)
                        {
                            /*  // 使用客户端脚本打开模态对话框
                              string script = "$(function() { $('#myModal8').modal('show'); });";
                              ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);*/
                            Response.Write("<script>alert('该房产信息已被入住登记，无法修改');</script>");
                            return;
                        }
                    }

                    resident.Id = Convert.ToInt32(Session["UserId"]);
                    bool flag = ResidentManager.UpdateUser(resident);
                    if (flag)
                    {
                    

                        // 使用客户端脚本打开模态对话框
                        string script = "$(function() { $('#myModal11').modal('show'); });";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                        Response.Redirect("PersonalInformation.aspx");
                        return;
                    }
                    else
                    {
                        Response.Write("<script>alert('信息修改失败');</script>");
                    }
                }
                else if (Request.QueryString["Id"] != null)
                {
                    int updateId = HouseManager.FindHouseIdByOrderID(int.Parse(Request.QueryString["Id"])); // 获取要更新的房产的ID
                    DataTable data = HouseManager.FindAllHouseByID(updateId); // 查找原始的房产信息
                    DataRow row = data.Rows[0];

                    if (row["RoomNumber"].ToString() != null && !this.HouseName.Text.Equals(row["RoomNumber"].ToString(), StringComparison.OrdinalIgnoreCase))
                    {
                        // 如果房产号被试图更改，检查新房产号是否唯一
                        DataTable allHousesDataTable2 = HouseManager.FindAllHouse();
                        bool houseExists2 = false;
                        foreach (DataRow houseRow in allHousesDataTable2.Rows)   // 检查输入的房屋名称是否已登记
                        {
                            if (houseRow["RoomNumber"].ToString().Equals(this.HouseName.Text, StringComparison.OrdinalIgnoreCase))
                            {
                                houseExists2 = true;
                                break;
                            }
                        }
                        if (houseExists2)
                        {
                            /*  // 使用客户端脚本打开模态对话框
                              string script = "$(function() { $('#myModal8').modal('show'); });";
                              ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);*/
                            Response.Write("<script>alert('该房产信息已被入住登记，无法修改');</script>");
                            return;
                        }
                    }

                    resident.Id = int.Parse(Request.QueryString["Id"]);
                    bool flag = ResidentManager.UpdateUser(resident);
                    if (flag)
                    {
                      
                        Response.Redirect("~/Views/ResidentUI/ResidentList.aspx");
                   
                        return;
                    }
                    else
                    {
                        Response.Write("<script>alert('信息修改失败');</script>");
                    }
                }
            }
  

           
        }
    }
}