<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="staffList.aspx.cs" Inherits="UI.Views.MaintenanceRecordUI.MaintenanceRecordUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <script src="../../JS/Resident.js"></script>
    <style>
           .zhuangtai {
       width: 10%;
   }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h3 style="margin-top:108px;margin-bottom:50px">您现在的位置：员工管理 </h3>
<hr />
                <!-- 添加模态框 -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document" style="width:30%">
                        <div class="modal-content">
                            <div class="modal-header">
                               
                            </div>
                            <div class="modal-body">
                                <img id="modalImage" src="#" alt="用户或车辆图片" class="img-fluid">
                            </div>
                        </div>
                    </div>
                </div>
        <div class="select ">
        <a href="StaffSignin.aspx" class="btn btn-danger">业主新增</a>
    </div>
        <div style="margin-top:20px;">
        <span>
            <label>状态</label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="zhuangtai" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Text="工作部门" Value="工作部门"></asp:ListItem>
                <asp:ListItem Text="安保部" Value="安保部"></asp:ListItem>
                <asp:ListItem Text="保洁部" Value="保洁部"></asp:ListItem>
                <asp:ListItem Text="绿化部" Value="绿化部"></asp:ListItem>
                <asp:ListItem Text="维修部" Value="维修部"></asp:ListItem>
            </asp:DropDownList>
        </span> 
              <span style="display: inline-block; margin-left: 1%;">
      <label>姓名</label>
      <asp:TextBox ID="name" runat="server"></asp:TextBox>
  </span>
  <asp:Button ID="select" runat="server" Text="查询" CssClass="btn btn-success" OnClick="select_Click" />
    </div>

    <div class="Main-panel-content" style="background-color: moccasin">
           <div style="overflow-y: auto; max-height: 450px;">
                <table class="table table-hover">
                    <asp:Repeater ID="MaintenanceListTable" runat="server">
                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>年龄</th>
                                    <th>照片</th>
                                    <th>电话</th>
                                    <th>部门</th>
                                    <th>操作</th>
                                   
                                </tr>
                            </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td><%# Eval("Id")%></td>
                                    <td><%# Eval("Name")%></td>
                                     <td><%# (int)Eval("Sex") == 1 ? "男" : "女" %></td>
                                    <td><%# Eval("Age")%></td>
                                    <td>
                                        <asp:Image ID="PhotoBeforeView" runat="server" ImageUrl='<%# Eval("Photo")%>' CssClass="clickable-photo" />

                                    </td>
                                    <td><%# Eval("Phone")%></td>
                                    <td>
                                        <%#
                                            Eval("Department").ToString()=="1"?"安保部":
                                            Eval("Department").ToString()=="2"?"保洁部":
                                            Eval("Department").ToString()=="3"?"绿化部":
                                            Eval("Department").ToString()=="4"?"维修部":""
                                        %>
                                    </td>
                            
                                 
                                    

                           <%--         <td style='<%# Eval("Status").ToString() == "1" ? "color:black;": Eval("Status").ToString() == "2" ? "color:red;" :
                    Eval("Status").ToString() == "0" ? "color:red;" :  Eval("Status").ToString() == "3" ? "color:blue;":""%>'>
                                        <%# Eval("Status").ToString() == "1" ? "已完成" :
                          Eval("Status").ToString() == "2" ? "待确认" :
                          Eval("Status").ToString() == "3" ? "处理中" : 
                          Eval("Status").ToString() == "0" ? "待处理":""%>
                                    </td>--%>
                               <td>
                                       
                                   <a href="StaffSignin.aspx?id=<%# Eval("Id") %>"" class="btn btn-danger" >修改</a>
                                        <asp:Button ID="DeleteButton" runat="server" Text="删除" class="btn btn-primary" CommandArgument='<%# Eval("Id") %>' OnClick="DeleteButton_Click" />
                                    </td>
                             
                                </tr>
                            </tbody>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
           </div>
           </div>
</asp:Content>
