<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="NoticeUI.aspx.cs" Inherits="UI.Views.Notice.NoticeUI1" %>

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
            height:400px;
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
                <asp:TextBox ID="Headline1" runat="server" class="form-control readonly-textbox"></asp:TextBox>
          
                </div> 
                <div class="form-group">
              
       <label>群体</label>
       <asp:DropDownList ID="DropDownList1" runat="server" CssClass="zhuangtai form-control" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
           <asp:ListItem Text="全部人员" Value="全部人员"></asp:ListItem>
           <asp:ListItem Text="全体业主" Value="全体业主"></asp:ListItem>
           <asp:ListItem Text="全体工作人员" Value="全体工作人员"></asp:ListItem>



       </asp:DropDownList>


 
                        </div> 
            <div class="form-group">
                <label for="username">发件人</label>
          
                <asp:Label ID="Label1" runat="server" Text="系统管理员"  class="form-control"></asp:Label>
                </div>
          
            <div class="form-group">
             
                  <textarea id="TextArea1" class="textAreaAutoSize" runat="server" cols="56" rows="10"></textarea>
            </div>                                                               
                                 <div class="form-group fd">
    <asp:Button ID="Uploading" runat="server" Text="提交" class="  btn btn-danger tijiao "  OnClick="Uploading_Click"/>
</div>
        </div>
       
        <div class="col-md-4"    >
            <div class="form-group">
                <label class="control-label">图片</label>
                <asp:FileUpload ID="NoticePhoto" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <label class="control-label">上传</label>
                <asp:Button ID="PhotoUpload" class="btn btn-success" runat="server" Text="上传" OnClick="PhotoUpload_Click"/>
            </div>
            <div class="form-group wew">
                
                <asp:Image ID="NoticePhotoView" runat="server"  />
            </div>
        </div>


    </div>
             
</div>
           
</div>

</asp:Content>
