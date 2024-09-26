<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YuanGongUI.aspx.cs" Inherits="UI.Views.JiaZhengUI.YuanGongUI" EnableEventValidation="false" %>

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
        tbody td i {
            color:red;
        }



        .geren{
            width:150px;
            margin-left:10px;
            height:200px;
            background-color:saddlebrown;
        }
              .col-md-10{
       
              box-shadow: 0px 4px 11px rgba(0, 0, 0, 0.3);
     
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
                        <span><a href="JiaZheng.aspx">小区订单</a></span>
                    </div>
                    <div class="daohang">
                        <span><a>员工管理</a></span>
                    </div>
                </nav>
                <div class="col-md-1"></div>
                <div class="col-md-10" >
                      <h3 style="margin-top:108px;margin-bottom:50px">您现在的位置：家政服务平台管理员系统 >>> 员工管理</h3>
          
                    <hr />

                                        <div style="margin-top:20px;">
             <span style="display:inline;margin-right:12px;">
         <label>部门</label>
         <asp:DropDownList ID="DropDownList2" runat="server" CssClass="zhuangtai" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
             <asp:ListItem Text="工作部门" Value="工作部门"></asp:ListItem>
             <asp:ListItem Text="维修部" Value="维修部"></asp:ListItem>
             <asp:ListItem Text="保洁部" Value="保洁部"></asp:ListItem>         
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
   <div style="margin-top:28px;">

 <span style="display: inline-block; ">
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
                                                   Eval("Department").ToString() == "2" ? "维修部" : "" 
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
                                                <asp:Button ID="fenpei2" runat="server" Text="已分配" CssClass="btn btn-primary"  Visible='<%# (Convert.ToInt32(Eval("State")) == 1 ) %>' />
                                            </td>

                                                    <td>
                
            <a href="StaffSignin.aspx?id=<%# Eval("Id") %>"" class="btn btn-danger" >修改</a>
                 <asp:Button ID="DeleteButton" runat="server" Text="删除" class="btn btn-primary" CommandArgument='<%# Eval("Id") %>'  />
             </td>



                                        </tr>
                                    </tbody>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </form>
</body>
</html>
