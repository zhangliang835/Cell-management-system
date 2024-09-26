using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using System.Data;
using System.Reflection.Emit;
using System.Web.Routing;
namespace UI.Views.House
{
    public partial class HouseUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InitData();
        }
        public void InitData()
        {
            this.HouseListTable.DataSource = HouseManager.FindAllHouse();
            this.HouseListTable.DataBind();

        }
        protected void CarDelete_Click_Click(object sender, EventArgs e)
        {
            Session["ShanChuID"] = ((Button)sender).CommandArgument.ToString();
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal5').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
         
        }
        protected void ShanChu_Click(object sender, EventArgs e)
        {
            int Id = int.Parse(Session["ShanChuID"].ToString());//主键

            int ResidentId = HouseManager.FindOwnerIdByHouseId(Id);//业主ID
            if (ResidentId > 0)
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal12').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }
            else
            {
                bool flag = HouseManager.DeleteHouse(int.Parse(Session["ShanChuID"].ToString()));
                if (flag == true)
                {

                    // 使用客户端脚本打开模态对话框
                    string script = "$(function() { $('#myModal6').modal('show'); });";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                    //删除成功
                    InitData();
                }
                else
                {
                    //删除失败
                    Response.Write("<script>alert('删除失败')</script>");
                }
            }
        }


        protected void Housed_Click1(object sender, EventArgs e)
        {
      
            this.HouseListTable.DataSource = HouseManager.FindHouse();
            this.HouseListTable.DataBind();
        }

        protected void NoHouse_Click(object sender, EventArgs e)
        {
          
            this.HouseListTable.DataSource = HouseManager.FindNoHouse();
            this.HouseListTable.DataBind();
        }

        protected void AllHouse_Click(object sender, EventArgs e)
        {
            InitData();
        }

        protected void Select_Click1(object sender, EventArgs e)
        {
            string name = this.selectname.Text;
            string roomnumber = this.selectHouseName.Text;
            this.HouseListTable.DataSource = HouseManager.FindHouseByResidentRoomNumber(name, roomnumber);
            this.HouseListTable.DataBind();
        }

        protected void ADDHouse_Click(object sender, EventArgs e)
        {
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }



        protected void ADDHouse2_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(this.roomnumber.Text) && !string.IsNullOrEmpty(this.Area.Text) && !string.IsNullOrEmpty(this.type.Text))
            {
                DataTable allHousesDataTable = HouseManager.FindAllHouse();
                bool houseExists = false;
                foreach (DataRow houseRow in allHousesDataTable.Rows)   // 检查输入的房屋名称是否已登记
                {
                    if (houseRow["RoomNumber"].ToString().Equals(this.roomnumber.Text, StringComparison.OrdinalIgnoreCase))
                    {
                        houseExists = true;
                        break;
                    }
                }
                if (!houseExists)//未登记
                {
                    Model.House house = new Model.House();
                    house.RoomNumber = this.roomnumber.Text;
                    // 尝试解析面积文本框的值为 double
                    if (double.TryParse(this.Area.Text, out double area))
                    {
                        // 如果成功则设置 Area 属性
                        house.Area = area;
                    }
                    else
                    {
                    
                        string script = "$(function() { $('#myModal7').modal('show'); });";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                        return; 
                    }
                    house.Type = this.type.Text;
                   
                    bool flag = HouseManager.ADDHouse(house);
                    if (flag)
                    {
                        // 使用客户端脚本打开模态对话框
                        string script = "$(function() { $('#myModal2').modal('show'); });";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                        InitData();
                    }
                }
                else//已登记
                {
                    // 使用客户端脚本打开模态对话框
                    string script = "$(function() { $('#myModal8').modal('show'); });";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                }
            }
            else
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal9').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }


        }

        protected void UpdateHouse_Click(object sender, EventArgs e)
        {

            string id = ((Button)sender).CommandArgument.ToString();
            Session["updateid"] = id;
            DataTable table = HouseManager.FindAllHouseByID(int.Parse(id));
            if (table.Rows.Count > 0)
            {
                DataRow row = table.Rows[0];           
                // 将DataTable中的数据转换并赋值给AttendanceRecord对象的属性
                this.RoomNumber1.Text = row["RoomNumber"].ToString();
                this.Area1.Text = row["Area"].ToString();
                this.Type1.Text = row["Type"].ToString();         
            }
            // 使用客户端脚本打开模态对话框
            string script = "$(function() { $('#myModal3').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
        }
        protected void UpdateHouse2_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.RoomNumber1.Text) && !string.IsNullOrEmpty(this.Area1.Text) && !string.IsNullOrEmpty(this.Type1.Text))
            {
                int updateId = int.Parse(Session["updateid"].ToString()); // 获取要更新的房产的ID
              DataTable data = HouseManager.FindAllHouseByID(updateId); // 查找原始的房产信息
                DataRow row = data.Rows[0];
              
                if (row["RoomNumber"].ToString() != null && !this.RoomNumber1.Text.Equals(row["RoomNumber"].ToString(), StringComparison.OrdinalIgnoreCase))
                {
                    // 如果房产号被试图更改，检查新房产号是否唯一
                    DataTable allHousesDataTable = HouseManager.FindAllHouse();
                    bool houseExists = false;
                    foreach (DataRow houseRow in allHousesDataTable.Rows)   // 检查输入的房屋名称是否已登记
                    {
                        if (houseRow["RoomNumber"].ToString().Equals(this.RoomNumber1.Text, StringComparison.OrdinalIgnoreCase))
                        {
                            houseExists = true;
                            break;
                        }
                    }
                    if (houseExists)
                    {
                        // 使用客户端脚本打开模态对话框
                        string script = "$(function() { $('#myModal8').modal('show'); });";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                        InitData();
                        return;
                    }
                }

                // 更新房产信息
                Model.House houseToUpdate = new Model.House();
                houseToUpdate.Id = updateId;
                houseToUpdate.RoomNumber = this.RoomNumber1.Text;
            
                // 尝试解析面积文本框的值为 double
                if (double.TryParse(this.Area1.Text, out double area))
                {
                    // 如果成功则设置 Area 属性
                    houseToUpdate.Area = double.Parse(this.Area1.Text);
                }
                else
                {

                    string script = "$(function() { $('#myModal7').modal('show'); });";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                    return;
                }
                houseToUpdate.Type = this.Type1.Text;

                bool flag = HouseManager.UpdateHouse(houseToUpdate);
                if (flag)
                {
                    // 使用客户端脚本打开模态对话框
                    string script = "$(function() { $('#myModal11').modal('show'); });";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                    InitData();
                }
                else
                {
                    Response.Write("<script>alert('修改失败');</script>");
                }
            }
            else
            {
                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal10').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }

            Session.Remove("updateid"); // 清除Session，无论更新成功与否都应清除
        }

        //初始化
        protected void HouseUpdate_Click_Click(object sender, EventArgs e)
        {
            Session["chushihuaID"] = ((Button)sender).CommandArgument.ToString();//获取房产ID
            Session["orderID"] = HouseManager.FindOwnerIdByHouseId(int.Parse(Session["chushihuaID"].ToString()));//根据房产ID获取业主ID
            string script = "$(function() { $('#myModal4').modal('show'); });";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);    
        }
        protected void chushihua_Click(object sender, EventArgs e)
        {
            Model.House house = new Model.House();
            house.OwnerName = "";
            house.OwnerId = 0;
            house.Id = int.Parse(Session["chushihuaID"].ToString());
            bool flag = HouseManager.UpdateHouse2(house);
            if (flag)
            {
                ResidentManager.DeleteUser(int.Parse(Session["orderID"].ToString()));
                string script = "$(function() { $('#myModal1').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                InitData();
            }
            Session.Remove("chushihuaID"); // 清除Session
        }     
    }
}