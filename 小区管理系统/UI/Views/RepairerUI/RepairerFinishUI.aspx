<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepairerFinishUI.aspx.cs" Inherits="UI.Views.ResidentUI.ResidentFinishUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css" />
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/ResidentList.css" />
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/Repairer.css" />
    <style type="text/css">
        .form-group {
            margin-bottom: 60px;
            font-size: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="row">
                <div class="col-md-2" style="padding: 0;"></div>
                <div class="col-md-8">
                    <div class=" row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="username" class="form-label inline-block">报修人:</label>
                                <asp:Label ID="UserName" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="roomnumber" class="form-label inline-block">房产单元:</label>
                                <asp:Label ID="RoomNumber" runat="server"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="issuedescription" class="form-label inline-block">问题描述:</label>
                                <asp:Label ID="IssueDescription" runat="server"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="applytime" class="form-label inline-block">申请时间:</label>
                                <asp:Label ID="ApplyTime" runat="server"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="money" class="form-label inline-block">费用:</label>
                                <asp:TextBox ID="Money" runat="server" ></asp:TextBox>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="photobefore" class="form-label inline-block">损坏照片:</label>
                                <asp:Image ID="PhotoBeforeView" runat="server" Width="200" />
                            </div>



                            <div class="form-group">
                                <label class="control-label">维修图片</label>
                                <asp:FileUpload ID="PhotoAfter" runat="server" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label class="control-label">图片上传</label>
                                <asp:Button ID="PhotoAfterUpload" class="btn btn-success" runat="server" Text="上传" OnClick="PhotoAfterUpload_Click" />
                            </div>
                            <div class="form-group">
                                <label class="control-label ">图片预览</label>
                                <asp:Image ID="PhotoAfterView" runat="server" Width="200" />
                            </div>

                        </div>
                    </div>

                    <asp:Button ID="Affirm" class="btn btn-warning" runat="server" Text="确认" OnClick="Affirm_Click" />
                </div>
                <div class="col-md-1" style="padding: 0; background-color: forestgreen"></div>
            </div>
        </div>
    </form>
</body>
</html>
