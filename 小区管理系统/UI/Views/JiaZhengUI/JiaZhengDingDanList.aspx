<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="JiaZhengDingDanList.aspx.cs" Inherits="UI.Views.JiaZhengUI.JiaZhengDingDanList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <script src="../../JS/Resident.js"></script>
    <style>
        .zhuangtai {
            width: 10%;
        }

        #myModal {
            z-index: 5050 !important; /* 这个值应当高于其他所有模态框的默认z-index值 */
        }
        /* 在你的CSS文件中加入这个规则 */
.red-star {
    color: red !important;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：家政服务</h3>
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
                    <img id="modalImage" src="#" alt="用户或车辆图片" class="img-fluid" />
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
    <!-- 查看服务打分模态框 -->
    <div class="modal fade" id="gradeAndEstimateModal" tabindex="-1" role="dialog" aria-labelledby="gradeAndEstimateModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="display: flex; /* 对于bootstrap 4+，确保对话框容器启用flex布局 */
   align-items: center; /* 垂直居中 */
   justify-content: center; /* 水平居中 */
   margin-top: 55px;">
            <div class="modal-content" style="width: 42% !important; max-width: 800px !important;">
                <div class="modal-header">
                    <h4 class="modal-title" id="gradeAndEstimateModalLabel">服务打分</h4>
                </div>
                <div class="modal-body">
                    <!-- 这里将显示服务打分 -->
                    <div id="gradeModalContent"></div>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                        关闭
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="Main-panel-content" style="background-color: moccasin">
        <div style="overflow-y: auto; max-height: 450px;">
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
                                <th>服务评分</th>

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
    Eval("State").ToString() == "1" ? "color:red;": Eval("State").ToString() == "3" ? "color:black;" : 
    Eval("State").ToString() == "0" ? "color:black;" : 
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
                                <%--       <td><%# 
                                                    Eval("Grade").ToString() == "1" ? "<i class='fa-solid fa-star'></i>" : 
                                                    Eval("Grade").ToString() == "2" ? "<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i>" : 
                                                    Eval("Grade").ToString() == "3" ? "<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i>" : 
                                                    Eval("Grade").ToString() == "4" ? "<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i>" : 
                                                    Eval("Grade").ToString() == "5" ? "<i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i>" : ""
                                                %></td>--%>
                             <td onclick='showGradeModal(<%# Eval("Grade") %>, "<%# EncodeForJavaScript(Eval("Estimate").ToString()) %>");' style="cursor: pointer; color: red;">
    <%# GetStarsHtml(Eval("Grade")) %>
</td>
                                <td class="text-center" style="width: 7%">
                                    <a href='<%# "~/Views/staff/StaffList2.aspx?id=" + Eval("Id").ToString() %>'
                                        runat="server"
                                        class="btn btn-primary bt"
                                        visible='<%# Convert.ToInt32(Eval("State")) == 1 && Convert.ToInt32(Eval("FenPei")) == 1%>'>分配人员
                                    </a>
                                    <asp:Button ID="Look" runat="server" Text="查看人员" class="btn btn-warning bt" OnClick="Look_Click" CommandArgument='<%# Eval("Id") %>'
                                        Visible='<%# Convert.ToInt32(Eval("State")) == 1 && Convert.ToInt32(Eval("FenPei")) == 2 || Convert.ToInt32(Eval("State"))==0%>' />
                                    <%--  <asp:Button ID="WanCheng" runat="server" Text="订单完成" class="btn btn-warning bt" CommandArgument='<%# Eval("Id") %>'
                                        Visible='<%# Convert.ToInt32(Eval("State")) == 1 && Convert.ToInt32(Eval("FenPei")) == 2%>' />--%>
                                </td>
                            </tr>
                        </tbody>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
    <script>
        //初始化
        var ops = {
            language: 'zh-CN', //语言
            autoclose: true, //选择后自动关闭
            clearBtn: true,//清除按钮
            format: "yyyy-mm-dd",//日期格式
            startDate: "2020-06-10", //开始时间，在这时间之前都不可选
        };

        $("#inputDate1").datepicker(ops);
        $("#inputDate2").datepicker(ops);

        //第一个输入选中日期后设置第二给输入框的开始日期
        $("#inputDate1").datepicker().on("changeDate", function (e) {
            $("#inputDate2").datepicker('setStartDate', e.date);
        });
        $("#inputDate2").datepicker().on("changeDate", function (e) {
            $("#inputDate1").datepicker('setEndDate', e.date);
        });

    </script>
    <script>
        function showGradeModal(grade, estimate) {
            // 根据评分生成星形图标的HTML
            var starsHtml = getStarsHtml(grade);
            // 设置模态框中的HTML内容
            var modalContentHtml = starsHtml + '<br>' + estimate; // 将评分和评价内容拼接起来
            document.getElementById('gradeModalContent').innerHTML = modalContentHtml;
            // 显示模态框
            $('#gradeAndEstimateModal').modal('show');
        }

        // 此函数用于把评分数字转换为星星的HTML
        // 需要跟后台方法GetStarsHtml生成的HTML一样
        function getStarsHtml(grade) {
            var stars = '';
            for (var i = 0; i < grade; i++) {
                stars += "<i class='fa-solid fa-star'></i>";
            }
            return stars;
        }
    </script>
</asp:Content>
