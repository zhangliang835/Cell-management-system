using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.DomesticConsumer
{
    public partial class NoticeUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int Id;
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    Id = int.Parse(Request.QueryString["Id"].ToString());
                }
                else
                {
                    return;
                }
                NoticeInfo(Id);
            }
          
        }
        public void NoticeInfo(int Id)
        {
            Model.Notice notice = NoticeManager.FindALLById(Id);

            this.Headline1.Text = notice.Title;
            this.TextArea1.InnerText = notice.Content;
            this.NoticePhotoView.ImageUrl = notice.Photo;
        }
        protected void Uploading_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/DomesticConsumer/NoticeList.aspx");
        }
    }
}