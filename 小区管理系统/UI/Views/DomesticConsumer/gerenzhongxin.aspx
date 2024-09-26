<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gerenzhongxin.aspx.cs" Inherits="UI.Views.DomesticConsumer.gerenzhongxin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="../../bootstrap5/css/bootstrap.min.css" />
    <script src="../../bootstrap5/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="../../font/css/all.css" />
    <link rel="stylesheet" href="../../font/css/fontawesome.min.css" />
    <script src="../../JS/jquery-3.7.1.min.js"></script>
    <script src="../../bootstrap-datepicker-1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="../../bootstrap-datepicker-1.9.0/locales/bootstrap-datepicker.zh-CN.min.js"></script>
    <link rel="stylesheet" href="../../bootstrap-datepicker-1.9.0/css/bootstrap-datepicker.min.css" />
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/master.css" />
    <style>


        .circle-image {
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
            box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .container {
            height: auto;
        }

 


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top we justify-content-between">
            <span>首页</span>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">

                        <asp:Image ID="UserPhoto" runat="server" Width="100px" Height="100px" CssClass="circle-image" />
                    </div>
                </div>
                <div class="col-md-3">

                    <div class="form-group">
                        <label for="username" class="form-label inline-block">用户名:</label>
                        <asp:Label ID="UserName" runat="server"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="username" class="form-label inline-block">姓名:</label>
                        <asp:Label ID="name" runat="server"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="usersex" class="form-label inline-block">性别:</label>
                        <asp:Label ID="usersex" runat="server"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="userphone" class="form-label inline-block">联系电话:</label>
                        <asp:Label ID="userphone" runat="server"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="usersfid" class="form-label inline-block">身份证号:</label>
                        <asp:Label ID="usersfid" runat="server"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="usercar" class="form-label inline-block">车牌号:</label>
                        <asp:Label ID="usercar" runat="server"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="userhouse" class="form-label inline-block">房产单元:</label>
                        <asp:Label ID="userhouse" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 qq" style="background-color: saddlebrown">
                    <div class="family">
                        <ul>
                            <li>
                                <a>家庭成员报备</a>

                            </li>
                        </ul>

                    </div>
                </div>
                <div class="col-md-4 qq" style="background-color: goldenrod">
                    <div class="family garage-report-link2">
                        <a>车辆报备</a>
                    </div>
                </div>
                <div class="col-md-4 qq" style="background-color: cadetblue">
                    <div class="family garage-report-link">
                        <ul>
                            <li>
                                <a>车库报备</a>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
            <div class="row garageReportForm" style="background-color: gainsboro; margin-top: 10px; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">
                <div class="col-md-4">
                    <div class="mainban">
                        <div class="form-group">
                            <label>姓名</label>
                            <asp:TextBox ID="ResidentName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>车库</label>
                            <asp:TextBox ID="CarbranName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>联系电话</label>
                            <asp:TextBox ID="Phone" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">

                            <label for="State">租买</label>
                            <select id="State" class="form-control" runat="server">
                                <option value="1">已购买</option>
                                <option value="0">租用</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="queren" runat="server" Text="确认" CssClass="btn btn-danger" OnClick="queren_Click" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="mainban">
                        <div class="form-group">
                            <label class="control-label">车库图片</label>
                            <asp:FileUpload ID="CarPhoto" runat="server" class="form-control" />

                        </div>
                        <div class="form-group">

                            <asp:Button ID="CarbranUpload" class="btn btn-success" runat="server" Text="上传" OnClick="CarbranUpload_Click" />
                        </div>
                        <div class="form-group">

                            <asp:Image ID="CarPhotoView" runat="server" Width="22%" />
                        </div>
                    </div>
                </div>
            </div>   
            <div class="row garageReportForm1" style="background-color: gainsboro; margin-top: 10px; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">
                <div class="col-md-4">
                    <div class="mainban">
                        <div class="form-group">
                            <label>姓名</label>
                            <asp:TextBox ID="ResidentName1" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>车牌号</label>
                            <asp:TextBox ID="CarName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                   
                        <div class="form-group">
                            <asp:Button ID="queren1" runat="server" Text="确认" CssClass="btn btn-danger" OnClick="queren1_Click"  />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="mainban">
                        <div class="form-group">
                            <label class="control-label">车辆图片</label>
                           <asp:FileUpload ID="CarPhoto1" runat="server" class="form-control" onchange="previewImage(this);" />

                        </div>

                        <div class="form-group">
    <label class="control-label">图片预览</label>

                                <asp:Image ID="previewImg" runat="server" Width="45%" />
</div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                // 更精确地定位车库报备按钮，例如给它一个唯一类名
                var garageLink = $('.garage-report-link'); // 假设已给对应的a元素添加了class="garage-report-link"

                // 更精确地定位表单区域，例如给它一个唯一ID
                var formRowToShowHide = $('.garageReportForm'); // 假设已给对应的div.row元素添加了id="garageReportForm"

                // 页面加载时，表单区域默认隐藏
                formRowToShowHide.hide();

                // 绑定点击事件，实现显示/隐藏切换
                garageLink.click(function (event) {
                    event.preventDefault(); // 阻止a标签的默认行为（如跳转）
                    formRowToShowHide.fadeToggle('slow');
                });
            });
        </script>    
        <script>
            $(document).ready(function () {
                // 更精确地定位车库报备按钮，例如给它一个唯一类名
                var garageLink = $('.garage-report-link2'); // 假设已给对应的a元素添加了class="garage-report-link"

                // 更精确地定位表单区域，例如给它一个唯一ID
                var formRowToShowHide = $('.garageReportForm1'); // 假设已给对应的div.row元素添加了id="garageReportForm"

                // 页面加载时，表单区域默认隐藏
                formRowToShowHide.hide();

                // 绑定点击事件，实现显示/隐藏切换
                garageLink.click(function (event) {
                    event.preventDefault(); // 阻止a标签的默认行为（如跳转）
                    formRowToShowHide.fadeToggle('slow');
                });
            });
        </script>
        <script>
            $('#CarUpload').on('click', function (e) {
                // 记录mainban的显示状态到隐藏的表单字段或cookie
                $('#hiddenMainbanStatus').val($('.mainban').is(':visible'));
            });
        </script>
   <script type="text/javascript">
       function previewImage(input) {
           var file = input.files[0];
           var reader = new FileReader();

           reader.onload = function (e) {
               document.getElementById('previewImg').src = e.target.result;
               document.getElementById('previewImg').style.display = 'block';
           }
           reader.readAsDataURL(file);
       }
   </script>
    </form>
</body>
</html>
