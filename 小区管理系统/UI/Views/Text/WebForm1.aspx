<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UI.Views.Text.WebForm1" %>

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
  <div class="container mt-5">
     <asp:Button ID="btnShowToast" runat="server" Text="显示弹窗" OnClientClick="showToast(); return false;" UseSubmitBehavior="false" CssClass="btn btn-primary" />
    </div>

    <div class="position-fixed bottom-0 end-0 p-3">
        <div id="toast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <strong class="me-auto">弹窗标题</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                这是一个Bootstrap 5弹窗示例。
            </div>
        </div>
    </div>
<script>
    function showToast() {
        var toast = new bootstrap.Toast(document.getElementById('toast'));
        toast.show();
    }
</script>

    </form>
    	
</body>
</html>
