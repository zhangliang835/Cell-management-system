<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="UI.Views.Text.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   
    <script src="../../JS/jquery-3.7.1.min.js"></script>
     <link rel="stylesheet" href="../../bootstrap5/css/bootstrap.min.css" />
   <script src="../../bootstrap5/js/bootstrap.min.js"></script>


    <script src="../../bootstrap-datepicker-1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="../../bootstrap-datepicker-1.9.0/locales/bootstrap-datepicker.zh-CN.min.js"></script>
    <link rel="stylesheet" href="../../bootstrap-datepicker-1.9.0/css/bootstrap-datepicker.min.css" />
</head>
<body>
    <form id="form1" runat="server">
      <div class="container ">
        <div class="input-group input-daterange">
            <div class="input-group-prepend">
                <span class="input-group-text">预定日期</span>
            </div>
      
            <input id="inputDate1" type="text" placeholder="开始时间" class="form-control"/>
            <div class="input-group-addon">-</div>
            <input type="text" id="inputDate2" placeholder="结束时间" class="form-control"/>
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
    </form>
</body>
</html>
