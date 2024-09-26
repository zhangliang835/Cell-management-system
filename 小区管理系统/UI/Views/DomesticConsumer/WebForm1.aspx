<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UI.Views.DomesticConsumer.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css" />
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		label{
			display:block;
			margin-bottom:25px;
		}
	</style>
</head>
<body>
   
    <form id="form1" runat="server">

<h2>创建模态框（Modal）</h2>
<!-- 按钮触发模态框 -->

		<asp:Button ID="Button1" runat="server" Text="开始演示模态框" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" OnClick="Button1_Click1"/>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					缴费表单
				</h4>
			</div>
			<div class="modal-body">
		  
			
				<label >您的住房面积为：200平方米</label>
				<hr />
				<label >一级物业收费标准：1.00元/月/平方米（已包含税、费）。</label>
				<hr />
			    <label>合计：200元</label>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">确认缴费
				</button>
				<button type="button" class="btn btn-danger">
					取消
				</button>
			</div>
		</div>
	</div>
</div>
    </form>
</body>
</html>
