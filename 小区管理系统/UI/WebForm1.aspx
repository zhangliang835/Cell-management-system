<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UI.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link rel="stylesheet" href="../../bootstrap5/css/bootstrap.min.css" />
    <script src="../../bootstrap5/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
      <div class="container mt-3">
  <h3>模态框实例</h3>
  <p>点击按钮打开模态框</p>
  
          <asp:Button ID="PayButton" runat="server" Text="缴费" Class="btn btn-danger"
             
             data-bs-toggle="modal" data-bs-target="#myModal" />
</div>
        
<!-- 模态框 -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4 class="modal-title">模态框标题</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- 模态框内容 -->
      <div class="modal-body">
        模态框内容..
      </div>

      <!-- 模态框底部 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">关闭</button>
      </div>

    </div>
  </div>
</div>

    </form>
</body>
</html>
