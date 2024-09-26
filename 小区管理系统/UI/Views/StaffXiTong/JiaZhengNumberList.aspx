<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Staff.Master" AutoEventWireup="true" CodeBehind="JiaZhengNumberList.aspx.cs" Inherits="UI.Views.StaffXiTong.JiaZhengNumberList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <script src="../../JS/Resident.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
        <h3 style="margin-top: 108px; margin-bottom: 50px;color:#666666">您现在的位置：家政订单 >>>订单记录</h3>
        <div id="genderPieChart" class="tubiao"></div>
    </div>
    <hr />
        <div style="margin-top: 100px;">
        <span>
            <label>时间查询</label>
            <asp:TextBox ID="inputDate1" runat="server" ClientIDMode="Static"></asp:TextBox>
            <span>-</span>
            <asp:TextBox ID="inputDate2" runat="server" ClientIDMode="Static"></asp:TextBox>
        </span>
        <span style="display: inline-block; margin-left: 1%;">
            <label>订单号</label>
            <asp:TextBox ID="OrderNumber" runat="server"></asp:TextBox>
        </span>
        <asp:Button ID="select" runat="server" Text="查询" CssClass="btn btn-success" OnClick="select_Click"  />
    </div>
    <div class="Main-panel-content" style="background-color: moccasin; margin-top:10px">
    <div style="overflow-y: auto; max-height: 450px;">
                    <table class="table  table-hover">
                <asp:Repeater ID="ResidentListTable" runat="server">
                    <HeaderTemplate>
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>订单号</th>
                                <th>工号</th>
                                <th>姓名</th>
                                <th>电话</th>                            
                                <th>照片</th>
                                <th>接单时间</th>
                  
                            </tr>
                        </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%# Eval("Id") %></td>
                                <td><%# Eval("OrderNumber") %></td>
                                <td><%# Eval("JobNumber") %></td>
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("Phone") %></td>
                            
                                <td class="text-center bb">
                                    <asp:Image ID="UserPhotoView" runat="server" ImageUrl='<%# Eval("Photo") %>' CssClass="clickable-photo" />
                                </td>
                                <td><%# Eval("ChuQianTime") %></td>
                     

                        <%--        <td class="text-center" style="width: 15%">
                                    <a href="../DomesticConsumer/Amend.aspx?id=<%# Eval("Id") %>" class="btn btn-warning">修改</a>
                                    <asp:Button ID="ResidentDelete_Click" runat="server" Text="删除" Class="btn btn-danger"  CommandArgument='<%# Eval("Id") %>' />
                                    <asp:Button ID="family" runat="server" Text="家庭成员" class="btn btn-success"  CommandArgument='<%# Eval("Id") %>' />
                                </td>--%>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
        </div>
            <script>
        //初始化
        var ops = {
            language: 'zh-CN', //语言
            autoclose: true, //选择后自动关闭
            clearBtn: true,//清除按钮
            format: "yyyy-mm-dd",//日期格式
            startDate: "2020-06-10", //开始时间，在这时间之前都不可选
        };

        $("#inputDate1").datepicker(ops);
        $("#inputDate2").datepicker(ops);

        //第一个输入选中日期后设置第二给输入框的开始日期
        $("#inputDate1").datepicker().on("changeDate", function (e) {
            $("#inputDate2").datepicker('setStartDate', e.date);
        });
        $("#inputDate2").datepicker().on("changeDate", function (e) {
            $("#inputDate1").datepicker('setEndDate', e.date);
        });

            </script>
</asp:Content>
