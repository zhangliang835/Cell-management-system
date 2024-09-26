<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="ComplaintList.aspx.cs" Inherits="UI.Views.Complaint.ComplaintList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <script src="../../JS/Resident.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：投诉建议</h3>
    <hr />
    <!-- 添加图片模态框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width: 30%">
            <div class="modal-content">
                <div class="modal-header">
                </div>
                <div class="modal-body">
                    <img id="modalImage" src="#" alt="用户或车辆图片" class="img-fluid">
                </div>
            </div>
        </div>
    </div>
    <div class="Main-panel-content" style="background-color: moccasin">
        <div style="overflow-y: auto; max-height: 450px;">
            <table class="table table-hover">
                <asp:Repeater ID="ComplaintListView" runat="server">
                    <HeaderTemplate>
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>姓名</th>
                            
                                <th>房产单元</th>
                                <th>标题</th>
                                    <th>联系电话</th>
                                <th>内容</th>
                                <th>图片</th>
                                <th>时间</th>
                                <th>处理进度</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%# Eval("Id")%></td>

                                <td><%# Eval("ResidentName")%></td>
                                <td>
                                    <%# Eval("RoomNumber")%>
                                </td>
                                <td>
                                    <%# Eval("Title")%>
                                </td>
                                <td>
                                    <%# Eval("Phone")%>
                                </td>
                                <td>
                                    <%# Eval("Content").ToString().Length > 10 ? Eval("Content").ToString().Substring(0, 10) + "..." : Eval("Content") %>
                                </td>
                                <td class="bb">
                                    <asp:Image ID="PhotoView" runat="server" ImageUrl='<%# Eval("Photo") %>' CssClass="clickable-photo" />
                                </td>
                                <td>
                                    <%# Eval("Time")%>
                                </td>
                                <td style='<%# 
    Eval("State").ToString() == "1" ? "color:black;":
    Eval("State").ToString() == "0" ? "color:red;" : ""

%>'>
                                    <%# 
                                        Eval("State").ToString() == "0"?"未处理":
                                        Eval("State").ToString() == "1"?"已处理":""
                                   
                                    %>
                                </td>
                                <td style="width: 12%">

                                    <asp:Button ID="Look" runat="server" Text="查看" class="btn btn-warning" CommandArgument='<%# Eval("Id") %>' OnClick="Look_Click" />
                                </td>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
</asp:Content>
