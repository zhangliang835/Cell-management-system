<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm8.aspx.cs" Inherits="UI.Views.Text.WebForm8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link rel="stylesheet" href="../../bootstrap5/css/bootstrap.min.css" />
    <script src="../../bootstrap5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../font/CSS/fontawesome.min.css" />
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/master.css" />
    <link rel="stylesheet" href="../../font/css/all.css" />
    <link rel="stylesheet" href="../../font/css/fontawesome.min.css" />
    <script src="../../JS/jquery-3.7.1.min.js"></script>
    <script src="../../bootstrap-datepicker-1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="../../bootstrap-datepicker-1.9.0/locales/bootstrap-datepicker.zh-CN.min.js"></script>
    <link rel="stylesheet" href="../../bootstrap-datepicker-1.9.0/css/bootstrap-datepicker.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        
<!-- 轮播 -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

   <!-- 指示符 -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- 轮播图片 -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../Image/20150126213929.jpg" class="d-block" style="width:50%"/>
    </div>
    <div class="carousel-item">
      <img src="../Image/R-C (2).jpg" class="d-block" style="width:50%"/>
    </div>
    <div class="carousel-item">
      <img src="../Image/R-C (3).jpg" class="d-block" style="width:50%"/>
    </div>
  </div>
  
  <!-- 左右切换按钮 -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>
    </form>
</body>
</html>
