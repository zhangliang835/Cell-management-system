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
    public partial class gerenzhongxin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {


                Model.Resident resident = ResidentManager.FindUserById(PublicVariable.Login);
                if (resident != null)
                {
                    this.UserPhoto.ImageUrl = resident.Photo;
                    this.UserName.Text = resident.Username;
                    this.name.Text = resident.Name;
                    this.usersex.Text = resident.Sex == 1 ? "男" : "女";
                    this.userphone.Text = resident.Phone;
                   
              
                    this.userhouse.Text = resident.HouseName;
                }
            }
        }

        protected void CarbranUpload_Click(object sender, EventArgs e)
        {
            if (this.CarPhoto.HasFile)//判断是否有正在等待上传的文件
            {
                //获取上传文件的名称
                string fileName = this.CarPhoto.FileName;
                string fillX = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();

                if (fillX == "jpg" || fillX == "png")
                {
                    //获取文件上传的路径
                    string path = Server.MapPath("~/carUpload/");
                    // 实现文件上传，这里应该是CarPhoto.SaveAs()而不是UserPhoto.SaveAs()
                    this.CarPhoto.SaveAs(path + fileName);
                    // 图片预览
                    this.CarPhotoView.ImageUrl = "~/carUpload/" + fileName;
                }
                else
                {
                    // 文件类型不正确
                    Response.Write("<script>alert('文件格式不正确');</script>");
                }
            }
        }
/*
        protected void queren_Click(object sender, EventArgs e)
        {
            Model.Carbarn carbarn = new Model.Carbarn();
            carbarn.ResidentId = PublicVariable.Login.ToString();
            carbarn.ResidentName = this.ResidentName.Text;
            carbarn.Phone = this.Phone.Text;
            carbarn.State = this.State.Value;
            carbarn.CarbarnName = this.CarbranName.Text;
            bool flag = CarbranManager.UpdateCarbran(carbarn);
            if (flag)
            {
                Response.Write("<script>alert('已报备');</script>");
            }
            else
            {
                Response.Write("<script>alert('失败，请联系管理员');</script>");
            }
        }*/

/*        protected void CarUpload_Click(object sender, EventArgs e)
        {
            if (this.CarPhoto1.HasFile)//判断是否有正在等待上传的文件
            {
                //获取上传文件的名称
                string fileName = this.CarPhoto1.FileName;
                string fillX = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();

                if (fillX == "jpg" || fillX == "png")
                {
                    //获取文件上传的路径
                    string path = Server.MapPath("~/carUpload/");
                    // 实现文件上传，这里应该是CarPhoto.SaveAs()而不是UserPhoto.SaveAs()
                    this.CarPhoto1.SaveAs(path + fileName);
                    // 图片预览
                    this.previewImg.ImageUrl = "~/carUpload/" + fileName;
                }
                else
                {
                    // 文件类型不正确
                    Response.Write("<script>alert('文件格式不正确');</script>");
                }
            }
        }*/

        protected void queren1_Click(object sender, EventArgs e)
        {
            if (this.CarPhoto1.HasFile)//判断是否有正在等待上传的文件
            {
                //获取上传文件的名称
                string fileName = this.CarPhoto1.FileName;
                string fillX = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();

                if (fillX == "jpg" || fillX == "png")
                {
                    //获取文件上传的路径
                    string path = Server.MapPath("~/carUpload/");
                    // 实现文件上传，这里应该是CarPhoto.SaveAs()而不是UserPhoto.SaveAs()
                    this.CarPhoto1.SaveAs(path + fileName);
                    // 图片预览
                    this.previewImg.ImageUrl = "~/carUpload/" + fileName;
                }
                else
                {
                    // 文件类型不正确
                    Response.Write("<script>alert('文件格式不正确');</script>");
                }
            }
            Car car = new Car();
            car.OwnerId = PublicVariable.Login;
            car.OwnerName = this.ResidentName1.Text;
            car.Name = this.CarName.Text;
            car.Photo = this.previewImg.ImageUrl;
             CarManager.AddCar(car);
            Resident r = new Resident();
       
            r.Id = PublicVariable.Login;
        
     /*       bool flag = ResidentManager.UpdateUserCar(r);*/
       /*     if (flag)
            {
                Response.Write("<script>alert('车辆已报备');</script>");
            }
            else
            {
                Response.Write("<script>alert('失败，请联系管理员');</script>");
            }*/
        }
    }
}