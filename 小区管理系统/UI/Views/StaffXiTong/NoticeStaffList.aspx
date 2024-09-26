<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Staff.Master" AutoEventWireup="true" CodeBehind="NoticeStaffList.aspx.cs" Inherits="UI.Views.StaffXiTong.NoticeStaffList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <script src="../../JS/Resident.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
               <h3 style="margin-top:108px;margin-bottom:50px">您现在的位置：公告通知</h3>
<hr />
                <!-- 添加图片模态框 -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document"  style="max-width: 30%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <img id="modalImage" src="#" alt="用户或车辆图片" class="img-fluid">
                            </div>
                        </div>
                    </div>
                </div>
     <div class="Main-panel-content" style="background-color: moccasin">
                <table class="table table-hover">
                    <asp:Repeater ID="NoticeViewList" runat="server">
                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>标题</th>
                                    <th>内容</th>
                                    <th>图片</th>
                                    <th>发布时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td><%# Eval("Id")%></td>
                                    <td>
                                        <%# Eval("Title").ToString().Length > 5 ? Eval("Title").ToString().Substring(0, 5) + "..." : Eval("Title") %>
                                    </td>
                                    <td>
                                        <%# Eval("Content").ToString().Length > 5 ? Eval("Content").ToString().Substring(0, 5) + "..." : Eval("Content") %>
                                    </td>
                                    <td>
                                        <asp:Image ID="PhtotView" runat="server" ImageUrl='<%# Eval("Photo")%>' CssClass="clickable-photo" />
                                    </td>
                                    <td><%# Eval("PublishTime")%></td>
                                    <td style="width: 10%">

                                       
                                        <a href="NoticeStaffUI.aspx?id=<%# Eval("Id")%>" class="btn btn-warning">查看</a>


                                    </td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                    </asp:Repeater>

                </table>
          </div>
</asp:Content>
