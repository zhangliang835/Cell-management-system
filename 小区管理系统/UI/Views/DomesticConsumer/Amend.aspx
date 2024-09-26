<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Amend.aspx.cs" Inherits="UI.Views.DomesticConsumer.Amend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <%--<link rel="stylesheet" href="../../bootstrap5/css/bootstrap.min.css" />--%>

    <link type="text/css" rel="stylesheet" href="../../Content/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/Signin.css" />
    <script src="../../JS/jquery-3.7.1.min.js"></script>
    <script src="../../bootstrap5/js/bootstrap.min.js"></script>
    <%--    <script type="text/javascript" src="../../JS/Signin.js"></script>--%>
    <style>
        .mianban {
            background-color: white;
            margin-top: 160px;
        }

        .username {
            color: red;
            position: absolute;
            top: calc(2% + 7px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .password {
            color: red;
            position: absolute;
            top: calc(13% + 7px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .name {
            color: red;
            position: absolute;
            top: calc(24% + 7px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .phone {
            color: red;
            position: absolute;
            top: calc(17% + 8px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .shid {
            color: red;
            position: absolute;
            top: calc(57% + 7px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .room {
            color: red;
            position: absolute;
            top: calc(80% + 2px);
            left: 51px;
            width: 100%;
            z-index: 1;
            font-size: 14px !important;
        }

        .la {
            margin-bottom: 0px;
            margin-top: -29px;
        }

        .lab {
            font-size: 16px !important;
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
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">

            <div class="row">
                <!-- 模态框（Modal） 修改成功提示-->
                <div class="modal fade" id="myModal11" tabindex="-1" role="dialog" aria-labelledby="myModalLabel11" aria-hidden="true">
                    <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
                        <div class="modal-content b" style="width: 42% !important; max-width: 800px !important;">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel11">通知
                                </h4>
                            </div>
                            <div class="modal-body">
                                <label style="font-size: 16px">房产信息修改成功</label>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                                    确认
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-2">
                </div>

                <div class="col-md-8 ">
                    <div class="mianban">
                        <span>修改资料</span>
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="username">用户名</label>
                                    <asp:TextBox ID="UserName" type="text" class="form-control"
                                        runat="server" placeholder="请输入用户名"></asp:TextBox>
                                    <!-- 用户名验证 -->
                                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server"
                                        ControlToValidate="UserName"
                                        ErrorMessage="用户名不能为空！"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        Class="username">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revUserNameLength" runat="server"
                                        ControlToValidate="UserName"
                                        ErrorMessage="用户名长度不能超过十个字！"
                                        ValidationExpression="^.{1,10}$"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        Class="username">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group ">
                                    <label for="name">姓名</label>
                                    <asp:TextBox ID="Name" runat="server" class="form-control"></asp:TextBox>

                                </div>

                     
                                <div class="form-group">

                                    <label for="sex">性别</label>
                                    <select id="Sex" class="form-control" runat="server">
                                        <option value="1">男</option>
                                        <option value="0">女</option>
                                    </select>
                                </div>
                                <div class="form-group ">
                                    <label for="houseid">房产单元</label>
                                    <asp:TextBox ID="HouseName" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="phone">联系电话</label>
                                    <asp:TextBox ID="Phone" type="number" class="form-control" runat="server"></asp:TextBox>
                                    <!-- 联系电话验证 -->
                                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                                        ControlToValidate="Phone"
                                        ErrorMessage="联系电话不能为空！"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        Class="phone">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revPhoneFormat" runat="server"
                                        ControlToValidate="Phone"
                                        ErrorMessage="联系电话必须以1开头，且为11位数字。"
                                        ValidationExpression="^1\d{10}$"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        Class="phone">
                                    </asp:RegularExpressionValidator>
                                </div>




                                <div class="form-group">
                                    <asp:Button ID="SigninButton" runat="server" Text="保存" class="  btn btn-warning custom-size-button " OnClick="SigninButton_Click" />
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label class="control-label">头像选择</label>
                                    <asp:FileUpload ID="UserPhoto" runat="server" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label">头像上传</label>
                                    <asp:Button ID="UserPhotoUpload" class="btn btn-success" runat="server" Text="上传" OnClick="UserPhotoUpload_Click" />
                                </div>
                                <div class="form-group">
                                    <label class="control-label ">头像预览</label>
                                    <asp:Image ID="UserPhotoView" runat="server" Width="62%" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
