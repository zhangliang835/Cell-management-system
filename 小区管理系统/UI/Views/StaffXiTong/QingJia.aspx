<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Staff.Master" AutoEventWireup="true" CodeBehind="QingJia.aspx.cs" Inherits="UI.Views.StaffXiTong.QingJia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/Signin.css" />
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/Maintenance.css" />
    <style type="text/css">
        body {
            background-color: #f8f9fa;
        }

        .form-area {
            background-color: #f2f3f4;
            padding: 15px 35px 37px;
            margin: 50px 0;
            border: 1px solid #e5e5e5;
            border-radius: 15px;
            box-shadow: 0px 8px 12px 3px rgba(0, 0, 0, 0.1);
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);        
        }



        .control-label {
            color: #495057;
            font-weight: bold;
        }

        .date-field {
            display: inline-block;
            width: calc(50% - 4px);
            margin-right: 8px;
        }

            .date-field:last-child {
                margin-right: 0;
            }

        .container {
            height: 93vh;
        }
        .tijiao{
            display:flex;
            justify-content:center;
        }
        .tijiaoanniu{
            width:200px;
            font-size:18px;
        }
     .shijian {
    width: calc(37% + 8px) !important;
}
     .liyou{
         margin-left:70px;
     }
        /* 时间选择器通用样式优化 */
        .datepicker {
            border: 1px solid #ced4da; /* 边框颜色 */
            border-radius: .3rem; /* 圆角 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, .1); /* 阴影 */
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; /* 字体 */
        }

        .datepicker-dropdown {
            background: linear-gradient(145deg, #ffffff, #f0f0f0) !important; /* 背景渐变 */
        }

        .datepicker table {
            color: #333; /* 日期文字颜色 */
        }

        .datepicker .table-condensed {
            border-radius: .3rem; /* 表格圆角 */
        }

        /* 当天日期样式 */
        .datepicker .day.active, .datepicker .day.active:hover, .datepicker .day.active:focus {
            background-color: #007bff; /* 激活状态背景色 */
            color: #fff; /* 激活状态文字色 */
            border-radius: .3rem; /* 圆角 */
        }

        /* 鼠标悬停日期样式 */
        .datepicker .day:hover, .datepicker .day:focus {
            background-color: #e9ecef; /* 鼠标悬停背景色 */
            border-radius: .3rem; /* 圆角 */
        }

        /* 已选日期范围样式 */
        .datepicker .range {
            background-color: #f8f9fa !important; /* 范围背景色 */
            border-radius: .3rem; /* 圆角 */
        }

        /* 禁用和不属于当前月份的日期样式 */
        .datepicker .day.disabled, .datepicker .day.old, .datepicker .day.new {
            color: #ccc; /* 文字颜色 */
        }

        /* 导航按钮样式 */
        .datepicker .prev, .datepicker .next {
            cursor: pointer; /* 鼠标样式 */
        }

            /* 导航箭头颜色 */
            .datepicker .prev:before, .datepicker .next:before {
                color: #007bff; /* 箭头颜色 */
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <!-- 模态框（Modal） 请假成功提示-->
        <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
            <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
                <div class="modal-content b" style="width: 100% !important; max-width: 800px !important;">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel6">通知
                        </h4>
                    </div>
                    <div class="modal-body">
                        <label style="font-size: 16px">请假申请已发送至管理员系统，同时已通过短信的形式通知管理员！！</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                            确认
                        </button>
                    </div>
                </div>

            </div>
        </div>
        <div class="form-area">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group" style="margin-top: 50px;">
                        <label for="DropDownList1" class="control-label">类别</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control " AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Text="事假" Value="事假"></asp:ListItem>
                            <asp:ListItem Text="病假" Value="病假"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="inputDate1" class="control-label">时间</label>
                        <asp:TextBox ID="inputDate1" runat="server" ClientIDMode="Static" CssClass="form-control shijian"></asp:TextBox>
                        <span>-</span>
                        <asp:TextBox ID="inputDate2" runat="server" ClientIDMode="Static" CssClass="form-control shijian"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <textarea id="TextArea1" class="form-control liyou" runat="server" cols="20" rows="6" placeholder="请说明请假理由"></textarea>
                    </div>
                    <div class="form-group tijiao ">
                        <asp:Button ID="Uploading" runat="server" Text="提交" CssClass="btn btn-primary tijiaoanniu" OnClick="Uploading_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- JavaScript for datepicker here -->
    <script>
        var ops = {
            language: 'zh-CN',
            autoclose: true,
            clearBtn: true,
            format: "yyyy-mm-dd",
            startDate: "2020-06-10",
        };

        $("#inputDate1").datepicker(ops);
        $("#inputDate2").datepicker(ops);

        $("#inputDate1").datepicker().on("changeDate", function (e) {
            $("#inputDate2").datepicker('setStartDate', e.date);
        });
        $("#inputDate2").datepicker().on("changeDate", function (e) {
            $("#inputDate1").datepicker('setEndDate', e.date);
        });
    </script>
</asp:Content>
