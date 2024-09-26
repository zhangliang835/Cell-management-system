<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="VisitRecordList.aspx.cs" Inherits="UI.Views.VisitRecordUI.VisitRecordList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
        <link rel="stylesheet" type="text/css" href="../../Master.CSS/TimeXuanZe.css"/>
    <style>
             .zhuangtai {
         width: 10%;
     }
                            .b {
           width: 42% !important;
           max-width: 800px !important;
       }

       .a {
           display: flex; /* 对于Bootstrap 4+，确保对话框容器启用Flex布局 */
           align-items: center; /* 垂直居中 */
           justify-content: center; /* 水平居中 */
           margin-top: 55px;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 style="margin-top:108px;margin-bottom:50px">您现在的位置：访客记录 >>> 访客记录</h3>
<hr />
                <!-- 模态框（Modal） 离开成功提示-->
<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
    <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
        <div class="modal-content b" style="width: 42% !important; max-width: 800px !important;">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel6">通知
                </h4>
            </div>
            <div class="modal-body">
                <label style="font-size: 16px">已确认离开！</label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                    确认
                </button>
            </div>
        </div>

    </div>
</div>  
        <div style="margin-top:50px;">
                 <span>
           <label>离开状态</label>
           <asp:DropDownList ID="DropDownList1" runat="server" CssClass="zhuangtai" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
               <asp:ListItem Text="全部" Value="全部"></asp:ListItem>
               <asp:ListItem Text="已离开" Value="已离开"></asp:ListItem>
               <asp:ListItem Text="未离开" Value="未离开"></asp:ListItem>

           </asp:DropDownList>


       </span>
    </div>
    <div style="margin-top:28px;">
          <span >
      <label>时间查询</label>
      <asp:TextBox ID="inputDate1" runat="server" ClientIDMode="Static"></asp:TextBox>
      <span>-</span>
      <asp:TextBox ID="inputDate2" runat="server" ClientIDMode="Static"></asp:TextBox>
  </span>
  <span style="display: inline-block; margin-left: 1%;">
      <label>姓名</label>
      <asp:TextBox ID="name" runat="server"></asp:TextBox>
  </span>
  <asp:Button ID="select" runat="server" Text="查询" CssClass="btn btn-success" OnClick="select_Click" />
    </div>
    <div class="Main-panel-content">
        <div style="overflow-y: auto; max-height: 440px;">
            <div class="table-responsive">
                <table class="table table-hover">
                    <asp:Repeater ID="VisitRecordListTable" runat="server">
                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th scope="col">编号</th>
                                    <th scope="col">姓名</th>
                                    <th scope="col">联系电话</th>
                                    <th scope="col">业主姓名</th>
                                    <th scope="col">房产号</th>
                                    <th scope="col">访问时间</th>
                                    <th scope="col">访问目的</th>
                                    <th scope="col">是否离开</th>
                                    <th scope="col">离开时间</th>
                                    <th scope="col">操作</th>

                                </tr>
                            </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td><%# Eval("Id") %></td>
                                    <td><%# Eval("Name") %></td>


                                    <td><%# Eval("Phone") %></td>
                                    <td><%# Eval("ResidentName") %></td>
                                    <td><%# Eval("RoomNumber") %></td>
                                    <td><%# Eval("ArrivalTime") %></td>
                                    <td><%# Eval("Purpose") %></td>
                                
                                    <td style='<%# Eval("Leave").ToString() == "1" ? "color:black;": Eval("Leave").ToString() == "0" ? "color:red;" : ""%>'>
                                        <%# 
    Eval("Leave").ToString() == "1" ? "已离开" : 
    Eval("Leave").ToString() == "0" ? "未离开" : 
    "未知状态" %>
                                    </td>
                                    <td><%# Eval("DepartureTime") %></td>


                                        <td class="text-center" style="width: 12%">
                            
                                   <asp:Button ID="Leave_Click" runat="server" Text="确认离开" Class="btn btn-primary" OnClick="Leave_Click_Click"  CommandArgument='<%# Eval("Id") %>' />
                               </td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
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
