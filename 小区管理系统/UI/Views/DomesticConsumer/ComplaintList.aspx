<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="ComplaintList.aspx.cs" Inherits="UI.Views.DomesticConsumer.ComplaintList" %>
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
        <h3 style="margin-top:108px;margin-bottom:50px">您现在的位置：投诉建议 >>> 投诉记录</h3>
 <hr />
              <!-- 添加图片模态框 -->
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
                     <!-- 模态框（Modal） 删除成功提示-->
     <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
         <div class="modal-dialog a">
             <div class="modal-content b">
                 <div class="modal-header">
                     <h4 class="modal-title" id="myModalLabel6">通知
                     </h4>
                 </div>
                 <div class="modal-body">
                     <label style="font-size: 16px">已成功删除该投诉记录！</label>
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
              <table class="table table-hover">
                  <asp:Repeater ID="ComplaintListView" runat="server">
                      <HeaderTemplate>
                          <thead>
                              <tr>
                                <th>编号</th>
      <th>姓名</th>
   
      <th>房产单元</th>
      <th>标题</th>
      <th>内容</th>
      <th>图片</th>
      <th>时间</th>
      <th>处理进度</th>
      <th>操作</th>
                              </tr>
                          </thead>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <tbody>
                              <tr>
                                                           <td><%# Eval("Id")%></td>

                                <td><%# Eval("ResidentName")%></td>
                                <td>
                                    <%# Eval("RoomNumber")%>
                                </td>
                                <td>
                                    <%# Eval("Title")%>
                                </td>
                          
                                <td>
                                    <%# Eval("Content").ToString().Length > 10 ? Eval("Content").ToString().Substring(0, 10) + "..." : Eval("Content") %>
                                </td>
                                <td class="bb">
                                    <asp:Image ID="PhotoView" runat="server" ImageUrl='<%# Eval("Photo") %>' CssClass="clickable-photo" />
                                </td>
                                <td>
                                    <%# Eval("Time")%>
                                </td> 
                        
                              <td style='<%# 
    Eval("State").ToString() == "1" ? "color:black;":
    Eval("State").ToString() == "0" ? "color:red;" : ""

%>'>
                                    <%# 
                                        Eval("State").ToString() == "0"?"未处理":
                                        Eval("State").ToString() == "1"?"已处理":""
                                   
                                    %>
                                </td>
                                  <td style="width: 12%">
                                      <a href="ComplaintUI.aspx?id=<%# Eval("Id")%>" class="btn btn-warning">修改</a>
                                      <asp:Button ID="ResidentDelete_Click" runat="server" Text="删除"
                                          class="btn btn-danger" OnClick="ResidentDelete_Click_Click"  CommandArgument='<%# Eval("Id")%>' />
                                  </td>
                              </tr>
                          </tbody>
                      </ItemTemplate>
                  </asp:Repeater>
              </table>
             </div>
</asp:Content>
