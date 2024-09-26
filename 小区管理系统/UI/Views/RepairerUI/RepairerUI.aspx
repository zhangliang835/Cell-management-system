<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepairerUI.aspx.cs" Inherits="UI.Views.RepairerUI.RepairerUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css" />
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/ResidentList.css" />
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/Repairer.css" />
    <script src="../../JS/Resident.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">

                <div class="col-md-12">
                    <!-- 添加图片模态框 -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <img id="modalImage" src="#" alt="用户或车辆图片" class="img-fluid" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="daohang"></div>
                    <table class="table table-bordered">
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
                                        <th>进度</th>
                                        <th>费用</th>
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
                                            <asp:Image ID="PhotoBeforeView" runat="server" ImageUrl='<%# Eval("PhotoBefore")%>' CssClass="clickable-photo" /></td>
                                        <td><%# Eval("ApplyTime")%></td>
                                        <td><%# Eval("RepairStartTime")%></td>
                                        <td><%# Eval("RepairEndTime")%></td>
                                        <td>
                                            <asp:Image ID="PhotoAfterView" runat="server" ImageUrl='<%# Eval("PhotoAfter")%>'/>
                                        </td>
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
                                            <asp:Button ID="PassButton" runat="server" Text="处理" class="btn btn-danger" Visible='<%# Eval("Status").ToString() == "3" %>' OnClick="PassButton_Click" CommandArgument='<%# Eval("Id")%>' />

                                            <asp:Button ID="ExamineButton" runat="server" Text="查看" CssClass="btn btn-primary"
                                                Visible='<%# Eval("Status").ToString() == "2" || Eval("Status").ToString() == "1" %>' />
                                        </td>

                                    </tr>
                                </tbody>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
