<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="ComplaintUI.aspx.cs" Inherits="UI.Views.Complaint.ComplaintUI" %>
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
            height:401px;
        }
        .fd{
            display:flex;
            justify-content:center;
        }
        .tijiao{
            width:200px;
           
        }

      .form-control {

    border-radius: 0;
    width: 88%;
     border:1px solid black;
    height: auto;
}
        .col-md-4{
        
              box-shadow: 5px 2px 20px 0px rgba(0, 0, 0, 0.3);
                  padding-top:20px;
                  background-color:#EDEEEF;
        }
        .form-group label{
            width:32px;
            font-size:16px;
            color:black;
        }
    
           .readonly-textbox:focus {
       outline: none; /* 取消点击聚焦时的轮廓 */
       box-shadow: none; /* 取消点击聚焦时的阴影效果（对于一些浏览器，比如Firefox） */
   }
      .aa{
            width:100%!important;
            font-size:20px!important;
            font-family:'宋体';   
            font-weight:800;
      }
                 .b {
       width: 100% !important;
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
          <!-- 模态框（Modal） 反馈-->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">

                      <h4 class="modal-title" id="myModalLabel">投诉建议处理反馈
                      </h4>
                  </div>
                  <div class="modal-body">
                      <div class="form-group">
                          <label style="font-size: 16px">标题</label>                       
                        
                          <asp:TextBox ID="title" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                      <div class="form-group">
                          <label style="font-size: 16px">内容</label>
                         <textarea id="TextArea2" class="textAreaAutoSize" runat="server" cols="10" rows="10" ></textarea>
                      </div>
                  </div>
                  <div class="modal-footer">
                      <asp:Button ID="FaSong" class="btn btn-primary" runat="server" Text="发送" OnClick="FaSong_Click"/>
                      <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                          取消
                      </button>
                  </div>
              </div>
          </div>
      </div>
                <!-- 模态框（Modal） 删除成功提示-->
<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabe6" aria-hidden="true">
    <div class="modal-dialog a" >
        <div class="modal-content b" >
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel6">通知
                </h4>
            </div>
            <div class="modal-body">
                <label style="font-size: 16px">已发送！</label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                    确认
                </button>
            </div>
        </div>

    </div>
</div>  
                 <div class="baoxiu">
           
                 <div class="col-md-10 "  >
    <div class="row">

              <div class="col-md-3"></div>
        <div class="col-md-4">
            <div class="form-group">
                <label for="username" class="aa">投诉与建议</label>
               
               
                </div> 
            <div class="form-group">
                <label for="username">标题</label>
          
               <asp:Label ID="Headline1" runat="server" Text="Label" class="form-control"></asp:Label>
                </div>
          
            <div class="form-group">
             
                  <textarea id="TextArea1" class="textAreaAutoSize" runat="server" cols="56" rows="10" readonly></textarea>
            </div>                                                               
                                 <div class="form-group fd">
    <asp:Button ID="Uploading" runat="server" Text="返回" class="btn btn-primary tijiao " OnClick="Uploading_Click" />
</div>
        </div>
       
        <div class="col-md-4"    >
           
            <div class="form-group wew">
                
                <asp:Image ID="PhotoView" runat="server"  />
            </div>
                                                             
                                 <div class="form-group fd">
    <asp:Button ID="FanKui" runat="server" Text="反馈" class=" btn btn-warning tijiao " OnClick="FanKui_Click" />
</div>
        </div>


    </div>
             
</div>
           
</div>
</asp:Content>
