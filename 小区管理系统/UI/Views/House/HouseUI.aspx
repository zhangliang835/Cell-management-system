<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="HouseUI.aspx.cs" Inherits="UI.Views.House.HouseUI" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/House.css" />
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/Signin.css" />
    <style type="text/css">
        /*取消按钮点击时边框出现*/
        .no-outline-btn:focus {
            outline: none !important;
        }

        #demo5 {
            background-color: white;
            box-shadow: 2px 2px 2px rgba(0,0,0,0.5)
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

        .modal-content {
            width: 42% !important;
            max-width: 800px !important;
        }

        .modal-dialog {
            display: flex; /* 对于Bootstrap 4+，确保对话框容器启用Flex布局 */
            align-items: center; /* 垂直居中 */
            justify-content: center; /* 水平居中 */
            margin-top: 55px;
        }

        .form-control {
            border: 1px gainsboro solid;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：基础信息 >>>房产管理</h3>
    <hr />
    <div class="select ">
        <div class="Housed">
            <a class="btn btn-danger collapsed" data-bs-toggle="collapse" data-bs-target="#demo5">入住情况</a>
            <div id="demo5" class="collapse">
                <ul class="nav1">
                    <li class="nav-item ">
                        <a class="nav-link " onclick="Housed_Click">
                            <asp:Button ID="AllHouse" runat="server" Text="全部" CssClass="no-outline-btn" OnClick="AllHouse_Click" BackColor="White" BorderWidth="0" />
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link " onclick="Housed_Click">
                            <asp:Button ID="Housed" runat="server" Text="已入住" CssClass="no-outline-btn" OnClick="Housed_Click1" BackColor="White" BorderWidth="0" />
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../LoginUI/Login.aspx" class="nav-link ">
                            <asp:Button ID="NoHouse" runat="server" Text="未入住" CssClass="no-outline-btn" OnClick="NoHouse_Click" BackColor="White" BorderWidth="0" />
                        </a>
                    </li>

                </ul>
            </div>
        </div>
                      <!-- 模态框（Modal） 初始化成功提示-->
      <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabe1" aria-hidden="true">
          <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
              <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                  <div class="modal-header">
                      <h4 class="modal-title" id="myModalLabel1">通知
                      </h4>
                  </div>
                  <div class="modal-body">
                      <label style="font-size: 16px">初始化完成！</label>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                          确认
                      </button>
                  </div>
              </div>

          </div>
      </div>  
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title" id="myModalLabel">房产登记
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label style="font-size: 16px">房产号</label>
                            <asp:TextBox ID="roomnumber" CssClass="form-control" runat="server"></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <label style="font-size: 16px">房型</label>
                            <asp:TextBox ID="type" CssClass="form-control" runat="server"></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <label style="font-size: 16px">面积</label>
                            <asp:TextBox ID="Area" CssClass="form-control" runat="server"></asp:TextBox>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="ADDHouse2" class="btn btn-primary" runat="server" Text="登记" OnClick="ADDHouse2_Click" />
                        <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                            取消
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 模态框（Modal）初始化警告 -->
        <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title" id="myModalLabel4" style="color: red">警告
                        </h4>
                    </div>
                    <div class="modal-body">

                        <label style="font-size: 16px">初始化操作将删除该房产的业主信息，请谨慎操作！</label>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="chushihua" class="btn btn-danger" runat="server" Text="确认初始化" OnClick="chushihua_Click" />
                        <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                            取消
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 模态框（Modal）删除警告 -->
        <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel5" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title" id="myModalLabel5" style="color: red">提示
                        </h4>
                    </div>
                    <div class="modal-body">

                        <label style="font-size: 16px">是否确认删除该房产信息？</label>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="ShanChu" class="btn btn-danger" runat="server" Text="确认删除" OnClick="ShanChu_Click" />
                        <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                            取消
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 模态框（Modal）修改 -->
        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabe3" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <h4 class="modal-title" id="myModalLabe3">房产信息修改
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label style="font-size: 16px">房产号</label>
                            <asp:TextBox ID="RoomNumber1" CssClass="form-control" runat="server"></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <label style="font-size: 16px">房型</label>
                            <asp:TextBox ID="Type1" CssClass="form-control" runat="server"></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <label style="font-size: 16px">面积</label>
                            <asp:TextBox ID="Area1" CssClass="form-control" runat="server"></asp:TextBox>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="UpdateHouse2" class="btn btn-primary" runat="server" Text="保存" OnClick="UpdateHouse2_Click" />
                        <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                            取消
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 模态框（Modal） 登记成功提示-->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
                <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel2">通知
                        </h4>
                    </div>
                    <div class="modal-body">
                        <label style="font-size: 16px">房产单元已成功登记</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                            确认
                        </button>
                    </div>
                </div>

            </div>
        </div>   
        <!-- 模态框（Modal） 删除成功提示-->
        <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
            <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
                <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel6">通知
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
        <!-- 模态框（Modal） 登记时面积数据错误提示-->
        <div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel7" aria-hidden="true">
            <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
                <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel7" style="color:red">提示
                        </h4>
                    </div>
                    <div class="modal-body">
                        <label style="font-size: 16px">面积的值必须是数字！</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                            确认
                        </button>
                    </div>
                </div>

            </div>
        </div>     
        <!-- 模态框（Modal） 登记时数据不完整错误提示-->
        <div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8" aria-hidden="true">
            <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
                <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel8" style="color:red">提示
                        </h4>
                    </div>
                    <div class="modal-body">
                        <label style="font-size: 16px">该房产号已被登记，请确认房产号输入正确</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                            确认
                        </button>
                    </div>
                </div>

            </div>
        </div> 
        <!-- 模态框（Modal） 登记时数据不完整错误提示-->
        <div class="modal fade" id="myModal9" tabindex="-1" role="dialog" aria-labelledby="myModalLabel9" aria-hidden="true">
            <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
                <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel9" style="color:red">提示
                        </h4>
                    </div>
                    <div class="modal-body">
                        <label style="font-size: 16px">数据不完整，无法登记！</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                            确认
                        </button>
                    </div>
                </div>

            </div>
        </div> 
        <!-- 模态框（Modal） 修改时，数据不完整成功提示-->
        <div class="modal fade" id="myModal10" tabindex="-1" role="dialog" aria-labelledby="myModalLabel10" aria-hidden="true">
            <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
                <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel10" style="color:red">提示
                        </h4>
                    </div>
                    <div class="modal-body">
                        <label style="font-size: 16px">数据不完整，无法修改！</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                            确认
                        </button>
                    </div>
                </div>

            </div>
        </div>    
        <!-- 模态框（Modal） 修改成功提示-->
        <div class="modal fade" id="myModal11" tabindex="-1" role="dialog" aria-labelledby="myModalLabel11" aria-hidden="true">
            <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
                <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel11" >通知
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
        <!-- 模态框（Modal） 删除时，已入住，删除失败提示-->
        <div class="modal fade" id="myModal12" tabindex="-1" role="dialog" aria-labelledby="myModalLabel12" aria-hidden="true">
            <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
                <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel12" >通知
                        </h4>
                    </div>
                    <div class="modal-body">
                        <label style="font-size: 16px">房产已入住登记，无法删除</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                            确认
                        </button>
                    </div>
                </div>

            </div>
        </div>
        <span>姓名</span>
        <asp:TextBox ID="selectname" runat="server" Class="search-box"></asp:TextBox>
        <span>房产号</span>
        <asp:TextBox ID="selectHouseName" runat="server"></asp:TextBox>
        <asp:Button ID="Select" runat="server" Text="查询" class="btn btn-success" OnClick="Select_Click1" />
        <asp:Button ID="ADDHouse" runat="server" Text="房产登记" class="btn btn-success" OnClick="ADDHouse_Click" />
    </div>
    <div class="Main-panel-content">
        <div style="overflow-y: auto; max-height: 440px;">

            <table class="table table-hover">
                <asp:Repeater ID="HouseListTable" runat="server">
                    <HeaderTemplate>
                        <thead>
                            <tr>
                       
                                <th>房产号</th>
                                <th>房型</th>
                                <th>面积</th>
                                <th>业主姓名</th>
                                <th>联系电话</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr style="background-color: white">
                         
                                <td><%# Eval("RoomNumber")%></td>
                                <td><%# Eval("Type")%></td>
                                <td><%# Eval("Area")%></td>


                                <td><%# Eval("OwnerName")%></td>
                                <td><%# Eval("Phone")%></td>

                                <td style="width: 14%">

                                    <asp:Button ID="UpdateHouse" runat="server" Text="修改" class="btn btn-warning" CommandArgument='<%# Eval("Id") %>' OnClick="UpdateHouse_Click" />
                                    <asp:Button ID="CarDelete_Click" runat="server" Text="删除"
                                        class="btn btn-danger" OnClick="CarDelete_Click_Click" CommandArgument='<%# Eval("Id") %>' />
                                    <asp:Button ID="HouseUpdate_Click" runat="server" Text="初始化" CommandArgument='<%# Eval("Id") %>'
                                        class="btn btn-danger" OnClick="HouseUpdate_Click_Click" />
                                </td>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
</asp:Content>
