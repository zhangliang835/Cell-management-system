using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.Notice
{
    public partial class NoticeLooK : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextArea1.Attributes["readonly"] = "readonly";
                int Id = int.Parse(Request.QueryString["Id"].ToString());
                Model.Notice notice = NoticeManager.FindALLById(Id);

                this.Headline1.Text = notice.Title;
                this.TextArea1.InnerText = notice.Content;
                this.NoticePhotoView.ImageUrl = notice.Photo;
            }
        }
        protected void Uploading_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Notice/NoticeList.aspx");
        }
    }
}