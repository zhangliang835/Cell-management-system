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
    public partial class PersonalInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Into();

                Model.Resident resident = ResidentManager.FindUserById(Convert.ToInt32(Session["UserId"]));
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
        public void IntoFamily()
        {

        }
        public void Into()
        {
         /*   int id = PublicVariable.Login;*/
            int id = Convert.ToInt32(Session["UserId"]);
            RepeaterFamily.DataSource = FamilyManager.FindAll(id);
            RepeaterFamily.DataBind();
            RepeaterCar.DataSource = CarManager.FindCarAllByOwnerId(id);
            RepeaterCar.DataBind();
        }

        //车库报备
        protected void queren_Click(object sender, EventArgs e)
        {
            Model.Carbarn carbarn = new Model.Carbarn();
      /*      carbarn.ResidentId = PublicVariable.Login.ToString();*/
            carbarn.ResidentId = Convert.ToInt32(Session["UserId"]);
            carbarn.ResidentName = this.ResidentName.Text;
            carbarn.Phone = this.Phone.Text;
            carbarn.State =int.Parse(this.State.Value);
            carbarn.CarbarnName = this.CarbranName.Text;
            bool flag = CarbranManager.UpdateCarbran(carbarn);
            if (flag)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);

            }
            else
            {
                Response.Write("<script>alert('失败，请联系管理员');</script>");
            }
           
        }

        //车辆报备
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
         /*   car.OwnerId = PublicVariable.Login;*/
            car.OwnerId = Convert.ToInt32(Session["UserId"]);
            car.OwnerName = this.ResidentName1.Text;
            car.Name = this.CarName.Text;
            car.Photo = this.previewImg.ImageUrl;
            bool flag = CarManager.AddCar(car);
            if (flag)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                Into();
            }
            else
            {
                Response.Write("<script>alert('失败，请联系管理员');</script>");
            }
        }

        protected void bianji_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/DomesticConsumer/Amend.aspx");
        }

        //家庭成报备

        protected void FamilyADD_Click(object sender, EventArgs e)
        {
            if (this.FamilyPhoto.HasFile)//判断是否有正在等待上传的文件
            {
                //获取上传文件的名称
                string fileName = this.FamilyPhoto.FileName;
                string fillX = fileName.Substring(fileName.LastIndexOf(".") + 1).ToLower();

                if (fillX == "jpg" || fillX == "png")
                {
                    //获取文件上传的路径
                    string path = Server.MapPath("~/carUpload/");
                    // 实现文件上传，这里应该是CarPhoto.SaveAs()而不是UserPhoto.SaveAs()
                    this.FamilyPhoto.SaveAs(path + fileName);
                    // 图片预览
                    this.previewImg2.ImageUrl = "~/carUpload/" + fileName;
                }
                else
                {
                    // 文件类型不正确
                    Response.Write("<script>alert('文件格式不正确');</script>");
                }
            }
            Family family = new Family();
            family.FamilySex = int.Parse(this.Sex.Value);
            family.Name1 = this.FamilyName.Text;
            family.Relation = this.FamilyGuanxi.Text;
            family.FamilyPhoto = this.previewImg2.ImageUrl;
            family.ResidentId = Convert.ToInt32(Session["UserId"]);
            bool flag = FamilyManager.FamilyADD(family);
            if (flag)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                Into();
            }
            else
            {
                Response.Write("<script>alert('家庭成员报备失败');</script>");
            }
        }

        protected void DELETECar_Click(object sender, EventArgs e)
        {
            Session["chelinagshanchuID"] = int.Parse(((Button)sender).CommandArgument);
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal4').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }
        protected void cheliangshanchu_Click(object sender, EventArgs e)
        {
            bool flag = CarManager.DeleteCar(int.Parse(Session["chelinagshanchuID"].ToString()));
            if (flag)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal7').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                Into();
            }
            else
            {
                Response.Write("<script>('删除失败')</script>");
            }
            Session.Remove("chelinagshanchuID"); // 清除Session，无论更新成功与否都应清除
        }

        protected void DELETEFamily_Click(object sender, EventArgs e)
        {
            Session["familyshanchuID"] = int.Parse(((Button)sender).CommandArgument);
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal5').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
          
        }

        protected void familyshanchu_Click(object sender, EventArgs e)
        {
            bool flag = FamilyManager.DeleteFamily(int.Parse(Session["familyshanchuID"].ToString()));
            if (flag)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal7').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                Into();
            }
            else
            {
                Response.Write("<script>('删除失败')</script>");
            }
            Session.Remove("familyshanchuID"); // 清除Session，无论更新成功与否都应清除
        }
    }


}
