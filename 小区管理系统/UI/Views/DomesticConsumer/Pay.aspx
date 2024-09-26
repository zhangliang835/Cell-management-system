<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="Pay.aspx.cs" Inherits="UI.Views.Notice.NoticeUI" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />

    <style type="text/css">
        .modal-content {
            width: 42% !important;
            max-width: 800px !important;
        }

        .zhuangtai {
            width: 10%;
        }

        h3 {
            font-family: '宋体';
        }

        .modal-dialog {
            display: flex; /* 对于Bootstrap 4+，确保对话框容器启用Flex布局 */
            align-items: center; /* 垂直居中 */
            justify-content: center; /* 水平居中 */
        }

        .renwul {
            margin-bottom: 81px;
            font-size: 14px;
        }
       .renwul span{
            display:inline;
            margin-right:100px;
        }                .b {
            width: 42% !important;
            max-width: 800px !important;
        }

        .a {
            display: flex; /* 对于Bootstrap 4+，确保对话框容器启用Flex布局 */
            align-items: center; /* 垂直居中 */
            justify-content: center; /* 水平居中 */
            margin-top: 55px;
        }
        .gg{
            background-color:dimgrey;
            color:white;
        }
        .asd{
            width:155px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：物业管理</h3>
    <hr />
  


    <div style="margin-top:50px;">
              <span style="display:inline;margin-right:10px;">
          <label>费用类型</label>
          <asp:DropDownList ID="DropDownList2" runat="server" CssClass="zhuangtai" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
              <asp:ListItem Text="全部" Value="全部"></asp:ListItem>
              <asp:ListItem Text="物业费" Value="物业费"></asp:ListItem>
              <asp:ListItem Text="水费" Value="水费"></asp:ListItem>
              <asp:ListItem Text="电费" Value="电费"></asp:ListItem>
          </asp:DropDownList>


      </span>
        <span>
            <label>状态</label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="zhuangtai" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Text="全部" Value="全部"></asp:ListItem>
                <asp:ListItem Text="已缴费" Value="已缴费"></asp:ListItem>
                <asp:ListItem Text="未缴费" Value="未缴费"></asp:ListItem>
                <asp:ListItem Text="待确认" Value="待确认"></asp:ListItem>
            </asp:DropDownList>


        </span>
      
    </div>
    <div style="margin-top:28px;">
          <span >
      <label>时间查询</label>
      <asp:TextBox ID="inputDate1" runat="server" ClientIDMode="Static" CssClass="asd"></asp:TextBox>
      <span>-</span>
      <asp:TextBox ID="inputDate2" runat="server" ClientIDMode="Static" CssClass="asd"></asp:TextBox>

  </span>

  <asp:Button ID="select" runat="server" Text="查询" CssClass="btn btn-success" OnClick="select_Click" />


    </div>


                     <!-- 模态框（Modal） 缴费成功提示-->
     <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
         <div class="modal-dialog a" >
             <div class="modal-content b" >
                 <div class="modal-header">
                     <h4 class="modal-title" id="myModalLabel6">通知
                     </h4>
                 </div>
                 <div class="modal-body">
                     <label style="font-size: 16px">缴费成功，待物业确认！</label>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                         确认
                     </button>
                 </div>
             </div>

         </div>
     </div> 
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
             
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
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                        取消
                    </button>
                </div>
            </div>
        </div>
    </div>
      <div class="Main-panel-content" style="background-color: moccasin">
       <table class="table table-hover">
        <asp:Repeater ID="ServiceChargeListTable" runat="server">
                 <HeaderTemplate>
                 <thead>
                     <tr>
                         <th>编号</th>

                         <th>业主姓名</th>
                         <th>房产单元</th>
                         <th>费用类型</th>
                         <th>应收时间</th>
                         <th>应收</th>
                         <th>本次表值</th>
                         <th>上次表值</th>
                         <th>表值差</th>
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
                            <td><%# Eval("StateTime")%></td>
                            <td><%# Eval("PaymentAmount")%></td>
                            <td><%# Eval("After")%></td>
                            <td><%# Eval("Before")%></td>
                            <td><%# Eval("DiffValue")%></td>


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
                        
                                <asp:Button ID="PayButton" runat="server" CssClass="btn btn-warning" Text="待缴费" OnClick="PayButton_Click" CommandArgument='<%# Eval("Id") %>' 
                                    Visible='<%# (Convert.ToInt32(Eval("PaidStatus")) == 0 ) %>' />
                        <asp:Button ID="chakan" runat="server" CssClass="btn  gg" Text="待确认"
                                    Visible='<%# (Convert.ToInt32(Eval("PaidStatus")) == 3 ) %>' />
                                <asp:Button ID="chakan1" runat="server" CssClass="btn  gg" Text="已确认"
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
