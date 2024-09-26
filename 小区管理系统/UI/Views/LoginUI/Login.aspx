<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UI.Views.LoginUI.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
   <link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css" />
   <link type="text/css" rel="stylesheet" href="../../Master.CSS/Login.css" />
   <style>
       .field-validation-error {
           color: red;
           position: absolute;
           top: calc(34% + 5px);
           left: 51px;
           width: 100%;
           z-index: 1;
               font-size: 12px;
       }

       .field-validation-error2 {
           color: red;
           position: absolute;
           top: calc(54% + 0px);
           left: 51px;
           width: 100%;
           z-index: 1;
               font-size: 12px;
       }
       body{
           background-color:rgba(207,206,217,1);
       }
       .zuo{
           height:333px;
           background-color:rgba(18,0,49,1);
               box-shadow: -5px 1px 20px 0px rgba(0, 0, 0, 0.5);
               display: flex; /* 开启Flex布局 */
 justify-content: center; /* 水平居中对齐 */
 align-items: center; /* 垂直居中对齐 */
       }
       .zuo span{
           color:white;
           font-size:25px;
          font-family:'宋体';   
       } 
       .form-control{
          
             box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.3);
       }
       .mianban{
           height:333px!important;
       }
   </style>
</head>
<body>
    <form id="form1" runat="server" action="#">
        <div class="container">
            <div class="row">
                <div class="col-md-3" > </div>
                <div class="col-md-2" style="background-color:saddlebrown;padding:0!important"> 
                    <div class="zuo">                                         
                        <div><span>欢迎登录<br />小区管理系统！</span></div>                     
                    </div>
                </div>
                <div class="col-md-4" style="background-color:white;padding:0!important" >
                   
                    <div class="mianban" >
                        <span>登录</span>
                        <div class="form-group le">
                            <p class="glyphicon glyphicon-user"></p>
                            <asp:TextBox ID="UserName" class="form-control" type="text"
                                placeholder="请输入用户名" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server"
                                ControlToValidate="UserName"
                                ErrorMessage="用户名不能为空！"
                                Display="Dynamic"
                                ForeColor="Red"
                                Class="field-validation-error">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                             <p class="glyphicon glyphicon-lock" style="top: 48%"></p>
                            <asp:TextBox ID="Password" placeholder="请输入密码" class="form-control" type="password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                ControlToValidate="Password"
                                ErrorMessage="密码不能为空！"
                                Display="Dynamic"
                                ForeColor="Red"
                                Class="field-validation-error2">
                            </asp:RequiredFieldValidator>
                        </div>
                        <span class="two">
                            <input type="checkbox" id="adminCheckbox" name="isAdmin" />
                            <label for="adminCheckbox">管理员登录</label>
                        </span>
                        <div class="text-right">
                          <a href="wangjiPassword.aspx" class="wangjimima" >忘记密码</a>
                            <a href="Signin.aspx">注册</a>
                        </div>

                        <div class="login">
                            <asp:Button ID="LoginButton" class="btn btn-primary " runat="server" Text="登录" OnClick="LoginButton_Click1" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3" ></div>

            </div>
        </div>
    </form>
    <script>


  
    </script>
</body>
</html>
