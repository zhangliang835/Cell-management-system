<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="PassMaintenance.aspx.cs" Inherits="UI.Views.MaintenanceRecordUI.PassMaintenance1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Master.CSS/ResidentList.css" />
    <style type="text/css">
        .form-group {
            margin-bottom: 20px;
            font-size: 15px;
        }
        .button{
            display:flex;
            justify-content:center;
        }
        table{
            margin-bottom:20px!important;
        }
         .button .btn{
            width:200px!important;
          box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-1" style="padding: 0;"></div>
            <div class="col-md-8">
                <div class=" row">
                    <div class="col-md-1"></div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="username" class="form-label inline-block">报修人:</label>
                            <asp:Label ID="UserName" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label for="roomnumber" class="form-label inline-block">房产单元:</label>
                            <asp:Label ID="RoomNumber" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label for="issuedescription" class="form-label inline-block">问题描述:</label>
                            <asp:Label ID="IssueDescription" runat="server"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label for="applytime" class="form-label inline-block">申请时间:</label>
                            <asp:Label ID="ApplyTime" runat="server"></asp:Label>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="photobefore" class="form-label inline-block">损坏照片:</label>
                            <asp:Image ID="PhotoBeforeView" runat="server" Width="200" />
                        </div>
                        <div class="form-group">
                            <label for="RepairerID" class="form-label inline-block">指定维修人员:</label>
                            <asp:TextBox ID="RepairerID" runat="server"></asp:TextBox>
                        </div>
                 
                    </div>
                      <div class="col-md-1"></div>
                </div>
                         <div style="overflow-y: auto; max-height: 200px;">
       <table class="table table-hover">
           <asp:Repeater ID="RepairerListTable" runat="server">
               <HeaderTemplate>
                   <thead>
                       <tr>
                           <th>编号</th>
                           <th>姓名</th>
                           <th>性别</th>
                           <th>年龄</th>
                           <th>照片</th>
                           <th>电话</th>
                           <th>操作</th>
                       </tr>
                   </thead>
               </HeaderTemplate>
               <ItemTemplate>
                   <tbody>
                       <tr>
                           <td><%# Eval("Id")%></td>
                           <td><%# Eval("Name")%></td>
                           <td><%# (int)Eval("Sex")==1?"男":"女"%></td>
                           <td><%# Eval("Age")%></td>
                           <td class="bb">
                               <asp:Image ID="UserPhotoView" runat="server" ImageUrl='<%# Eval("Photo")%>' />
                           </td>
                           <td>
                               <a><%# Eval("Phone")%></a>


                           <td style="width: 12%">

                               <asp:Button ID="SelectRepairerButton" runat="server" Text="选择"
                                   class="btn btn-danger" OnClick="SelectRepairerButton_Click" CommandArgument='<%# Eval("Id")%>' />

                           </td>
                       </tr>
                   </tbody>
               </ItemTemplate>
           </asp:Repeater>
       </table>
             </div>
              <div class="button">
                    <asp:Button ID="Affirm" class="btn btn-primary" runat="server" Text="确认" OnClick="Affirm_Click" />
              </div>
            </div>
            <div class="col-md-1" style="padding: 0;"></div>
        </div>
    </div>
</asp:Content>
