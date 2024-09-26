<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JiaZheng.aspx.cs" Inherits="UI.Views.JiaZhengUI.JiaZheng" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="../../bootstrap5/css/bootstrap.min.css" />

    <link rel="stylesheet" href="../../font/CSS/fontawesome.min.css" />
    <link type="text/css" rel="stylesheet" href="../../Master.CSS/master.css" />
    <link rel="stylesheet" href="../../font/css/all.css" />
    <link rel="stylesheet" href="../../font/css/fontawesome.min.css" />
    <script src="../../JS/jquery-3.7.1.min.js"></script>
    <script src="../../bootstrap5/js/bootstrap.min.js"></script>
    <script src="../../bootstrap-datepicker-1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="../../bootstrap-datepicker-1.9.0/locales/bootstrap-datepicker.zh-CN.min.js"></script>
    <link rel="stylesheet" href="../../bootstrap-datepicker-1.9.0/css/bootstrap-datepicker.min.css" />
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
        <script src="../../JS/Resident.js"></script>
    <style>
        .daohang {
            width: 200px;
            /* background-color:saddlebrown;*/
            display: flex;
            justify-content: center;
        }

            .daohang span {
                font-family: '宋体';
                font-size: 22px;
                font-weight: 800;
            }

            .daohang a:hover {
                color: red !important;
            }

        .col-md-1 {
            margin-top: 56px;
        }

        .col-md-10 {
            box-shadow: 0px 4px 11px rgba(0, 0, 0, 0.3);
        }

        .bt {
            width: 50px;
            font-size: 12px !important;
            padding: 0 !important;
        }

        .zhuangtai {
            width: 10%;
        }

        a {
            text-decoration: none;
            color: white !important;
        }
                #myModal {
  z-index: 5050 !important; /* 这个值应当高于其他所有模态框的默认z-index值 */
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top we justify-content-center">
                    <%--    <span>家政服务平台管理员系统！</span>--%>
                    <div class="daohang">
                        <span><a>小区订单</a></span>
                    </div>
                    <div class="daohang">
                        <span><a href="YuanGongUI.aspx">员工管理</a></span>
                    </div>
                </nav>
                <div class="col-md-2"></div>
                <div class="col-md-10">
                    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：家政服务平台管理员系统 >>> 小区订单</h3>
                    <hr />
                    <div style="margin-top: 20px;">
                        <span style="display: inline; margin-right: 165px;">
                            <label>费用类型</label>
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="zhuangtai" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                <asp:ListItem Text="全部" Value="全部"></asp:ListItem>
                                <asp:ListItem Text="深度清洁" Value="深度清洁"></asp:ListItem>
                                <asp:ListItem Text="日常清洁" Value="日常清洁"></asp:ListItem>
                                <asp:ListItem Text="衣物洗护" Value="衣物洗护"></asp:ListItem>
                                <asp:ListItem Text="全屋大扫除" Value="全屋大扫除"></asp:ListItem>
                                <asp:ListItem Text="油烟机清洗" Value="油烟机清洗"></asp:ListItem>
                                <asp:ListItem Text="冰箱清洗" Value="冰箱清洗"></asp:ListItem>
                                <asp:ListItem Text="管道疏通" Value="管道疏通"></asp:ListItem>
                                <asp:ListItem Text="维修服务" Value="维修服务"></asp:ListItem>
                            </asp:DropDownList>


                        </span>
                        <span>
                            <label>状态</label>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="zhuangtai" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Text="全部" Value="全部"></asp:ListItem>
                                <asp:ListItem Text="已完成" Value="已完成"></asp:ListItem>
                                <asp:ListItem Text="进行中" Value="进行中"></asp:ListItem>
                                <asp:ListItem Text="退订" Value="退订"></asp:ListItem>
                            </asp:DropDownList>


                        </span>

                    </div>
                    <div style="margin-top: 28px;">
                        <span>
                            <label>时间查询</label>
                            <asp:TextBox ID="inputDate1" runat="server" ClientIDMode="Static"></asp:TextBox>
                            <span>-</span>
                            <asp:TextBox ID="inputDate2" runat="server" ClientIDMode="Static"></asp:TextBox>

                        </span>
                        <span style="display: inline-block; margin-left: 1%;">
                            <label>服务名称</label>
                            <asp:TextBox ID="name" runat="server"></asp:TextBox>
                        </span>
                        <span style="display: inline-block; margin-left: 1%;">
                            <label>订单号</label>
                            <asp:TextBox ID="OrderNumber" runat="server"></asp:TextBox>
                        </span>
                        <asp:Button ID="select" runat="server" Text="查询" CssClass="btn btn-success" OnClick="select_Click" />


                    </div>
                       <!-- 添加图片模态框 -->
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog modal-lg" role="document" style="max-width: 30%;">
           <div class="modal-content">

               <div class="modal-body">
                   <img id="modalImage" src="#" alt="用户或车辆图片" class="img-fluid"/>
               </div>
           </div>
       </div>
   </div>
                                <!-- 已分配员工模态框 -->
            <div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">

                            <h4 class="modal-title" id="myModalLabel">分配员工
                            </h4>
                        </div>
                        <div class="modal-body">
                            <table class="table  table-hover">
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>订单号</th>
                                                <th>工号</th>
                                                <th>姓名</th>
                                                <th>电话</th>
                                                <th>照片</th>
                                                <th>出勤时间</th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tbody>
                                            <tr>
                                                <td><%# Eval("Id") %></td>
                                                <td><%# Eval("OrderNumber") %></td>
                                                <td><%# Eval("JobNumber") %></td>
                                                  <td><%# Eval("Name") %></td>
                                                  <td><%# Eval("Phone") %></td>
                                                      <td class="text-center bb">
          <asp:Image ID="FamilyPhotoView" runat="server" ImageUrl='<%# Eval("Photo") %>' CssClass="clickable-photo" />
      </td>
                                              
                                                <td><%# Eval("ChuQianTime") %></td>
                                            </tr>
                                        </tbody>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                                确认
                            </button>
                        </div>
                    </div>
                </div>
            </div>
                    <div class="Main-panel-content" style="background-color: moccasin">
                        <table class="table  table-hover">
                            <asp:Repeater ID="ShangMenListTable" runat="server">
                                <HeaderTemplate>
                                    <thead>
                                        <tr>
                                            <th>订单号</th>
                                            <th>服务类别</th>
                                            <th>价格</th>
                                            <th>定金</th>
                                            <th>上门时间</th>
                                            <th>状态</th>
                                            <th>业主姓名</th>
                                            <th>地址</th>
                                            <th>联系电话</th>

                                            <th>备注</th>


                                            <th>操作</th>

                                        </tr>
                                    </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tbody>
                                        <tr>

                                            <td><%# Eval("OrderNumber") %></td>
                                            <td><%# Eval("Name") %></td>
                                            <td><%# Eval("Price") %></td>
                                            <td><%# Eval("DownPayment") %></td>

                                            <td><%# Eval("SMTime") %></td>

                                            <td
                                                style='<%# 
    Eval("State").ToString() == "1" ? "color:red;": Eval("State").ToString() == "3" ? "color:red;" : 
    Eval("State").ToString() == "0" ? "color:red;" : 
    Eval("State").ToString() == "4" ? "color:blue;" : ""
