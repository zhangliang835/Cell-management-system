<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="UI.Views.LoginUI.Signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="../../Content/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/Signin.css" />
    <script type="text/javascript" src="../../JS/Signin.js"></script>
    <style type="text/css">
  
    </style>
    <style>
        .username {
            color: red;
            position: absolute;
            top: calc(17% + 5px);
            left: 62px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;

        }

        .password {
              color: red;
    position: absolute;
    top: calc(32% + 2px);
    left: 62px;
    width: 100%;
    z-index: 1;
    font-size: 14px !important;
        }

        .name {
                color: red;
    position: absolute;
    top: calc(45% + 7px);
    left: 62px;
    width: 100%;
    z-index: 1;
    font-size: 14px !important;
        }

        .phone {
               color: red;
    position: absolute;
    top: calc(59% + 5px);
    left: 62px;
    width: 100%;
    z-index: 1;
    font-size: 14px !important;
        }

        .shid {
            color: red;
            position: absolute;
            top: calc(57% + 7px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .room {
            color: red;
            position: absolute;
            top: calc(88% + 2px);
            left: 62px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }
        .er{
            color:red;
            font-size:20px;
        }
        .re{
            color:whitesmoke;
            font-size:20px;
        }
        .col-sm-8{
                background-color: whitesmoke;
                margin-top:120px;
                    box-shadow: -2px 1px 10px 5px rgba(0, 0, 0, 0.3);
        } 

          .form-control{
       
          box-shadow: 0px 0px 1px 0px rgba(0, 0, 0, 0.3);
    }
          .baocun{
              display:flex;
              justify-content:center;
          }
          .baocun .btn{
              width:200px;
                box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.3);
          }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-8 " >
               
                        
    <div class="row">
   
        <div class="col-sm-6">
            <span>用户注册</span>
            <div class="form-group">
              <i class="er">*</i>
                <label for="username">用户名</label>
                <asp:TextBox ID="UserName" type="text" class="form-control"
                    runat="server" placeholder="请输入用户名"></asp:TextBox>
                <!-- 用户名验证 -->
                <asp:RequiredFieldValidator ID="rfvUserName" runat="server"
                    ControlToValidate="UserName"
                    ErrorMessage="用户名不能为空！"
                    Display="Dynamic"
                    ForeColor="Red"
                    Class="username">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revUserNameLength" runat="server"
                    ControlToValidate="UserName"
                    ErrorMessage="用户名长度不能超过十个字！"
                    ValidationExpression="^.{1,10}$"
                    Display="Dynamic"
                    ForeColor="Red"
                    Class="username">
                </asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                   <i class="er">*</i>
                <label for="password">密码</label>
                <asp:TextBox ID="Password" type="password" class="form-control" placeholder="请输入用户密码" runat="server"></asp:TextBox>
                <!-- 密码验证 -->
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="Password"
                    ErrorMessage="密码不能为空！"
                    Display="Dynamic"
                    ForeColor="Red"
                    Class="password">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPasswordFormat" runat="server"
                    ControlToValidate="Password"
                    ErrorMessage="密码必须由至少十二位英文和数字组成,且区分大小写。"
                    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{12,}$"
                    Display="Dynamic"
                    ForeColor="Red"
                    Class="password">
                </asp:RegularExpressionValidator>

            </div>
            <div class="form-group">
                   <i class="er">*</i>
                <label for="name">姓名</label>
                <asp:TextBox ID="Name" type="text" class="form-control" runat="server"></asp:TextBox>
                <!-- 姓名验证 -->
                <asp:RequiredFieldValidator ID="rfvName" runat="server"
                    ControlToValidate="Name"
                    ErrorMessage="姓名不能为空！"
                    Display="Dynamic"
                    ForeColor="Red"
                    Class="name">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                   <i class="er">*</i>
                <label for="sex">性别</label>
                <select id="Sex" class="form-control" runat="server">
                    <option value="1">男</option>
                    <option value="0">女</option>
                </select>
            </div>
            <div class="form-group">
                   <i class="er">*</i>
                <label for="phone">联系电话</label>
                <asp:TextBox ID="Phone" type="number" class="form-control" runat="server"></asp:TextBox>
                <!-- 联系电话验证 -->
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                    ControlToValidate="Phone"
                    ErrorMessage="联系电话不能为空！"
                    Display="Dynamic"
                    ForeColor="Red"
                    Class="phone">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPhoneFormat" runat="server"
                    ControlToValidate="Phone"
                    ErrorMessage="联系电话必须以1开头，且为11位数字。"
                    ValidationExpression="^1\d{10}$"
                    Display="Dynamic"
                    ForeColor="Red"
                    Class="phone">
                </asp:RegularExpressionValidator>
            </div>
 
      
            <div class="form-group">
                   <i class="er">*</i>
                <label for="houseid">房产单元</label>
                <asp:TextBox ID="HouseName" type="text" class="form-control" runat="server"></asp:TextBox>
                <%-- 验证房产单元 --%>
                <asp:RequiredFieldValidator ID="rfvHouseName" runat="server"
                    ControlToValidate="HouseName"
                    ErrorMessage="房产单元不能为空！"
                    Display="Dynamic"
                    ForeColor="Red"
                    Class="room">
                </asp:RequiredFieldValidator>
            </div>

           
        </div>
        <div class="col-sm-6" style="margin-top:75px;">
            <div class="form-group">
                <label class="control-label">头像选择</label>
                <asp:FileUpload ID="UserPhoto" runat="server" class="form-control" />

            </div>
            <div class="form-group">
                <label class="control-label">头像上传</label>
                <asp:Button ID="UserPhotoUpload" class="btn btn-success" runat="server" Text="上传" OnClick="UserPhotoUpload_Click" />
            </div>
            <div class="form-group">
                <label class="control-label ">头像预览</label>
                <asp:Image ID="UserPhotoView" runat="server" Width="60%" />
            </div>
        </div>
        
    </div>
             <div class="form-group baocun">
     <asp:Button ID="SigninButton" runat="server" Text="保存" class="  btn btn-primary custom-size-button " OnClick="SigninButton_Click" />
 </div>
                </div>
                <div class="col-xs-2"></div>
            </div>
        </div>
    </form>
</body>
</html>
