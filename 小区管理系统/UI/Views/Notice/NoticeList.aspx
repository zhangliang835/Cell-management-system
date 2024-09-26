<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="NoticeList.aspx.cs" Inherits="UI.Views.Notice.NoticeLiset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <script src="../../JS/Resident.js"></script>
    <style>
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
      <h3 style="margin-top:108px;margin-bottom:50px">您现在的位置：公告通知 >>> 公告记录</h3>
  <hr />
    <!-- 添加图片模态框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document"  style="max-width: 30%;">
            <div class="modal-content">
                <div class="modal-header">
                 
                </div>
                <div class="modal-body">
                    <img id="modalImage" src="#" alt="用户或车辆图片" class="img-fluid">
                </div>
            </div>
        </div>
    </div>
                  <!-- 模态框（Modal）公告删除警告 -->
  <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
      <div class="modal-dialog a">
          <div class="modal-content b">
              <div class="modal-header">

                  <h4 class="modal-title" id="myModalLabel4" style="color: red">提示
                  </h4>
              </div>
              <div class="modal-body">

                  <label style="font-size: 16px">是否确认删除该公告？</label>
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
                <!-- 模态框（Modal） 公告删除成功提示-->
<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
    <div class="modal-dialog a"">
        <div class="modal-content b" ">
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
       <div class="Main-panel-content" style="background-color: moccasin">
       <div style="overflow-y: auto; max-height: 450px;">
      <div class="table-responsive">
    <table class="table table-hover">
        <asp:Repeater ID="NoticeViewList" runat="server">
            <HeaderTemplate>
                <thead>
                    <tr>
                        <th>编号</th>
                        <th>标题</th>
                        <th>内容</th>
                        <th>图片</th>
                        <th>发布时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tbody>
                    <tr>
                        <td><%# Eval("Id")%></td>
                        <td>
                            <%# Eval("Title").ToString().Length > 5 ? Eval("Title").ToString().Substring(0, 5) + "..." : Eval("Title") %>
                        </td>
                        <td>
                            <%# Eval("Content").ToString().Length > 5 ? Eval("Content").ToString().Substring(0, 5) + "..." : Eval("Content") %>
                        </td>
                        <td>
                            <asp:Image ID="PhtotView" runat="server" ImageUrl='<%# Eval("Photo")%>' CssClass="clickable-photo" />
                        </td>
                        <td><%# Eval("PublishTime")%></td>
                        <td style="width:15%">
                            <a href="../Notice/NoticeUI.aspx?id=<%# Eval("Id")%>" class="btn btn-warning">修改</a>
                            <a href="NoticeLooK.aspx?id=<%# Eval("Id")%>" class="btn btn-success">查看</a>
                            <asp:Button ID="ResidentDelete_Click" runat="server" Text="删除"
                                class="btn btn-danger" OnClick="ResidentDelete_Click_Click" CommandArgument='<%# Eval("Id")%>' />
                        </td>
                    </tr>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>

    </table>
            </div>
            </div>
            </div>
</asp:Content>
