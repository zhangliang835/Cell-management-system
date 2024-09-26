using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.Complaint
{
    public partial class ComplaintUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {

                ComplaintUIInfo(int.Parse(Session["tousuId"].ToString()));
            }
        }
        public void ComplaintUIInfo(int Id)
        {
            Model.Complaint complaint = ComplaintManager.FindALLById(Id);
            
            this.Headline1.Text = complaint.Title;
            this.TextArea1.InnerText = complaint.Content;
            this.PhotoView.ImageUrl = complaint.Photo;
        }

        protected void Uploading_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Complaint/ComplaintList.aspx");
        }


        protected void FanKui_Click(object sender, EventArgs e)
        {
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }

        protected void FaSong_Click(object sender, EventArgs e)
        {
         
            int ID = ComplaintManager.FindResidentIdByID(int.Parse(Session["tousuId"].ToString()));  //业主ID        
            Inform inform = new Inform();
            inform.ResidentId = ID;
            inform.InformName = this.title.Text;
            inform.Sender = "物业管理员";
            inform.content = this.TextArea2.InnerText;
            inform.time = DateTime.Now.ToString();
            bool flag = InformManager.ADDcontent(inform);
            if (flag)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal6').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                Model.Complaint complaint = new Model.Complaint();
                complaint.State = 1;
                complaint.Id = int.Parse(Session["tousuId"].ToString());
                ComplaintManager.UpdateComplaintState(complaint);

            }
            else
            {
                Response.Write("<script>alert('发送失败');</script>");
            }
        }
    }
}