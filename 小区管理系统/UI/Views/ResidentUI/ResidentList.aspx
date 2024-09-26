<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="ResidentList.aspx.cs" Inherits="UI.Views.ResidentUI.ResidentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <script src="../../JS/Resident.js"></script>
    <style>
        .tubiao {
            width: 370px;
            height: 135px;
            display: float;
            float: right;
            margin-top: -136px;
        }
        #myModal {
  z-index: 5050 !important; /* 这个值应当高于其他所有模态框的默认z-index值 */
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

    <div>
        <h3 style="margin-top: 108px; margin-bottom: 50px;color:#666666">您现在的位置：基础信息 >>>业主信息</h3>
        <div id="genderPieChart" class="tubiao"></div>
    </div>

    <hr />

    <div class="select ">
        <a href="Res-Signin.aspx" class="btn btn-danger">业主新增</a>
    </div>
    <div style="margin-left: 54%;">
        <span>姓名</span>
        <asp:TextBox ID="selectname" runat="server" class="search-box"></asp:TextBox>
        <span>电话</span>
        <asp:TextBox ID="selectphone" runat="server" class="search-box"></asp:TextBox>

        <span>房产号</span>
        <asp:TextBox ID="selecthousename" runat="server" class="search-box"></asp:TextBox>
        <asp:Button ID="select" runat="server" Text="查询" class="btn btn-success" OnClick="select_Click" />
    </div>
    <div>
        <label style="font-size: 16px">现居人口总数：</label>
        <asp:Label ID="renkou" Style="font-size: 16px" runat="server" Text="Label"></asp:Label>
    </div>
    <div class="Main-panel-content" style="background-color: moccasin">
        <div style="overflow-y: auto; max-height: 450px;">
            <!-- 添加图片模态框 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document" style="max-width: 30%;">
                    <div class="modal-content">

                        <div class="modal-body">
                            <img id="modalImage" src="#" alt="用户或车辆图片" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>

            <!-- 家庭成员模态框（Modal） -->
            <div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">

                            <h4 class="modal-title" id="myModalLabel">家庭成员
                            </h4>
                        </div>
                        <div class="modal-body">
                            <table class="table  table-hover">
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>编号</th>
                                                <th>姓名</th>
                                                <th>照片</th>
                                                <th>业主姓名</th>
                                                <th>关系</th>
                                            </tr>
                                        </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tbody>
                                            <tr>
                                                <td><%# Eval("Id") %></td>
                                                <td><%# Eval("Name1") %></td>
                                                      <td class="text-center bb">
          <asp:Image ID="FamilyPhotoView" runat="server" ImageUrl='<%# Eval("FamilyPhoto") %>' CssClass="clickable-photo" />
      </td>
                                                <td><%# Eval("Name") %></td>
                                                <td><%# Eval("Relation") %></td>
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

              <!-- 模态框（Modal）用户删除警告 -->
  <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
      <div class="modal-dialog a">
          <div class="modal-content b">
              <div class="modal-header">

                  <h4 class="modal-title" id="myModalLabel4" style="color: red">警告
                  </h4>
              </div>
              <div class="modal-body">

                  <label style="font-size: 16px">是否确认删除该用户？请谨慎操作。</label>
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
            <%-- 响应式表格table-responsive --%>
            <table class="table  table-hover">
                <asp:Repeater ID="ResidentListTable" runat="server">
                    <HeaderTemplate>
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>姓名</th>
                                <th>用户性别</th>
                                <th>用户头像</th>
                                <th>电话</th>                            
                                <th>房产单元</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tbody>
                            <tr>
                                <td><%# Eval("Id") %></td>
                                <td><%# Eval("Name") %></td>
                                <td><%# (int)Eval("Sex") == 1 ? "男" : "女" %></td>
                                <td class="text-center bb">
                                    <asp:Image ID="UserPhotoView" runat="server" ImageUrl='<%# Eval("Photo") %>' CssClass="clickable-photo" />
                                </td>
                                <td><%# Eval("Phone") %></td>
                                <td><%# Eval("HouseName") %></td>

                                <td class="text-center" style="width: 15%">
                                    <a href="../DomesticConsumer/Amend.aspx?id=<%# Eval("Id") %>" class="btn btn-warning">修改</a>
                                    <asp:Button ID="ResidentDelete_Click" runat="server" Text="删除" Class="btn btn-danger" OnClick="ResidentDelete_Click_Click" CommandArgument='<%# Eval("Id") %>' />
                                    <asp:Button ID="family" runat="server" Text="家庭成员" class="btn btn-success" OnClick="family_Click" CommandArgument='<%# Eval("Id") %>' />
                                </td>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
    <script>
        window.onload = function () {
            var genderData = [
                { name: '男性', value: '<%=ViewState["MaleCount"] %>', itemStyle: { color: '#145B02' } }, // 男性设置为黑色
            { name: '女性', value: '<%=ViewState["FemaleCount"] %>', itemStyle: { color: '#CBB4B4' } } // 女性设置为红色
            ];

            var pieChart = echarts.init(document.getElementById('genderPieChart'));

            var option = {
                tooltip: {
                    trigger: 'item'
                },
                title: {
                    text: '小区男女比例',

                    left: 'right'

                },
                series: [{
                    name: '业主性别分布',
                    type: 'pie',
                    radius: '90%',
                    data: genderData,
                    emphasis: {
                        scale: true, // 开启图形放大（弹跳）效果
                        itemStyle: {
                            shadowBlur: 0,
                            shadowOffsetX: 1,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    },

                }]
            };

            pieChart.setOption(option);
        };
    </script>
</asp:Content>
