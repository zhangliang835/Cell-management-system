﻿using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.Master
{
    public partial class Common : System.Web.UI.MasterPage
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
                }
            }
        }
        //修改密码
        protected void Button1_Click(object sender, EventArgs e)
        {
            string laoPassword = this.yuanmima.Text;//原密码
            string newPassword = this.xinmima.Text;//新密码
            string xinPassword = this.querenmima.Text;//再次输入的新密码
            if(!string.IsNullOrEmpty(laoPassword) && !string.IsNullOrEmpty(newPassword) && !string.IsNullOrEmpty(xinPassword))
            {
                string yuanlaidemima = ResidentManager.Findpassword(int.Parse(Session["UserId"].ToString()));//获取原密码
                if (yuanlaidemima == laoPassword)
                {
                    if(newPassword == xinPassword)
                    {
                        Resident resident = new Resident();
                        resident.Id = int.Parse(Session["UserId"].ToString());
                        resident.Password = xinPassword;
                        bool flag = ResidentManager.Updatepassword(resident);
                        if (flag)
                        {
                            //密码修改成功
                           /* Response.Write("<script>alert('密码修改成功');</script>");*/
                            // 使用客户端脚本打开模态对话框
                            string script = "$(function() { $('#myModal22').modal('show'); });";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                        }
                        else
                        {
                            Response.Write("<script>alert('密码修改失败');</script>");
                            //密码修改失败
                     
                        }
                    }
                    else
                    {
                        //密码不相同
                    /*    Response.Write("<script>alert('密码不相同');</script>");*/

                        // 使用客户端脚本打开模态对话框
                        string script = "$(function() { $('#myModal77').modal('show'); });";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                    }
                }
                else
                {
                    //原密码不正确
                  /*  Response.Write("<script>alert('原密码不正确');</script>");*/

                    // 使用客户端脚本打开模态对话框
                    string script = "$(function() { $('#myModal88').modal('show'); });";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
                }
            }
            else
            {
                //信息不完整
              /*  Response.Write("<script>alert('信息不完整');</script>");*/

                // 使用客户端脚本打开模态对话框
                string script = "$(function() { $('#myModal99').modal('show'); });";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModal", script, true);
            }

        }
    }
}