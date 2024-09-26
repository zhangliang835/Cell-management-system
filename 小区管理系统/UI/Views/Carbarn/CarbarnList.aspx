<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="CarbarnList.aspx.cs" Inherits="UI.Views.Carbarn.CarbarnList"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/Car.css" />
    <style>
        .modal-content {
            width: 42% !important;
            max-width: 800px !important;
        }

        .modal-dialog {
            display: flex; /* 对于Bootstrap 4+，确保对话框容器启用Flex布局 */
            align-items: center; /* 垂直居中 */
            justify-content: center; /* 水平居中 */
            margin-top:55px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：基础信息 >>>车库管理</h3>
    <hr />
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">

                    <h4 class="modal-title" id="myModalLabel">车库信息修改
                    </h4>
                </div>
                <div class="modal-body">
                    <label style="font-size: 16px">车库编号</label>
                    <asp:TextBox ID="CarbarnId" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Updatecarbarnname" class="btn btn-primary" runat="server" Text="保存" OnClick="Updatecarbarnname_Click"/>
                    <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                        取消
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="select">

        <span>车库编号</span>
        <asp:TextBox ID="selectCarbarnname" runat="server"></asp:TextBox>
        <span>业主</span>
        <asp:TextBox ID="selectPeople" runat="server"></asp:TextBox>

        <asp:Button ID="select" runat="server" Text="查询" class="btn btn-success" OnClick="select_Click" />
        <div style="margin-left: 50px">
            <asp:TextBox ID="ADDcarbarn" runat="server"></asp:TextBox>
            <asp:Button ID="CarbarnADD" runat="server" Text="车库登记" CssClass="btn btn-primary" OnClick="CarbarnADD_Click" />
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

                        <label style="font-size: 16px">初始化操作将删除该车库的业主信息，请谨慎操作！</label>
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
              <!-- 模态框（Modal） 初始化成功提示-->
      <div class="modal fade" id="myModal9" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
          <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
              <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                  <div class="modal-header">
                      <h4 class="modal-title" id="myModalLabel9">通知
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
              <!-- 模态框（Modal） 重复登记提示-->
  <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabe1" aria-hidden="true">
      <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
          <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
              <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel1" style="color:red">提示
                  </h4>
              </div>
              <div class="modal-body">
                  <label style="font-size: 16px">无法登记，该车库已被登记在库！</label>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                      确认
                  </button>
              </div>
          </div>

      </div>
  </div>
                  <!-- 模态框（Modal） 修改时重复登记提示-->
  <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabe3" aria-hidden="true">
      <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
          <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
              <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel3" style="color:red">提示
                  </h4>
              </div>
              <div class="modal-body">
                  <label style="font-size: 16px">无法修改，车库编号不能修改为已登记过的编号！</label>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                      确认
                  </button>
              </div>
          </div>

      </div>
  </div>
          <!-- 模态框（Modal） 删除时，使用中，删除失败提示-->
      <div class="modal fade" id="myModal12" tabindex="-1" role="dialog" aria-labelledby="myModalLabel12" aria-hidden="true">
          <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
              <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                  <div class="modal-header">
                      <h4 class="modal-title" id="myModalLabel12" >通知
                      </h4>
                  </div>
                  <div class="modal-body">
                      <label style="font-size: 16px">该车库正在使用中，无法删除</label>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                          确认
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

                       <label style="font-size: 16px">是否确认删除该车库信息？</label>
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
                <!-- 模态框（Modal） 修改成功提示-->
        <div class="modal fade" id="myModal11" tabindex="-1" role="dialog" aria-labelledby="myModalLabe11" aria-hidden="true">
            <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
                <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel11">通知
                        </h4>
                    </div>
                    <div class="modal-body">
                        <label style="font-size: 16px">已成功修改车库信息！</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                            确认
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
                       <label style="font-size: 16px">请输入数据！</label>
                   </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                           确认
                       </button>
                   </div>
               </div>

           </div>
       </div> 
                   <!-- 模态框（Modal） 请输入数据提示-->
       <div class="modal fade" id="myModal10" tabindex="-1" role="dialog" aria-labelledby="myModalLabe10" aria-hidden="true">
           <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center; margin-top: 55px;">
               <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                   <div class="modal-header">
                       <h4 class="modal-title" id="myModalLabel10">通知
                       </h4>
                   </div>
                   <div class="modal-body">
                       <label style="font-size: 16px">已成功登记！</label>
                   </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                           确认
                       </button>
                   </div>
               </div>

           </div>
       </div> 

    <div class="Main-panel-content">
        <div style="overflow-y: auto; max-height: 440px;">
            <table class="table table-hover">
                <asp:Repeater ID="CarbarnListUI" runat="server">
                    <HeaderTemplate>
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>车库编号</th>
                                <th>业主名称</th>
                                <th>联系电话</th>
                                <th>租用与购买</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%# Eval("Id")%></td>
                                <td><%# Eval("CarbarnName")%></td>

                                <td><%# Eval("ResidentName")%></td>
                                <td><%# Eval("Phone")%></td>

                                <td>
                                    <%# 
                                        Eval("State").ToString() == "1" ? "购买" : 
                                        Eval("State").ToString() == "2" ? "租用" : 
                                        Eval("State").ToString() == "0" ? "空置" : ""

                                    %>

                                </td>

                                <td style="width: 14%">

                                    <asp:Button ID="UpdateCarbarn" runat="server" Text="修改" class="btn btn-warning" CommandArgument='<%# Eval("Id") %>' OnClick="UpdateCarbarn_Click" />
                                    <asp:Button ID="CarbarnDelete_Click" runat="server" Text="删除" CommandArgument='<%# Eval("Id") %>'
                                        class="btn btn-danger" OnClick="CarbarnDelete_Click_Click" />
                                    <asp:Button ID="CarbarnUpdate_Click" runat="server" Text="初始化" CommandArgument='<%# Eval("Id") %>'
                                        class="btn btn-danger" OnClick="CarbarnUpdate_Click_Click" />
                                </td>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
</asp:Content>
