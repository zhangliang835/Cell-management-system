<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="VisitRecordUIAdd.aspx.cs" Inherits="UI.Views.VisitRecordUI.VisitRecordUIAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/Signin.css" />
    <style type="text/css">
        label {
            display: inline-block;
            max-width: 100%;
            margin-bottom: 5px;
            font-weight: 700;
            font-size: 14px;
        }
        body{
            background-image:none;
        }

        .name {
            color: red;
            position: absolute;
            top: calc(-40% + 7px);
            left: 91%;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .residentname {
            color: red;
            position: absolute;
            top: calc(-43% + 7px);
            left: 91%;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .phone {
            color: red;
            position: absolute;
            top: calc(-24% + 0px);
            left: 91%;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .room {
            color: red;
            position: absolute;
            top: calc(-33% + 2px);
            left: 91%;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .Ps {
            color: red;
            position: absolute;
            top: calc(-33% + 2px);
            left: 91%;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .button {
            display: flex;
            align-items: center;
            justify-content: center;
        }

            .button .form-group {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
            }

            .button .btn {
                width: 50%;
            }

        .custom-textbox {
            border-style: solid;
            border-width: 1px; /* 根据需要调整边框宽度 */
            border-color: #ccc; /* 示例边框颜色，您可以根据需要调整 */
        }

            .custom-textbox:focus {
                outline: none; /* 取消点击聚焦时的轮廓 */
                box-shadow: none; /* 取消点击聚焦时的阴影效果（对于一些浏览器，比如Firefox） */
            }
              .container{
      height:auto!important;
  }
        .form-group {
            position: relative;
        }
        .fangke{
            margin-top:108px!important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
          <div class="fangke">
              <div class="container">
    <div class="row">
                <div class="col-md-2"></div>
  <div class="col-md-4 ">
      <span>访客登记</span>
      </div>
      <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-5">


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
                  <label for="name">业主姓名</label>
                  <asp:TextBox ID="ResidentName" type="text" class="form-control custom-textbox" runat="server"></asp:TextBox>
                  <!-- 姓名验证 -->
                  <asp:RequiredFieldValidator ID="rfvReisentName" runat="server"
                      ControlToValidate="ResidentName"
                      ErrorMessage="业主姓名不能为空！"
                      Display="Dynamic"
                      ForeColor="Red"
                      Class="residentname">
                  </asp:RequiredFieldValidator>
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
                  <label for="houseid">访问目的</label>
                  <asp:TextBox ID="Purpose" type="text" class="form-control custom-textbox" runat="server"></asp:TextBox>
                  <%-- 验证房产单元 --%>
                  <asp:RequiredFieldValidator ID="rfvPurpose" runat="server"
                      ControlToValidate="HouseName"
                      ErrorMessage="访问目的不能为空！"
                      Display="Dynamic"
                      ForeColor="Red"
                      Class="Ps">
                  </asp:RequiredFieldValidator>
              </div>

              <div class="button">
                  <div class="form-group">
                      <asp:Button ID="SigninButton" runat="server" Text="保存" OnClick="SigninButton_Click" class="  btn btn-danger custom-size-button" />
                  </div>
              </div>
          </div>
      </div>
  
            </div>
</div>
          </div>

     
</asp:Content>
