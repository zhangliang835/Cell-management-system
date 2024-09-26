<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="NewsUI.aspx.cs" Inherits="UI.Views.News.NewsUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .container {
            height: auto;
            padding: 0px !important;
        }

        .card-body {
            background-color: white; /* 选择一种比内容区域稍浅或稍深的颜色 */
        }

        .ww {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 7px;
        }

        .btn {
            width: 150px;
        }

 
     label{
         font-size:18px;
          font-family:'宋体';
 font-weight:800;
     }
     .ziti{
                  font-size:17px;
                  font-family:'宋体';
                  font-weight:800;
                 
     }
     .ziti2{
          color:red;
     }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
     <div class="row">
         <div class="col-md-2" >

         </div>
         <div class="col-md-8">
             <div class="card bg-success">

                 <div class="card-header">
                     <label>详情</label>
                 </div>
                 <div class="card-body">
                     <div class="form-group">
                         <label>请假类别:</label>
                         <asp:label id="name" runat="server" text="label" CssClass="ziti"></asp:label>
                     </div>
                     <hr />
                     <div class="form-group">
                         <label>请假时间:</label>
                         <asp:Label ID="date" runat="server" Text="Label" CssClass="ziti ziti2"></asp:Label>
                         <label>至</label>
                          <asp:Label ID="timeEnd" runat="server" Text="Label" CssClass="ziti ziti2"></asp:Label>
                     </div>
                     <hr />
                     <div class="form-group ww">
                         <label>通知内容:</label>
                         <textarea id="TextArea1" runat="server" cols="98" rows="7" style="font-size: 18px;" ></textarea>
                     </div>
                     <hr />
                     <div class="form-group ">
                         <label>申请人：</label>
                         <asp:Label ID="pople" runat="server" Text="Label" CssClass="ziti"></asp:Label>
                     </div>  <div class="form-group ">
                         <label>工号：</label>
                         <asp:Label ID="gonghao" runat="server" Text="Label" CssClass="ziti"></asp:Label>
                     </div> 
                     <div class="form-group ww">
                         <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="确认" OnClick="Button1_Click"  />
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
</asp:Content>