%>'>
                                                <%# 
                                         Eval("State").ToString()=="1" ? "进行中":
                                         Eval("State").ToString()=="0" ? "已完成":
                                         Eval("State").ToString()=="3" ? "已退订":                                            
                                         Eval("State").ToString()=="4" ? "未知":""                                            
                                                %>
                                            </td>
                                            <td><%# Eval("ResName") %></td>
                                            <td><%# Eval("Area") %></td>
                                            <td><%# Eval("Phone") %></td>

                                            <td><%# Eval("BeiZhu") %></td>

                                            <td class="text-center" style="width: 15%">


                                                <a href='<%# "~/Views/JiaZhengUI/YuanGongUI.aspx?id=" + Eval("Id").ToString() %>'
                                                    runat="server"
                                                    class="btn btn-primary bt"
                                                    visible='<%# Convert.ToInt32(Eval("State")) == 1 && Convert.ToInt32(Eval("FenPei")) == 1%>'>分配
                                                </a>

                                                <asp:Button ID="Look" runat="server" Text="查看人员" class="btn btn-warning bt" OnClick="Look_Click" CommandArgument='<%# Eval("Id") %>'
                                                    Visible='<%# Convert.ToInt32(Eval("State")) == 1 && Convert.ToInt32(Eval("FenPei")) == 2%>' />
                                            </td>
                                        </tr>
                                    </tbody>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </div>
             
            </div>
        </div>
    </form>
</body>
</html>
