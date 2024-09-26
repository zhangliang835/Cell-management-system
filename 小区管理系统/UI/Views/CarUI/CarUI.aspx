<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="CarUI.aspx.cs" Inherits="UI.Views.CarUI.CarUI" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/Car.css" />
    <script src="../../JS/Resident.js"></script>
    <style type="text/css">
        /*取消按钮点击时边框出现*/
        .no-outline-btn:focus {
            outline: none !important;
        }

        .nav1 {
            display: block;
            background-color: white;
            height: auto !important;
        }

            .nav1 a:hover {
                background-color: whitesmoke;
                /*    box-shadow:2px,2px,2px rgba(0,0,0,0.5);*/
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：基础信息 >>>车辆管理</h3>
    <hr />
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
            <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                <div class="modal-header">

                    <h4 class="modal-title" id="myModalLabel" style="color:red">警告
                    </h4>
                </div>
                <div class="modal-body">
                    <label style="font-size: 16px">是否确认删除？</label>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="DeleteCar" class="btn btn-primary" runat="server" Text="确认" OnClick="DeleteCar_Click" />
                    <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                        取消
                    </button>
                </div>
            </div>
        </div>
    </div>
                <!-- 模态框（Modal） 请输入数据提示-->
    <div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabe8" aria-hidden="true">
        <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
            <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel8">通知
                    </h4>
                </div>
                <div class="modal-body">
                    <label style="font-size: 16px">已删除！</label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                        确认
                    </button>
                </div>
            </div>

        </div>
    </div> 
    <div class="select">

        <span>车主</span>
        <asp:TextBox ID="selectname" runat="server" Class="search-box"></asp:TextBox>
        <span>车牌号</span>
        <asp:TextBox ID="selectCar" runat="server"></asp:TextBox>

        <asp:Button ID="select" runat="server" Text="查询" OnClick="select_Click" class="btn btn-success" />
    </div>
    <div class="Main-panel-content">
        <div style="overflow-y: auto; max-height: 440px;">
            <!-- 添加图片模态框 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document" style="max-width: 30%;">
                    <div class="modal-content">
                        <div class="modal-header">
                        </div>
                        <div class="modal-body">
                            <img id="modalImage" src="#" alt="用户或车辆图片" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-hover ">
                <asp:Repeater ID="CarListTable" runat="server">
                    <HeaderTemplate>
                        <thead>
                            <tr>
                              
                                <th>车牌号</th>
                                <th>图片</th>
                        
                                <th>车主名称</th>
                                <th>车主电话</th>
            
                                <th>操作</th>
                            </tr>
                        </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                             
                                <td><%# Eval("Name")%></td>
                                <td>
                                    <asp:Image ID="CarPhotoView" runat="server" ImageUrl='<%# Eval("Photo")%>' CssClass="clickable-photo" /></td>
                             
                                <td><%# Eval("OwnerName")%></td>
                                <td><%# Eval("Phone")%></td>

                                <td style="width: 12%">

                                    <asp:Button ID="CarDelete_Click" runat="server" Text="删除"
                                        class="btn btn-danger" OnClick="CarDelete_Click_Click" CommandArgument='<%# Eval("Id") %>' />
                                </td>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
</asp:Content>
