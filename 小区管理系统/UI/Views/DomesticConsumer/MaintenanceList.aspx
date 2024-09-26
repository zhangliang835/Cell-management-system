<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="MaintenanceList.aspx.cs" Inherits="UI.Views.DomesticConsumer.MaintenanceRecord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
     <script src="../../JS/Resident.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 style="margin-top:108px;margin-bottom:50px">您现在的位置：报修管理 >>> 报修记录</h3>
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
                <table class="table table-hover">
                    <asp:Repeater ID="MaintenanceListTable" runat="server">
                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>报修人</th>
                                    <th>房产单元</th>
                                    <th>报修问题描述</th>
                                    <th>损坏照片</th>
                                    <th>申请时间</th>
                                    <th>维修开始时间</th>
                                    <th>维修结束时间</th>
                                    <th>维修照片</th>
                                    <th>维修人员ID</th>
                                    <th>维修状态</th>
                                    <th>费用</th>
                                    <th>狀態</th>
                                </tr>
                            </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td><%# Eval("Id")%></td>
                                    <td><%# Eval("ResidentName")%></td>
                                    <td><%# Eval("RoomNumber")%></td>
                                    <td><%# Eval("IssueDescription")%></td>
                                    <td>
                                        <asp:Image ID="PhotoBeforeView" runat="server" ImageUrl='<%# Eval("PhotoBefore")%>' CssClass="clickable-photo"/></td>
                                    <td><%# Eval("ApplyTime")%></td>
                                    <td><%# Eval("RepairStartTime")%></td>
                                    <td><%# Eval("RepairEndTime")%></td>
                                    <td>
                                        <asp:Image ID="PhotoAfterView" runat="server" ImageUrl='<%# Eval("PhotoAfter")%>' CssClass="clickable-photo"/></td>
                                    <td><%# Eval("RepairerID")%></td>
                                    <td style='<%# Eval("Status").ToString() == "1" ? "color:black;": Eval("Status").ToString() == "2" ? "color:red;" :
                    Eval("Status").ToString() == "0" ? "color:red;" :  Eval("Status").ToString() == "3" ? "color:blue;":""%>'>
                                        <%# Eval("Status").ToString() == "1" ? "已完成" :
                          Eval("Status").ToString() == "2" ? "待确认" :
                          Eval("Status").ToString() == "3" ? "处理中" : 
                          Eval("Status").ToString() == "0" ? "待处理":""%>
                                    </td>
                                    <td><%# Eval("expenses")%></td>
                                    <td>
                                        <asp:Button ID="AffirmButton" runat="server" Text="确认" Class="btn btn-primary" Visible='<%# Eval("Status").ToString() != "1" %>' OnClick="AffirmButton_Click"  CommandArgument='<%# Eval("Id")%>'/>
                                    <asp:Button ID="ExamineButton" runat="server" Text="详情" class="btn btn-primary" Visible='<%# Eval("Status").ToString() == "1" %>' />
                                        </td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>

</asp:Content>
