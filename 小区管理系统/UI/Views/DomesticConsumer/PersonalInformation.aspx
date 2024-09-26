<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="PersonalInformation.aspx.cs" Inherits="UI.Views.DomesticConsumer.PersonalInformation" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <style>
        .circle-image1 {
            width: 245px !important;
            height: 245px !important;
            border-radius: 50%;
            overflow: hidden;
        }

        .mainban .form-group {
            color: black;
            display: flex;
            flex-direction: row;
            margin-top: 20px;
            align-items: center;
            font-size: 16px;
            margin-bottom: 30px;
        }

        .mainban label {
            width: 50px;
        }

        .mainban .form-control {
            height: 30px;
            font-size: 14px;
        }

        .family {
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .qq:hover {
            box-shadow: 1px 1px 11px rgba(0, 0, 0, 0.5);
        }

        .custom-textbox:focus {
            outline: none; /* 取消点击聚焦时的轮廓 */
            box-shadow: none; /* 取消点击聚焦时的阴影效果（对于一些浏览器，比如Firefox） */
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            position: relative;
        }

        .form-group1 .btn {
            width: 150px;
        }

        .form-group label {
            width: 60px;
            margin-right: 10px;
            font-size: 14px;
        }

        .form-control {
            border-radius: 0;
            width: 100%;
            border: 1px solid #C9C9C9;
            font-size: 14px;
            /*自适应高度*/
            height: auto;
        }

        .custom-modal-position {
            top: 250px; /* 或者您想要的距离 */
        }

        .rili {
            height: 50px;
            width: 300px;
            background-color: rgba(0,102,2,0.6);
            color: white;
        }

        .rili2 {
            height: 200px;
            width: 300px;
            background-color: rgba(0,102,2,0.12);
        }

        .hezi {
            /* width: 209px;*/
            height: 302px;
            background-color: white;
            /*     box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);*/
        }

            .hezi:hover {
                box-shadow: 0 2px 10px rgba(255, 0, 0, 0.5);
            }

        .hezi2 {
            height: 350px;
            background-color: white;
        }

            .hezi2:hover {
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
            }

        .Photo {
            width: 100%;
            height: 202px;
        }

        .hezi2 .Photo {
            width: 100%;
            height: 250px;
        }

        .ziti {
            color: black;
            font-size: 20px;
            text-align: center;
        }

        .name {
            margin-top: 20px;
            margin-bottom: 14px;
            display: flex;
            justify-content: center;
        }

        .hezi .btn {
            width: 100%;
            border-radius: 0px;
        }

        .hezi2 .btn {
            width: 100%;
            border-radius: 0px;
        }

        .ziti2 {
            margin-top: 20px;
            font-size: 20px;
            font-family: '宋体';
        }

        .b {
            width: 100% !important;
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

    <div class="modal fade custom-modal-position" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">家庭成员</h4>
                </div>
                <div class="modal-body">
                    <div class="container" style="height: 300px">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>姓名</label>
                                    <asp:TextBox ID="FamilyName" runat="server" CssClass="form-control custom-textbox"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="sex">性别</label>
                                    <select id="Sex" class="form-control custom-textbox" runat="server">
                                        <option value="1">男</option>
                                        <option value="0">女</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>关系</label>
                                    <asp:TextBox ID="FamilyGuanxi" runat="server" CssClass="form-control custom-textbox"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">图片</label>
                                    <asp:FileUpload ID="FamilyPhoto" runat="server" class="form-control custom-textbox" onchange="previewImage(this, 'ContentPlaceHolder1_previewImg2');" />
                                </div>

                                <div class="form-group">
                                    <asp:Image ID="previewImg2" runat="server" Width="45%" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="FamilyADD" runat="server" Text="确认" CssClass="btn btn-danger" OnClick="FamilyADD_Click" />
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                        取消
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- 模态框（Modal）车辆删除警告 -->
    <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
        <div class="modal-dialog a">
            <div class="modal-content b">
                <div class="modal-header">

                    <h4 class="modal-title" id="myModalLabel4" style="color: red">提示
                    </h4>
                </div>
                <div class="modal-body">

                    <label style="font-size: 16px">是否确认删除该车辆信息？</label>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="cheliangshanchu" class="btn btn-danger" runat="server" Text="确认删除" OnClick="cheliangshanchu_Click" />
                    <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                        取消
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- 模态框（Modal）family删除警告 -->
    <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel5" aria-hidden="true">
        <div class="modal-dialog a">
            <div class="modal-content b">
                <div class="modal-header">

                    <h4 class="modal-title" id="myModalLabel5" style="color: red">提示
                    </h4>
                </div>
                <div class="modal-body">

                    <label style="font-size: 16px">是否确认删除该家庭成员信息？</label>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="familyshanchu" class="btn btn-danger" runat="server" Text="确认删除" OnClick="familyshanchu_Click" />
                    <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                        取消
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- 模态框（Modal） 删除成功提示-->
    <div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabe7" aria-hidden="true">
        <div class="modal-dialog a">
            <div class="modal-content b">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel7">通知
                    </h4>
                </div>
                <div class="modal-body">
                    <label style="font-size: 16px">已成功删除！</label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                        确认
                    </button>
                </div>
            </div>

        </div>
    </div>
    <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
        <div class="modal-dialog a">
            <div class="modal-content b">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel6">通知
                    </h4>
                </div>
                <div class="modal-body">
                    <label style="font-size: 16px">已成功报备！</label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                        确认
                    </button>
                </div>
            </div>

        </div>
    </div>
    <div class="modal fade custom-modal-position" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabe3" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabe3">车辆报备</h4>
                </div>
                <div class="modal-body">
                    <div class="container" style="height: 300px">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>姓名</label>
                                    <asp:TextBox ID="ResidentName1" runat="server" CssClass="form-control custom-textbox"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>车牌号</label>
                                    <asp:TextBox ID="CarName" runat="server" CssClass="form-control custom-textbox"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">车辆图片</label>
                                    <asp:FileUpload ID="CarPhoto1" runat="server" class="form-control" onchange="previewImage(this, 'ContentPlaceHolder1_previewImg');" />

                                </div>
                                <div class="form-group">
                                    <label class="control-label">图片预览</label>

                                    <asp:Image ID="previewImg" runat="server" Width="45%" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="queren1" runat="server" Text="确认" CssClass="btn btn-danger" OnClick="queren1_Click" />
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                        取消
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade custom-modal-position" id="myModa4" tabindex="-1" role="dialog" aria-labelledby="myModalLabe4" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabe4">车库报备</h4>
                </div>
                <div class="modal-body">
                    <div class="container" style="height: 300px">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>姓名</label>
                                    <asp:TextBox ID="ResidentName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>车库</label>
                                    <asp:TextBox ID="CarbranName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>


                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>联系电话</label>
                                    <asp:TextBox ID="Phone" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">

                                    <label for="State">租买</label>
                                    <select id="State" class="form-control" runat="server">
                                        <option value="1">已购买</option>
                                        <option value="2">租用</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="queren" runat="server" Text="确认" CssClass="btn btn-danger" OnClick="queren_Click" />
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                        取消
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid1" style="background-color: white; overflow-y: auto; max-height: 93vh; overflow-x: hidden;">
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">

                    <asp:Image ID="UserPhoto" runat="server" CssClass="circle-image1" />
                </div>
            </div>
            <div class="col-md-3">

                <div class="form-group1">
                    <label for="username" class="form-label inline-block">用户名:</label>
                    <asp:Label ID="UserName" runat="server"></asp:Label>
                </div>
                <div class="form-group1">
                    <label for="username" class="form-label inline-block">姓名:</label>
                    <asp:Label ID="name" runat="server"></asp:Label>
                </div>
                <div class="form-group1">
                    <label for="usersex" class="form-label inline-block">性别:</label>
                    <asp:Label ID="usersex" runat="server"></asp:Label>
                </div>
                <div class="form-group1">
                    <label for="userphone" class="form-label inline-block">联系电话:</label>
                    <asp:Label ID="userphone" runat="server"></asp:Label>
                </div>


                <div class="form-group1">
                    <label for="userhouse" class="form-label inline-block">房产单元:</label>
                    <asp:Label ID="userhouse" runat="server"></asp:Label>
                </div>
                <div class="form-group1">
                    <asp:Button ID="bianji" runat="server" Text="编辑资料" CssClass="btn btn-success" OnClick="bianji_Click" />
                </div>
            </div>
            <div class="col-md-3"></div>
            <div class="col-md-3">
                <div class="rili">
                    <label style="display: block; text-align: center; font-size: 25px; line-height: 50px">当前时间</label>
                </div>
                <div class="rili2">
                    <h4 id="currentTime" style="display: block; text-align: center; padding-top: 40px">
                        <span id="currentTimePart"></span>
                        <br>
                        <span id="currentDate"></span>
                    </h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 qq" style="background-color: wheat">
                <div class="family" id="familyMemberBtn">
                    <a>家庭成员报备</a>
                </div>
            </div>
            <div class="col-md-4 qq" style="background-color: gainsboro">
                <div class="family" id="CarMemberBtn">
                    <a>车辆报备</a>
                </div>
            </div>
            <div class="col-md-4 qq" style="background-color: mistyrose">
                <div class="family" id="CarBarnMemberBtn">
                    <a>车库报备</a>
                </div>
            </div>
        </div>
        <div class="row">
            <label class="ziti2">您的家庭成员：</label>

        </div>
        <div class="row" style="margin-top: 10px;">
            <asp:Repeater ID="RepeaterFamily" runat="server">
                <ItemTemplate>
                    <div class="col-md-2" style="margin-left: 40px; margin-top: 10px">
                        <div class="hezi">
                            <a>
                                <asp:Image ID="ItemImage" runat="server" CssClass="Photo" ImageUrl='<%# Eval("FamilyPhoto") %>' />
                                <div class="name">
                                    <asp:Label ID="ItemLabel1" runat="server" Text='<%# Eval("Name1") %>' CssClass="ziti"></asp:Label>
                                </div>
                            </a>
                            <asp:Button ID="DELETEFamily" runat="server" Text="删除" CssClass="btn btn-danger" OnClick="DELETEFamily_Click" CommandArgument='<%# Eval("Id") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <hr />
        <div class="row">
            <label class="ziti2">您已报备的车辆：</label>

        </div>
        <div class="row" style="margin-top: 10px;">
            <asp:Repeater ID="RepeaterCar" runat="server">
                <ItemTemplate>
                    <div class="col-md-5" style="margin-left: 40px; margin-top: 10px">
                        <div class="hezi2">
                            <asp:Image ID="ItemImage2" runat="server" CssClass="Photo" ImageUrl='<%# Eval("Photo") %>' />
                            <div class="name">
                                <asp:Label ID="ItemLabel12" runat="server" Text='<%# Eval("Name") %>' CssClass="ziti"></asp:Label>
                            </div>
                            <asp:Button ID="DELETECar" runat="server" Text="删除" CssClass="btn btn-danger" OnClick="DELETECar_Click" CommandArgument='<%# Eval("Id") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>


    </div>

    <%-- 打开模态框 --%>
    <script>

        $(document).ready(function () {
            // 家庭成员按钮点击事件
            $('#familyMemberBtn').on('click', function (e) {
                e.preventDefault();
                $('#myModa2').modal('show');
            });

            // 车辆成员按钮点击事件
            $('#CarMemberBtn').on('click', function (e) {
                e.preventDefault();
                $('#myModa3').modal('show');
            });

            // 车库成员按钮点击事件
            $('#CarBarnMemberBtn').on('click', function (e) {
                e.preventDefault();
                $('#myModa4').modal('show');
            });
        });


    </script>
    <%-- 图片直接预览 --%>
    <script type="text/javascript">
        function previewImage(input, targetId) {
            var file = input.files[0];
            var reader = new FileReader();

            reader.onload = function (e) {
                document.getElementById(targetId).src = e.target.result;
                document.getElementById(targetId).style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    </script>

    <%-- 钟表 --%>
    <script>
        function updateTime() {
            const now = new Date();
            const currentDateElement = document.getElementById('currentDate');
            const currentTimePartElement = document.getElementById('currentTimePart');

            currentDateElement.textContent = now.toLocaleDateString('zh-CN', { year: 'numeric', month: 'long', day: 'numeric' });
            currentTimePartElement.textContent = now.toLocaleTimeString('zh-CN', { hour12: false });


        }

        setInterval(updateTime, 1000); // 每隔1000毫秒（1秒）调用updateTime函数
        updateTime(); // 页面加载时立即更新一次时间
    </script>

</asp:Content>
