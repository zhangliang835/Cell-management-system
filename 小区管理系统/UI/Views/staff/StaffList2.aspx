<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="StaffList2.aspx.cs" Inherits="UI.Views.staff.StaffList2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
        <script src="../../JS/Resident.js"></script>
    <style>
        .zhuangtai {
            width: 10%;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：员工管理</h3>

    <hr />
                <!-- 添加模态框 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document" style="width:30%">
                    <div class="modal-content">
                        <div class="modal-header">
                           
                        </div>
                        <div class="modal-body">
                            <img id="modalImage" src="#" alt="用户或车辆图片" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
                  <!-- 模态框（Modal）用户删除警告 -->
  <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
      <div class="modal-dialog a">
          <div class="modal-content b">
              <div class="modal-header">

                  <h4 class="modal-title" id="myModalLabel4" style="color: red">警告
                  </h4>
              </div>
              <div class="modal-body">

                  <label style="font-size: 16px">是否确认删除该员工信息？请谨慎操作。</label>
              </div>
              <div class="modal-footer">
                  <asp:Button ID="shanchu" class="btn btn-danger" runat="server" Text="确认删除" OnClick="shanchu_Click" />
                  <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                      取消
                  </button>
              </div>
          </div>
      </div>
  </div>
                 <!-- 模态框（Modal） 删除成功提示-->
     <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
         <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
             <div class="modal-content b" style="width: 42% !important; max-width: 800px !important;">
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
                <!-- 模态框（Modal） 分配成功提示-->
<div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabe7" aria-hidden="true">
    <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
        <div class="modal-content b" style="width: 42% !important; max-width: 800px !important;">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel7">通知
                </h4>
            </div>
            <div class="modal-body">
                <label style="font-size: 16px">已成功分配！</label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                    确认
                </button>
            </div>
        </div>

    </div>
</div>
                    <!-- 模态框（Modal） 分配失败提示-->
<div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabe8" aria-hidden="true">
    <div class="modal-dialog a" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
        <div class="modal-content b" style="width: 42% !important; max-width: 800px !important;">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel8">通知
                </h4>
            </div>
            <div class="modal-body">
                <label style="font-size: 16px">请先前往家政服务界面进行任务分配！</label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                    确认
                </button>
            </div>
        </div>

    </div>
</div>
    <div class="select ">
    <a href="StaffSignin.aspx" class="btn btn-danger">员工登记</a>
</div>
    <div style="margin-top: 20px;">
        <span style="display: inline; margin-right: 12px;">
            <label>部门</label>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="zhuangtai" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                <asp:ListItem Text="工作部门" Value="工作部门"></asp:ListItem>
                <asp:ListItem Text="维修部" Value="维修部"></asp:ListItem>
                <asp:ListItem Text="保洁部" Value="保洁部"></asp:ListItem>
                <asp:ListItem Text="安保部" Value="安保部"></asp:ListItem>
                <asp:ListItem Text="绿化部" Value="绿化部"></asp:ListItem>
            </asp:DropDownList>


        </span>
        <span>
            <label>状态</label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="zhuangtai" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Text="在职状态" Value="在职状态"></asp:ListItem>
                <asp:ListItem Text="家政接单" Value="家政接单"></asp:ListItem>
                <asp:ListItem Text="在职" Value="在职"></asp:ListItem>
                <asp:ListItem Text="请假" Value="请假"></asp:ListItem>
            </asp:DropDownList>


        </span>

    </div>
    <div style="margin-top: 28px;">

        <span style="display: inline-block;">
            <label>工号</label>
            <asp:TextBox ID="JobNumber" runat="server"></asp:TextBox>
        </span>
        <span style="display: inline-block; margin-left: 1%;">
            <label>姓名</label>
            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
        </span>
        <asp:Button ID="select" runat="server" Text="查询" CssClass="btn btn-success" OnClick="select_Click" />


    </div>
    <div class="Main-panel-content" style="background-color: moccasin">
        <table class="table  table-hover">
            <asp:Repeater ID="ShangMenStaffTableList" runat="server">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>编号</th>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>联系电话</th>
                            <th>照片</th>
                            <th>部门</th>
                            <th>工作状态</th>
                            <%--  <th>服务等级</th>--%>
                            <th>接单号</th>
                            <th>接单时间</th>
                            <th>家政订单分配</th>
                            <th>信息操作</th>
                        </tr>
                    </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tbody>
                        <tr>

                            <td><%# Eval("Id") %></td>
                            <td><%# Eval("JobNumber") %></td>
                            <td><%# Eval("Name") %></td>
                            <td>
                                <%# 
                                                    Eval("Sex").ToString()=="1"?"男":
                                                    Eval("Sex").ToString()=="0"?"女":""
                                %>
                            </td>
                            <td><%# Eval("Age") %></td>
                            <td><%# Eval("Phone") %></td>

                            <td class="text-center bb">
                                <asp:Image ID="PhotoView" runat="server" ImageUrl='<%# Eval("Photo") %>' CssClass="clickable-photo" />
                            </td>
                            <td>
                                <%# 
                                                   Eval("Department").ToString() == "1" ? "保洁部" :
                                                   Eval("Department").ToString() == "2" ? "维修部" : 
                                                   Eval("Department").ToString() == "3" ? "安保部" : 
                                                   Eval("Department").ToString() == "4" ? "绿化部" : "" 
                                %>
                            </td>
                            <td>
                                <%# 
                                                    Eval("State").ToString()=="1"?"家政接单":
                                                    Eval("State").ToString()=="2"?"在职":
                                                    Eval("State").ToString()=="3"?"请假/休假":""
                                %>
                            </td>
                            <%--      <td><%# 
                                                    Eval("Grade").ToString() == "1" ? "<i class='fa-solid fa-star'></i>" : 
                                                    Eval("Grade").ToString() == "2" ? "<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i>" : 
                                                    Eval("Grade").ToString() == "3" ? "<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i>" : 
                                                    Eval("Grade").ToString() == "4" ? "<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i>" : 
                                                    Eval("Grade").ToString() == "5" ? "<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i>" : ""
                                                %></td>--%>

                            <td><%# Eval("DingdanNumber") %></td>
                            <td><%# Eval("ChuQianTime") %></td>
                            <td>
                                <asp:Button ID="fenpei" runat="server" Text="未分配" CssClass="btn btn-warning" Visible='<%# (Convert.ToInt32(Eval("State")) == 2 ) %>' OnClick="fenpei_Click" CommandArgument='<%# Eval("Id") %>' />
                                <asp:Button ID="fenpei2" runat="server" Text="已分配" CssClass="btn btn-primary" Visible='<%# (Convert.ToInt32(Eval("State")) == 1 ) %>' />
                            </td>

                            <td>

                                <a href="StaffSignin.aspx?id=<%# Eval("Id") %>" class="btn btn-primary">修改</a>
                                <asp:Button ID="DeleteButton" runat="server" Text="删除" class="btn btn-danger" CommandArgument='<%# Eval("Id") %>' OnClick="DeleteButton_Click" />
                            </td>



                        </tr>
                    </tbody>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</asp:Content>
