<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Staff.Master" AutoEventWireup="true" CodeBehind="JiaZhengNumber.aspx.cs" Inherits="UI.Views.StaffXiTong.JiaZhengNumber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/Signin.css" />
<%--    <style>
        .ziti label {
            font-size: 18px;
            font-family: '宋体';
            font-weight:800;
        }

        .ziti {
            margin-left: 100px;
            margin-bottom: 20px;
        }

        .text {
            font-size: 18px;
            font-family: '宋体' !important;
               font-weight:800;
        }

        .custom-textbox:focus {
            outline: none; /* 取消点击聚焦时的轮廓 */
            box-shadow: none; /* 取消点击聚焦时的阴影效果（对于一些浏览器，比如Firefox） */
        }

        .form-control {
            width: 400px;
        }

        .custom-textbox {
            border-style: solid;
            border-width: 1px;
            border-color: black;
        }

        .btn {
            margin-left: 100px;
            width: 200px;
            margin-top: 60px;
            font-size: 18px !important;
            font-family: '宋体';
        }
    </style>--%>
     <style>

        /* add new color schema for the whole page */
        body {
            background-color: #f8f9fa;
        }

        /* update styles for the text */
        .text {
            font-size: 18px;
            color: #495057;
            font-weight:800;
        }

        /* custom styles for labels */
        .ziti label {
            font-size: 18px;
            font-family: '宋体';
            font-weight:800;
            color: #495057;
        }
        .ziti{
            margin-bottom:20px;
        }
        /* custom styles for form-control and textbox */
        .form-control, .custom-textbox {
            border-radius: 5px;
            border: 1px solid #ced4da;
            font-family: '宋体' !important;
            padding: 10px;
            font-size: 18px;
            font-weight:800;
        }

        /* custom styles for buttons */
        .cc {
            background-color: #007bff;
            border-color: #007bff;
            color: #ffffff;
            padding: 10px 25px;
            box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
            font-size: 18px !important;
            font-family: '宋体';
        }
        .cc:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：家政订单 >>> 当前订单</h3>
    <hr />
                     <!-- 模态框（Modal） 无订单提示-->
     <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
         <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
             <div class="modal-content b" style="width: 40% !important; max-width: 800px !important;">
                 <div class="modal-header">
                     <h4 class="modal-title" id="myModalLabel6">通知
                     </h4>
                 </div>
                 <div class="modal-body">
                     <label style="font-size: 16px">当前无订单！</label>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                         确认
                     </button>
                 </div>
             </div>

         </div>
     </div>           
    <!-- 模态框（Modal） 订单完成提示-->
     <div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabe7" aria-hidden="true">
         <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
             <div class="modal-content b" style="width: 40% !important; max-width: 800px !important;">
                 <div class="modal-header">
                     <h4 class="modal-title" id="myModalLabel7">通知
                     </h4>
                 </div>
                 <div class="modal-body">
                     <label style="font-size: 16px">订单已完成！</label>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                         确认
                     </button>
                 </div>
             </div>

         </div>
     </div> 
    <!-- 模态框（Modal） 定价提示-->
     <div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabe8" aria-hidden="true">
         <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
             <div class="modal-content b" style="width: 40% !important; max-width: 800px !important;">
                 <div class="modal-header">
                     <h4 class="modal-title" id="myModalLabel8">通知
                     </h4>
                 </div>
                 <div class="modal-body">
                     <label style="font-size: 16px">请先定价！</label>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                         确认
                     </button>
                 </div>
             </div>

         </div>
     </div>  
                  <!-- 模态框（Modal）用户删除警告 -->
  <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
   <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
     <div class="modal-content b" style="width: 40% !important; max-width: 800px !important;">
              <div class="modal-header">

                  <h4 class="modal-title" id="myModalLabel4" style="color: red">提示
                  </h4>
              </div>
              <div class="modal-body">

                  <label style="font-size: 16px">定价格式不正确，请输入有效的数字!</label>
              </div>
              <div class="modal-footer">
                
                  <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                     确认
                  </button>
              </div>
          </div>
      </div>
  </div>
    <div class="ziti">
        <label>订单号：</label>
        <asp:Label ID="dingdannumber" runat="server" Text="无" CssClass="text"></asp:Label>
    </div>
    <div class="ziti">
        <label>服务类别：</label>
        <asp:Label ID="leibie" runat="server" Text="无" CssClass="text"></asp:Label>
    </div>
    <div class="ziti">
        <label>价格：</label>
        <asp:Label ID="price" runat="server" Text="无" CssClass="text"></asp:Label>
    </div>
    <div class="ziti">
        <label>定金：</label>
        <asp:Label ID="dingjin" runat="server" Text="无" CssClass="text"></asp:Label>
    </div>
    <div class="ziti">
        <label>上面时间：</label>
        <asp:Label ID="shangmentime" runat="server" Text="无" CssClass="text"></asp:Label>
    </div>
    <div class="ziti">
        <label>业主姓名：</label>
        <asp:Label ID="residentname" runat="server" Text="无" CssClass="text"></asp:Label>
    </div>
    <div class="ziti">
        <label>地址：</label>
        <asp:Label ID="area" runat="server" Text="无" CssClass="text"></asp:Label>
    </div>
    <div class="ziti">
        <label>联系电话：</label>
        <asp:Label ID="phone" runat="server" Text="无" CssClass="text"></asp:Label>
    </div>
    <div class="ziti">
        <label>备注：</label>
        <asp:Label ID="beizhu" runat="server" Text="无" CssClass="text"></asp:Label>
    </div>
    <div class=" ziti form-group">
        <label>定价：</label>
        <asp:TextBox ID="dingjia" runat="server" class="form-control custom-textbox"></asp:TextBox>
    </div>
    <asp:Button ID="Button1" runat="server" Text="服务完成" CssClass="btn btn-primary cc" OnClick="Button1_Click" />
</asp:Content>
