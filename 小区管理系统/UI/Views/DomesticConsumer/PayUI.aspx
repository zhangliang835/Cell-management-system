<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="PayUI.aspx.cs" Inherits="UI.Views.DomesticConsumer.PayUI" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css" />
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        label {
            display: block;
            margin-bottom: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-10" style="padding: 0">
                <span>
                    <asp:Button ID="Accomplish" runat="server" class="btn btn-primary" Text="已缴费" OnClick="Accomplish_Click" />
                    <asp:Button ID="Undone" runat="server" class="btn btn-primary" Text="未缴费" OnClick="Undone_Click" />
                    <asp:Button ID="Overdue" runat="server" class="btn btn-primary" Text="逾期" OnClick="Overdue_Click" />
                    <asp:Button ID="Refresh" class="btn btn-primary" runat="server" Text="刷新" />
                </span>
                <!-- 模态框（Modal） -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">缴费表单
                                </h4>
                            </div>
                            <div class="modal-body">
                                <label>您的住房面积为：200平方米</label>
                                <hr />
                                <label>一级物业收费标准：1.00元/月/平方米（已包含税、费）。</label>
                                <hr />
                                <label>合计：200元</label>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="PayButton2" class="btn btn-primary" runat="server" Text="确认缴费" OnClick="PayButton2_Click" />
                                <button type="button" class="btn btn-danger" data-dismiss="modal">
                                    取消
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-bordered">
                    <asp:Repeater ID="ServiceChargeListTable" runat="server">
                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>业主姓名</th>
                                    <th>房产单元</th>
                                    <th>支付金额</th>
                                    <th>缴费状态</th>
                                    <th>缴费时间</th>
                                    <th>缴费</th>
                                </tr>
                            </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td><%# Eval("Id")%></td>
                                    <td><%# Eval("ResidentName")%></td>
                                    <td><%# Eval("RoomNumber")%></td>
                                    <td><%# Eval("PaymentAmount")%></td>
                                    <td style='<%# Eval("PaidStatus").ToString() == "1" ? "color:black;": Eval("PaidStatus").ToString() == "2" ? "color:red;" :
           Eval("PaidStatus").ToString() == "0" ? "color:red;" : ""%>'>
                                        <%# Eval("PaidStatus").ToString() == "1" ? "已缴费" :
                  Eval("PaidStatus").ToString() == "0" ? "未交费" :
                  Eval("PaidStatus").ToString() == "2" ? "逾期" : "未知状态" %>
                                    </td>
                                    <td><%# Eval("PaymentTime")%></td>
                                    <td>
                                        <asp:Button ID="PayButton" runat="server" Text="缴费" Class="btn btn-danger"
                                            Visible='<%# Convert.ToInt32(Eval("PaidStatus")) == 0 || Convert.ToInt32(Eval("PaidStatus"))== 2 %>'
                                            OnClick="PayButton_Click" CommandArgument='<%# Eval("Id")%>' />
                                        <asp:Button ID="DetailsButton" runat="server" Text="详情" Class="btn btn-primary"
                                            Visible='<%# Convert.ToInt32(Eval("PaidStatus")) == 1 %>' />
                                    </td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
