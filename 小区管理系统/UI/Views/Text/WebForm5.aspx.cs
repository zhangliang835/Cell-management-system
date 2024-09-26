using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.Text
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }
        public void InitData()
        {
            List<Model.Resident> residents = ResidentManager.FindUserALL();
            this.ResidentListTable.DataSource = residents;
            this.ResidentListTable.DataBind();

        }
    }
}