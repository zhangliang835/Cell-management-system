using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Text
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               /* int a = (int)Session["id"];
                this.TextBox1.Text = a.ToString();*/
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int a = (int)Session["id"];
            Response.Write("<script>alert(" + Session["id"] + ");</script>");
        }
    }
}