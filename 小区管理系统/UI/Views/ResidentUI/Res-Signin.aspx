<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="Res-Signin.aspx.cs" Inherits="UI.Views.ResidentUI.Res_Signin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <style type="text/css">
        .mianban{
            background-color:#F2F2F2;     
        }
.form-control {
    border-radius: 0;
    width: 81%;
    border: 1px solid #C9C9C9;
    font-size:14px;
/*自适应高度*/
    height: auto;
}
.container {
  
    height: auto!important;
}
.col-md-8 {
   /* background-color:saddlebrown;*/
}
.form-group {
    display: flex;
    align-items: center;
    margin-bottom: 30px;
    position:relative;
}

.form-group label {
    width: 60px;
    margin-right: 10px;
    font-size:14px;
}


.container span {
    font-weight: bold;
    font-size: 20px;
    font-family: "宋体";
    color: black;
    height: 30px;
    display: block;
    margin: 18px 30px 26px;
}
    </style>
    <style>
        .username {
            color: red;
            position: absolute;
            top: calc(2% + 15px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;

        }

        .password {
            color: red;
            position: absolute;
            top: calc(13% + 10px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .name {
            color: red;
            position: absolute;
            top: calc(24% + 7px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .phone {
            color: red;
            position: absolute;
            top: calc(46% + 1px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .shid {
            color: red;
            position: absolute;
            top: calc(56% + 0px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .room {
            color: red;
            position: absolute;
            top: calc(48% + 2px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }
           .custom-textbox:focus {
       outline: none; /* 取消点击聚焦时的轮廓 */
       box-shadow: none; /* 取消点击聚焦时的阴影效果（对于一些浏览器，比如Firefox） */
   }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
       <div class="row">
         <div class="col-sm-2 " ></div>
            <div class="col-sm-8 " >
            <div class="mianban">
                    <span>住户添加</span>
<div class="row">
    <div class="col-sm-1"></div>
    <div class="col-sm-6">
        <div class="form-group">
            <label for="username">用户名</label>
            <asp:TextBox ID="UserName" type="text" class="form-control custom-textbox"
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
            <label for="password">密码</label>
            <asp:TextBox ID="Password" type="password" class="form-control custom-textbox" placeholder="请输入用户密码" runat="server"></asp:TextBox>
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
            <label for="name">姓名</label>
            <asp:TextBox ID="Name" type="text" class="form-control custom-textbox" runat="server"></asp:TextBox>
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
            <label for="sex">性别</label>
            <select id="Sex" class="form-control custom-textbox" runat="server">
                <option value="1">男</option>
                <option value="0">女</option>
            </select>
        </div>
        <div class="form-group">
            <label for="phone">联系电话</label>
            <asp:TextBox ID="Phone" type="number" class="form-control custom-textbox" runat="server"></asp:TextBox>
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
            <label for="houseid">房产单元</label>
            <asp:TextBox ID="HouseName" type="text" class="form-control custom-textbox" runat="server"></asp:TextBox>
            <%-- 验证房产单元 --%>
            <asp:RequiredFieldValidator ID="rfvHouseName" runat="server"
                ControlToValidate="HouseName"
                ErrorMessage="房产单元不能为空！"
                Display="Dynamic"
                ForeColor="Red"
                Class="room">
            </asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Button ID="SigninButton" runat="server" Text="保存" class="  btn btn-danger  " OnClick="SigninButton_Click" />
        </div>
    </div>
    <div class="col-sm-5">
        <div class="form-group">
            <label class="control-label">头像选择</label>
            <asp:FileUpload ID="UserPhoto" runat="server" class="form-control custom-textbox" />

        </div>
        <div class="form-group">
            <label class="control-label">头像上传</label>
            <asp:Button ID="UserPhotoUpload" class="btn btn-success" runat="server" Text="上传" OnClick="UserPhotoUpload_Click" />
        </div>
        <div class="form-group">
            <label class="control-label ">头像预览</label>
            <asp:Image ID="UserPhotoView" runat="server" Width="66%" />
        </div>
    </div>
    
</div>
            </div>
            </div>
    
    
  </div>
        </div>
</asp:Content>
