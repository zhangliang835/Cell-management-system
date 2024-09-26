<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Staff.Master" AutoEventWireup="true" CodeBehind="GeRenZhongXin.aspx.cs" Inherits="UI.Views.StaffXiTong.GeRenZhongXin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .circle-image1 {
            width: 100% !important;
            border-radius: 5%;
            overflow: hidden;
        }

        .circle-image12 {
            width: 100% !important;
              height: 270px !important;

            overflow: hidden;
        }

        body {
            background-color: saddlebrown !important;
        }


        .rili {
            height: 50px;
            width: 300px;
            background-color: rgba(0,102,2,0.6);
            color: white;
        }

        .rili2 {
            height: 200px;
            width: 300px;
            background-color: rgba(0,102,2,0.12);
        }

        .xinxi {
            box-shadow: 0px 0px 7px 3px rgba(0, 0, 0, 0.5);
            width: 80%;
            height: 700px;
            margin-bottom: 20px;
            margin-left:30px;
        }

        .row {
        }

        label {
            /*  color:gray;*/
            font-size: 25px;
            font-family: '宋体';
        }

        .lableziti {
            color: black;
            font-size: 25px;
            font-family: '宋体';
            color:black;
        }
        .lableziti2{
              color: black;
  font-size: 35px;
  font-family: '宋体';
  font-weight:800;
        }
        .zhaopian {
            /*  display:flex;
            justify-content:center;*/
        }

        .form-group1 {
            margin-bottom: 9px;
        }

        .btn {
            width: 30%;
                box-shadow: 0px 0px 5px 1px rgba(0, 0, 0, 0.5);
        }

        .col-md-12 {
            display: flex;
            justify-content: center;
        }

        .container-fluid1 {
            /* background-color:saddlebrown;*/
            height: 93vh;
        }

        hr {
            margin-top: 10px !important;
        }
        .hezi{
            width:45%;
            height:100px;
           background: linear-gradient(to top, #D0D6DD 10%, white 50%); 
              display:flex;
              justify-content:center;
              align-items:center;
        }
        .ADHEZI{
            display:flex;
            justify-content:space-between;
            margin-top:60px;
        }
        a{
            color:black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid1" style="overflow-y: auto; max-height: 93vh; overflow-x: hidden;">
        <div class="row">
            <hr />
            <div class="col-md-1"></div>
            <div class="col-md-3" style="background-color:white">

                <div class="xinxi">
                    <div class="form-group zhaopian">
                        <asp:Image ID="UserPhoto2" runat="server" CssClass="circle-image12" />
                    </div>


                       <div class="form-group1">
       <label for="username" class="form-label inline-block">姓名:</label>
       <asp:Label ID="name" runat="server" CssClass="lableziti"></asp:Label>
   </div>

                    <div class="form-group1">
                        <label for="userhouse" class="form-label inline-block">工号:</label>
                        <asp:Label ID="number" runat="server" CssClass="lableziti"></asp:Label>
                    </div>  
                    <div class="form-group1">
                        <label for="userhouse" class="form-label inline-block">部门:</label>
                        <asp:Label ID="bumen" runat="server" CssClass="lableziti"></asp:Label>
                    </div>    
                    <div class="form-group1">
                        <label for="userhouse" class="form-label inline-block">工作状态:</label>
                        <asp:Label ID="jiedan" runat="server" CssClass="lableziti"></asp:Label>
                    </div>

                </div>

            </div>
            <div class="col-md-6" style="background-color: white">
                   <div class="form-group1">

        <asp:Label ID="UserName" runat="server" CssClass="lableziti2 "></asp:Label>
    </div>
                <div class="form-group1">
                    <label for="usersex" class="form-label inline-block">性别:</label>
                    <asp:Label ID="usersex" runat="server" CssClass="lableziti"></asp:Label>
                </div>
                <div class="form-group1">
                    <label for="userphone" class="form-label inline-block">联系电话:</label>
                    <asp:Label ID="userphone" runat="server" CssClass="lableziti"></asp:Label>
                </div>


                <div class="form-group1">
                    <label for="userhouse" class="form-label inline-block">年龄:</label>
                    <asp:Label ID="age" runat="server" CssClass="lableziti"></asp:Label>
                </div>
            
                <div class="form-group1">
                    <asp:Button ID="bianji" runat="server" Text="编辑" CssClass="btn btn-success" OnClick="bianji_Click" />

                </div>
                <hr />
             <div class="ADHEZI">
                    <div class="hezi">
       <label><a href="JiaZhengNumber.aspx">查看订单</a></label>
   </div>   <div class="hezi">
       <label><a href="QingJia.aspx">快速请假</a></label>
   </div>
             </div>      <div class="ADHEZI">
                    <div class="hezi">
       <label><a href="NoticeStaffList.aspx">查看公告</a></label>
   </div>   <div class="hezi">
       <label><a href="JiaZhengNumberList.aspx">接单记录</a></label>
   </div>
             </div>
            </div>
                </div>








</div>
            <%--        <div class="col-md-3">
                <div class="rili">
                    <label style="display: block; text-align: center; font-size: 25px; line-height: 50px">当前时间</label>
                </div>
                <div class="rili2">
                    <h4 id="currentTime" style="display: block; text-align: center; padding-top: 40px">
                        <span id="currentTimePart"></span>
                        <br>
                        <span id="currentDate"></span>
                    </h4>
                </div>
            </div>
    

    <%-- 钟表 --%>
    <script>
        function updateTime() {
            const now = new Date();
            const currentDateElement = document.getElementById('currentDate');
            const currentTimePartElement = document.getElementById('currentTimePart');

            currentDateElement.textContent = now.toLocaleDateString('zh-CN', { year: 'numeric', month: 'long', day: 'numeric' });
            currentTimePartElement.textContent = now.toLocaleTimeString('zh-CN', { hour12: false });


        }

        setInterval(updateTime, 1000); // 每隔1000毫秒（1秒）调用updateTime函数
        updateTime(); // 页面加载时立即更新一次时间
    </script>
</asp:Content>
