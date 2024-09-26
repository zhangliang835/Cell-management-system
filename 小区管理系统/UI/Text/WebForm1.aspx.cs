using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Text
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int a = 2;
            Session["id"] = a;
            Response.Write("<script>alert("+ Session["id"] + ");</script>");
            Response.Redirect("WebForm2.aspx");
        }
    }
}