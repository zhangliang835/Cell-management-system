<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="Maintenance.aspx.cs" Inherits="UI.Views.DomesticConsumer.Maintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/Maintenance.css" />
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/Signin.css"/>
    <style type="text/css">
        .baoxiu{
            margin-top:108px!important;
            /*background-color:saddlebrown;*/
       
        }
        .textAreaAutoSize {
  width: 100%;
  resize: none;
}
        .wew{
            margin-top:-20px!important;
        }
        .wew img{
            width:100%;
            height:246px;
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
             box-shadow: -1px 0px 7px 0px rgba(0, 0, 0, 0.3);
                  padding-top:20px;
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
                <label for="username">报修人</label>
       
                <asp:Label ID="UserName1" runat="server" Text="Label"  class="form-control"></asp:Label>
                </div>
            <div class="form-group ">
                <label for="RoomNumber">房产号</label>
               
                   <asp:Label ID="RoomNumber1" runat="server" Text="Label"  class="form-control"></asp:Label>
            </div>
            <div class="form-group">
             
                  <textarea id="TextArea1" class="textAreaAutoSize" runat="server" cols="56" rows="10"></textarea>
            </div>                                                               
                                 <div class="form-group fd">
    <asp:Button ID="SubmitButton" runat="server" Text="提交" class="  btn btn-danger tijiao " OnClick="SubmitButton_Click" />
</div>
        </div>
       
        <div class="col-md-4"    >
            <div class="form-group">
                <label class="control-label">损坏图片</label>
                <asp:FileUpload ID="PhotoBefore" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <label class="control-label">图片上传</label>
                <asp:Button ID="PhotoBeforeUpload" class="btn btn-success" runat="server" Text="上传" OnClick="PhotoBeforeUpload_Click"/>
            </div>
            <div class="form-group wew">
                
                <asp:Image ID="PhotoBeforeView" runat="server"  />
            </div>
        </div>


    </div>
             
</div>
           
</div>
         
</asp:Content>
