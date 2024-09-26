<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="ServiceChargeing.aspx.cs" Inherits="UI.Views.ServiceChargeUI.ServiceChargeing" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/TimeXuanZe.css"/>
    <style>
        .zhuangtai {
            width: 10%;
        }

        h3 {
            font-family: '宋体';
        }
                .b {
    width: 42% !important;
    max-width: 800px !important;
}

        .a {
            display: flex; /* 对于Bootstrap 4+，确保对话框容器启用Flex布局 */
            align-items: center; /* 垂直居中 */
            justify-content: center; /* 水平居中 */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：收费管理 >>> 费用缴纳</h3>
    <hr style="margin-bottom:50px"/>
               <span style="display:inline;margin-right:165px; ">
       <label>费用类型</label>
       <asp:DropDownList ID="DropDownList2" runat="server" CssClass="zhuangtai" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
           <asp:ListItem Text="全部" Value="全部"></asp:ListItem>
           <asp:ListItem Text="物业费" Value="物业费"></asp:ListItem>
           <asp:ListItem Text="水费" Value="水费"></asp:ListItem>
           <asp:ListItem Text="电费" Value="电费"></asp:ListItem>
       </asp:DropDownList>


   </span>
    <span>

        <label>费用类型</label>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="zhuangtai" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Text="全部" Value="全部"></asp:ListItem>
            <asp:ListItem Text="未缴费" Value="未缴费"></asp:ListItem>
            <asp:ListItem Text="待确认" Value="待确认"></asp:ListItem>
        </asp:DropDownList>

    </span>
<div  style="margin-top:28px;">
            <span >
        <label>时间查询</label>
        <asp:TextBox ID="inputDate1" runat="server"  ClientIdMode="Static"></asp:TextBox>
                    <span>-</span>
        <asp:TextBox ID="inputDate2" runat="server"  ClientIdMode="Static"></asp:TextBox>
    
    </span>
    <span style="display: inline-block; margin-left: 1%;">
       <label>房产单元</label>
        <asp:TextBox ID="name" runat="server"></asp:TextBox>
    </span>
    <asp:Button ID="select" runat="server" Text="查询" CssClass="btn btn-success" OnClick="select_Click" />
    <span style="display: block; float: right; margin-right: 5%;">

<%--        <asp:Button ID="yijiaocuijiao" runat="server" Text="一键确认" CssClass="btn btn-success"  />--%>


    </span>
</div>
        <!-- 模态框（Modal） 等待确认成功提示-->
     <div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabe7" aria-hidden="true">
         <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
             <div class="modal-content b" style="width: 42% !important; max-width: 800px !important;">
                 <div class="modal-header">
                     <h4 class="modal-title" id="myModalLabel7">通知
                     </h4>
                 </div>
                 <div class="modal-body">
                     <label style="font-size: 16px">已更改该业主的缴费状态为已缴费！</label>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                         确认
                     </button>
                 </div>
             </div>

         </div>
     </div> 
        <!-- 模态框（Modal） 线下缴费成功提示-->
     <div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabe8" aria-hidden="true">
         <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
             <div class="modal-content b" style="width: 42% !important; max-width: 800px !important;">
                 <div class="modal-header">
                     <h4 class="modal-title" id="myModalLabel8">通知
                     </h4>
                 </div>
                 <div class="modal-body">
                     <label style="font-size: 16px">已成功进行线下缴费！</label>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                         确认
                     </button>
                 </div>
             </div>

         </div>
     </div> 
    <div class="Main-panel-content" style="overflow-y: auto; max-height: 400px;">
        <table class="table table-hover">
            <asp:Repeater ID="ServiceChargeListTable" runat="server">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>编号</th>
                        
                            <th>业主姓名</th>
                                  <th>房产单元</th>
                         <th>费用类型</th>
                      
                            <th>支付金额</th>
                            <th>应收时间</th>
                            <th>缴费状态</th>
                            <th>缴费时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tbody>
                        <tr>
                            <td><%# Eval("Id")%></td>
                          
                            <td><%# Eval("ResidentName")%></td>
                 
                            <td><%# Eval("RoomNumber")%></td>
                                                                                    <td>
                                <%# 
Eval("SypeId").ToString() == "1" ? "物业费" : 
Eval("SypeId").ToString() == "2" ? "水费" : 
Eval("SypeId").ToString() == "3" ? "电费" : 
Eval("SypeId").ToString() == "4" ? "未知" : ""
                                %>
                            </td>
                            <td><%# Eval("PaymentAmount")%></td>
                            <td><%# Eval("StateTime")%></td>

                            <td style='<%# 
    Eval("PaidStatus").ToString() == "1" ? "color:black;": Eval("PaidStatus").ToString() == "2" ? "color:red;" : 
    Eval("PaidStatus").ToString() == "0" ? "color:red;" : 
    Eval("PaidStatus").ToString() == "3" ? "color:blue;" : ""
%>'>
                                <%# 
        Eval("PaidStatus").ToString() == "1" ? "已缴费" : 
        Eval("PaidStatus").ToString() == "0" ? "未交费" : 

        Eval("PaidStatus").ToString() == "3" ? "待物业确认" : ""
                                %>
                            </td>
                            <td><%# Eval("PaymentTime")%></td>
                            <td>
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text="线下缴费" CommandArgument='<%# Eval("Id") %>' OnClick="Button1_Click"
                                    Visible='<%# (Convert.ToInt32(Eval("PaidStatus")) == 2 || Convert.ToInt32(Eval("PaidStatus")) == 0) %>' />
                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" Text="等待确认" OnClick="Button2_Click" CommandArgument='<%# Eval("Id") %>'
                                    Visible='<%# (Convert.ToInt32(Eval("PaidStatus")) == 3 ) %>' />
                                <asp:Button ID="Button3" runat="server" CssClass="btn btn-secondary" Text="已经确认" 
                                    Visible='<%# (Convert.ToInt32(Eval("PaidStatus")) == 1 ) %>' />
                            </td>
                        </tr>
                    </tbody>
                </ItemTemplate>
            </asp:Repeater>
        </table>
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
