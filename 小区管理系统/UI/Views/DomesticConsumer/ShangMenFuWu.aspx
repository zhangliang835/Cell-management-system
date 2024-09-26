<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="ShangMenFuWu.aspx.cs" Inherits="UI.Views.DomesticConsumer.ShangMenFuWu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .daobo {
            background-color: white;
            width: 100%;
            height: auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(174px, 1fr)); /* 自动换行并设定每列最小宽度 */
            grid-auto-rows: 46px;
            grid-gap: 10px; /* 子元素之间的间距 */
            padding-bottom: 20px;
            padding-top: 20px;
        }

        .anniu a i {
            font-size: 18px;
            color: palevioletred;
        }

        .anniu {
            /*      background-color: dimgrey;*/
            display: flex;
            align-items: center;
            justify-content: center;
            /*   color: white;*/
            box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }

            .anniu:hover {
                box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
                background-color: mistyrose;
                color: black;
            }

        .daobo .anniu:last-child {
            margin-right: 0;
        }

        .anniu:hover {
            box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        a {
            color: black;
        }

            a:hover {
                color: red;
            }

        .qvfen {
            width: 100%;
            height: 100px;
           
            font-size: 52px;
            line-height: 100px;
            text-align: center;
            font-family: '宋体';
            background-color:white;
        }
        .QVFEN{
             margin-top: 20px;
              box-shadow: 1px 1px 11px rgba(0, 0, 0, 0.5);
              padding:20px;
              background-color:white;
        }
        th,td{
            text-align:center;
        }
        .chenman{
            width:44%;
            height:100px;
          box-shadow: 1px 1px 11px rgba(0, 0, 0, 0.5);
            
            margin-bottom:20px;
        }
        .chenman img{
            height:100px;
        }
        .chenman:hover{
            background-color:gainsboro;
        }
        .chenman i{
            font-size:20px;
            color:red;
        }
        .CHENMAN{
              width: 100%;
  height: auto;
  display: flex;
  justify-content:space-between;
  flex-wrap: wrap;
  padding-left:100px;
  padding-right:100px;
        }
        .carousel-item {
            background-color:gray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div style="overflow-y: auto; max-height: 93vh;">
        <div class="daobo">
     <div class="anniu" id="baojieqingxi">
         <a href="../DomesticConsumer/ShangMenFuWu.aspx"><i class="fa-solid fa-brush"></i>&nbsp;&nbsp;上门首页</a>
     </div>
     <div class="anniu">
         <a href="../ShangmenfuwuUI/ShenDu.aspx"><i class="fa-solid fa-droplet"></i>&nbsp;&nbsp;深度清洁</a>
     </div>
     <div class="anniu">
         <a href="../ShangmenfuwuUI/RiChang.aspx"><i class="fa-solid fa-hand-sparkles"></i>&nbsp;&nbsp;日常清洁</a>
     </div>
     <div class="anniu">
         <a><i class="fa-solid fa-shirt"></i>&nbsp;&nbsp;专项清洗</a>
     </div>
     <div class="anniu">
         <a href="../ShangmenfuwuUI/QuanWu.aspx"><i class="fa-solid fa-trash-can"></i>&nbsp;&nbsp;全屋大扫除</a>
     </div>
     <div class="anniu">
         <a href="../ShangmenfuwuUI/YouYanJi.aspx"><i class="fa-solid fa-house-chimney"></i>&nbsp;&nbsp;油烟机清洗</a>
     </div>
     <div class="anniu">
         <a href="../ShangmenfuwuUI/BingXiang.aspx"><i class="fa-solid fa-icicles"></i>&nbsp;&nbsp;冰箱清洗</a>
     </div>
     <div class="anniu">
         <a href="../ShangmenfuwuUI/GuanDao.aspx"><i class="fa-solid fa-timeline"></i>&nbsp;&nbsp;管道疏通</a>
     </div>
     <div class="anniu">
         <a href="../ShangmenfuwuUI/WeiXiuList.aspx"><i class="fa-solid fa-hammer"></i>&nbsp;&nbsp;维修服务</a>
     </div>

 </div>



 <!-- 轮播 -->
 <div id="demo" class="carousel slide" data-bs-ride="carousel">
     <!-- 指示符 -->
     <div class="carousel-indicators">
         <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
         <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
         <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
     </div>

     <!-- 轮播图片 -->
     <div class="carousel-inner">
         <div class="carousel-item active">
             <img src="../Image/fnagjianzhengjie.jpg" class="d-block" style="width: 100%; height: 550px;" />             
         </div>
         <div class="carousel-item">
             <img src="../Image/fangjian2.jpg@2o.jpg" class="d-block" style="width: 100%; height: 550px;" />
         </div>
         <div class="carousel-item">
             <img src="../Image/chufang.jpg" class="d-block" style="width: 100%; height: 550px;" />
         </div>
     </div>

     <!-- 左右切换按钮 -->
     <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
         <span class="carousel-control-prev-icon"></span>
     </button>
     <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
         <span class="carousel-control-next-icon"></span>
     </button>
 </div>
<div class="QVFEN">
     <div class="qvfen">
     <span>三大保洁服务的区别？</span>
 </div>
 <table class="table table-bordered table-hover">
     <thead>
         <tr>
             <th>服务项目</th>
             <th>日常保洁</th>
             <th>深度保洁</th>
             <th>全屋大扫除</th>
         </tr>

     </thead>
     <tbody>
         <tr>
             <td>服务人员</td>
             <td>专业保洁师</td>
             <td>精选保洁师</td>
             <td>精选保洁师</td>
         </tr>
         <tr>
             <td>表面除尘</td>
             <td><i class="fa-solid fa-check"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
         </tr>
         <tr>
             <td>物品整理</td>
             <td><i class="fa-solid fa-check"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
         </tr>
         <tr>
             <td>除重油污</td>
             <td><i class="fa-solid fa-xmark"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
         </tr>
         <tr>
             <td>除重水垢</td>
             <td><i class="fa-solid fa-xmark"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
         </tr>
         <tr>
             <td>橱柜内部清洁</td>
             <td><i class="fa-solid fa-xmark"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
         </tr>
         <tr>
             <td>内饰玻璃</td>
             <td><i class="fa-solid fa-xmark"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
         </tr>
         <tr>
             <td>双面精细擦拭</td>
             <td><i class="fa-solid fa-xmark"></i></td>
             <td><i class="fa-solid fa-xmark"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
         </tr>
         <tr>
             <td>高温蒸洗消毒</td>
             <td><i class="fa-solid fa-xmark"></i></td>
             <td><i class="fa-solid fa-xmark"></i></td>
             <td><i class="fa-solid fa-check"></i></td>
         </tr>
     </tbody>
 </table>
</div>
       <div class="QVFEN">
     <div class="qvfen">
     <span>不想与尘螨共处一处？</span>
 </div>
           <hr />
<div class="CHENMAN">
     <div class="chenman">
         <img src="../Image/91yTSEUnGWL._AC_SX679_.jpg" />
         <span style="font-size:25px;margin-left:40px">地毯清洗</span>
         <span style="color:red">崭新的地毯，呵护你的脚</span>
    
 </div>       <div class="chenman">
         <img src="../Image/01542f5e4f95ada801216518e864b1.jpg@1280w_1l_2o_100sh.jpg"/>
         <span style="font-size:25px;margin-left:40px">沙发清洗</span>
         <span style="color:red">极尽吸尘，还你一个崭新的沙发</span>
    
 </div>       <div class="chenman">
         <img src="../Image/chaunglianjpg.jpg" style="width:100px;"/>
         <span style="font-size:25px;margin-left:40px">窗帘清洗</span>
         <span style="color:red">将所有尘螨一网打尽</span>
    
 </div>       <div class="chenman">
         <img src="../Image/91yTSEUnGWL._AC_SX679_.jpg" />
         <span style="font-size:25px;margin-left:40px">家庭除螨</span>
         <span style="color:red">隔绝病原体，睡得更安心</span>
    
 </div>     

</div>
</div>      
       <div class="QVFEN">
     <div class="qvfen">
     <span>家电损坏？及时维修安装</span>
 </div>
           <hr />
<div class="CHENMAN">
     <div class="chenman">
      <a href="../ShangmenfuwuUI/WeiXiuList.aspx">
             <img src="../Image/kongtiao.jpg" style="width:100px;" />
   <span style="font-size:25px;margin-left:40px">空调维修</span>
   <span style="color:red">炎炎夏天、一键空调降温</span>
      </a>
    
 </div>       <div class="chenman">
        <a href="../ShangmenfuwuUI/WeiXiuList.aspx">
         <img src="../Image/bingxiang.jpg" />
         <span style="font-size:25px;margin-left:40px">冰箱维修</span>
         <span style="color:red">食物储藏、冰箱不可少</span>
    </a>
 </div>       <div class="chenman">
      <a href="../ShangmenfuwuUI/WeiXiuList.aspx">
         <img src="../Image/xiyiji.png" />
         <span style="font-size:25px;margin-left:40px">洗衣机维修</span>
         <span style="color:red">洗衣机更节约时间</span>
      </a>
 </div>       <div class="chenman">
     <a href="../ShangmenfuwuUI/WeiXiuList.aspx">
         <img src="../Image/reshuiqi.jpg" />
         <span style="font-size:25px;margin-left:40px">热水器维修</span>
         <span style="color:red">洗个热水澡、睡个舒服觉</span>
      </a>
 </div>     

</div>
</div>
    
   </div>

</asp:Content>
