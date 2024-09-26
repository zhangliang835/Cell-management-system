<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="NoticeUI.aspx.cs" Inherits="UI.Views.DomesticConsumer.NoticeUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" type="text/css" href="../../Master.CSS/Signin.css"/>
     <link rel="stylesheet" type="text/css" href="../../Master.CSS/Maintenance.css" />
    <style type="text/css">
              .baoxiu{
            margin-top:108px!important;
            /*background-color:saddlebrown;*/
       
        }
        .textAreaAutoSize {
  width: 100%;
  resize: none;
  font-size:16px;
  
}
        .wew{
            margin-top:0px!important;
        }
        .wew img{
            width:100%;
            height:410px;
        }
        .fd{
            display:flex;
            justify-content:center;
        }
        .tijiao{
            width:200px;
           
        }
        .form-control{
            border:1px solid black;
           
        }
      
        .col-md-4{
        
              box-shadow: 5px 2px 20px 0px rgba(0, 0, 0, 0.3);
                  padding-top:20px;
                  background-color:#EDEEEF;
        }
        .form-group label{
            width:50px!important;
            font-size:16px;
            color:black;
        }
    
           .readonly-textbox:focus {
       outline: none; /* 取消点击聚焦时的轮廓 */
       box-shadow: none; /* 取消点击聚焦时的阴影效果（对于一些浏览器，比如Firefox） */
   }
      
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                   <div class="baoxiu">
           
                 <div class="col-md-10 "  >
    <div class="row">

              <div class="col-md-3"></div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="username">标题</label>
               
                <asp:Label ID="Headline1" runat="server" Text="Label" class="form-control"></asp:Label>
                </div> 
            <div class="form-group">
                <label for="username">发件人</label>
          
                <asp:Label ID="Label1" runat="server" Text="系统管理员"  class="form-control"></asp:Label>
                </div>
          
            <div class="form-group">
             
                  <textarea id="TextArea1" class="textAreaAutoSize" runat="server" cols="56" rows="10" readonly></textarea>
            </div>                                                               
                                 <div class="form-group fd">
    <asp:Button ID="Uploading" runat="server" Text="确认" class="  btn btn-danger tijiao "  OnClick="Uploading_Click"/>
</div>
        </div>
       
        <div class="col-md-4"    >
           
            <div class="form-group wew">
                
                <asp:Image ID="NoticePhotoView" runat="server"  />
            </div>
        </div>


    </div>
             
</div>
           
</div>
</asp:Content>
