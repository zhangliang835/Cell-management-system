<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="ShangMenList.aspx.cs" Inherits="UI.Views.ShangmenfuwuUI.ShangMenList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/ResidentList.css" />
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/TimeXuanZe.css"/>
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
        /* 星星的样式 */
        .rating-stars ul {
            list-style-type: none;
            padding: 0;
            -moz-user-select: none;
            -webkit-user-select: none;
        }

        .rating-stars ul > li.star {
            display: inline-block;
            cursor: pointer;
        }

        /* 实体星星的样式 */
        li.star.selected > i.fa {
            color: #FF912C; /* 实体星星的颜色 */
        }

        /* 空心星星的样式 */
        li.star > i.fa {
            font-size: 2.5em; /* 星星的大小 */
            color: #ccc; /* 空心星星的颜色 */
        }
        .wancheng{
            background-color:dimgrey;
            color:white;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：上门服务 >>> 服务记录</h3>
    <hr />
              <!-- 模态框（Modal）退订警告 -->
  <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
      <div class="modal-dialog a">
          <div class="modal-content b">
              <div class="modal-header">

                  <h4 class="modal-title" id="myModalLabel4" style="color: red">提示
                  </h4>
              </div>
              <div class="modal-body">

                  <label style="font-size: 16px">是否确认取消该订单？</label>
              </div>
              <div class="modal-footer">
                  <asp:Button ID="qvxiao" class="btn btn-danger" runat="server" Text="确认" OnClick="qvxiao_Click" />
                  <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                      取消
                  </button>
              </div>
          </div>
      </div>
  </div>
                     <!-- 模态框（Modal） 退订成功提示-->
     <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
         <div class="modal-dialog a" >
             <div class="modal-content b">
                 <div class="modal-header">
                     <h4 class="modal-title" id="myModalLabel6">通知
                     </h4>
                 </div>
                 <div class="modal-body">
                     <label style="font-size: 16px">您好，您在上门一小时前取消服务，支付金额按支付通道原路转回，请注意查收！</label>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                         确认
                     </button>
                 </div>
             </div>

         </div>
     </div>              
    <!-- 模态框（Modal） 退订成功提示-->
     <div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabe7" aria-hidden="true">
         <div class="modal-dialog a" >
             <div class="modal-content b">
                 <div class="modal-header">
                     <h4 class="modal-title" id="myModalLabel7">通知
                     </h4>
                 </div>
                 <div class="modal-body">
                     <label style="font-size: 16px">您好，您在上门一小时内取消服务，将收取支付金额的30%最多30元，剩余支付金额按支付通道原路转回，请注意查收!</label>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                         确认
                     </button>
                 </div>
             </div>

         </div>
     </div>  
        <!-- 模态框（Modal） 评价成功提示-->
     <div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabe8" aria-hidden="true">
         <div class="modal-dialog a" >
             <div class="modal-content b">
                 <div class="modal-header">
                     <h4 class="modal-title" id="myModalLabel8">通知
                     </h4>
                 </div>
                 <div class="modal-body">
                     <label style="font-size: 16px">评价完成！</label>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                         确认
                     </button>
                 </div>
             </div>

         </div>
     </div>  
    <div style="margin-top: 50px;">
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
    <!-- 模态框 -->
    <div id="ratingModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- 模态框内容 -->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">评价服务</h4>


                </div>
                <div class="modal-body">
                    <div class='rating-stars text-center'>
                        <ul id='stars'>
                            <li class='star' title='Poor' data-value='1'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star' title='Fair' data-value='2'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star' title='Good' data-value='3'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star' title='Excellent' data-value='4'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                            <li class='star' title='WOW!!!' data-value='5'>
                                <i class='fa fa-star fa-fw'></i>
                            </li>
                        </ul>
                    </div>


                    <textarea id="commentText" runat="server" class="form-control" placeholder="留下你的评论..."></textarea>
                    <!-- 从 asp:Label 更改为 asp:HiddenField -->
                    <asp:HiddenField ID="ratingValue" runat="server" />

                </div>
                <div class="modal-footer">
                    <asp:Button ID="TiJiao" runat="server" Text="提交" CssClass="btn btn-primary" OnClick="TiJiao_Click" />
                 
                           <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
           取消
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

                                    <asp:Button ID="ResidentDelete_Click" runat="server" Text="退订" Class="btn btn-danger" CommandArgument='<%# Eval("Id") %>'
                                        OnClick="ResidentDelete_Click_Click" Visible='<%# (Convert.ToInt32(Eval("State"))==1) %>' />

                                    <asp:Button ID="button" runat="server" Text="评价" Class="btn btn-primary" CommandArgument='<%# Eval("Id") %>'
                                        Visible='<%# (Convert.ToInt32(Eval("State"))==0) && (Convert.ToInt32(Eval("Grade"))==0)%>' OnClick="button_Click" />

                                 
                             
                                    <asp:Label ID="Label1" runat="server" Text="完成" Class="btn  wancheng"  Visible='<%# (Convert.ToInt32(Eval("State"))==0) && (Convert.ToInt32(Eval("Grade"))!=0)%>'></asp:Label>

                                    <asp:Button ID="button1" runat="server" Text="已退" Class="btn btn-warning" CommandArgument='<%# Eval("Id") %>'
                                        Visible='<%# (Convert.ToInt32(Eval("State"))==3) %>' />



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
      $(document).ready(function () {
          /* 1. 触发评分动作 */
          $('#stars li').on('click', function () {
              var onStar = parseInt($(this).data('value'), 10); // 获取当前点击的星星的数值

              var stars = $(this).parent().children('li.star');
              for (i = 0; i < stars.length; i++) {
                  $(stars[i]).removeClass('selected');
              }

              // 遍历所有的星星
              for (i = 0; i < onStar; i++) {
                  $(stars[i]).addClass('selected');
              }

              // 将分数值赋给隐藏控件
              var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);

            // 注意这里使用了 '<%=ratingValue.ClientID%>' 来获取客户端ID
              $('#<%=ratingValue.ClientID%>').val(ratingValue);
          });
      });
    </script>
</asp:Content>
