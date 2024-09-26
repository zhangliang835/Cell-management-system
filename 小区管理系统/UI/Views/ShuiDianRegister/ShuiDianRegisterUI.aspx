<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" AutoEventWireup="true" CodeBehind="ShuiDianRegisterUI.aspx.cs" Inherits="UI.Views.ShuiDianRegister.ShuiDianRegisterUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link type="text/css" rel="stylesheet" href="../../Master.CSS/Signin.css" />
    <style type="text/css">
     label {
         display: inline-block;
         max-width: 100%;
         margin-bottom: 5px;
         font-weight: 700;
         font-size: 14px;
     }
     body{
         background-image:none;
     }

     .name {
         color: red;
         position: absolute;
         top: calc(-40% + 7px);
         left: 91%;
         width: 100%;
         z-index: 1;
         font-size: 14px !important;
     }

     .residentname {
         color: red;
         position: absolute;
         top: calc(-43% + 7px);
         left: 91%;
         width: 100%;
         z-index: 1;
         font-size: 14px !important;
     }

     .phone {
         color: red;
         position: absolute;
         top: calc(-24% + 0px);
         left: 91%;
         width: 100%;
         z-index: 1;
         font-size: 14px !important;
     }

     .room {
         color: red;
         position: absolute;
         top: calc(-33% + 2px);
         left: 91%;
         width: 100%;
         z-index: 1;
         font-size: 14px !important;
     }

     .Ps {
         color: red;
         position: absolute;
         top: calc(-33% + 2px);
         left: 91%;
         width: 100%;
         z-index: 1;
         font-size: 14px !important;
     }

     .button {
         display: flex;
         align-items: center;
         justify-content: center;
     }

         .button .form-group {
             display: flex;
             align-items: center;
             justify-content: center;
             width: 100%;
         }

         .button .btn {
             width: 50%;
         }

     .custom-textbox {
         border-style: solid;
         border-width: 1px; /* 根据需要调整边框宽度 */


         border-color: #ccc; /* 示例边框颜色，您可以根据需要调整 */
     }

         .custom-textbox:focus {
             outline: none; /* 取消点击聚焦时的轮廓 */
             box-shadow: none; /* 取消点击聚焦时的阴影效果（对于一些浏览器，比如Firefox） */
         }

     .form-group {
         position: relative;
     }
     .fangke{
         margin-top:108px!important;
     }
     .container{
        height:auto!important;
     }
             .b {
    width: 100% !important;
    max-width: 800px !important;
}

        .a {
            display: flex; /* 对于Bootstrap 4+，确保对话框容器启用Flex布局 */
            align-items: center; /* 垂直居中 */
            justify-content: center; /* 水平居中 */
        }  
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- 模态框（Modal） 水电费登记成功提示-->
     <div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabe7" aria-hidden="true">
         <div class="modal-dialog a" >
             <div class="modal-content b" >
                 <div class="modal-header">
                     <h4 class="modal-title" id="myModalLabel7">通知
                     </h4>
                 </div>
                 <div class="modal-body">
                     <label style="font-size: 16px">登记成功！</label>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                         确认
                     </button>
                 </div>
             </div>

         </div>
     </div> 
            <!-- 模态框（Modal） 重复登记提示-->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
                <div class="modal-content" >
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel2">通知
                        </h4>
                    </div>
                    <div class="modal-body">
                        <label style="font-size: 16px">无法登记，该业主本月已登记过该费用类型</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
                            确认
                        </button>
                    </div>
                </div>

            </div>
        </div>  
             <div class="fangke">
              <div class="container">
    <div class="row">
                <div class="col-md-2"></div>
  <div class="col-md-4 ">
      <span>水电费</span>
      </div>
      <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-5">
              <div class="form-group">
                  <label for="roomnumber">单元</label>
                  <asp:TextBox ID="RoomNumber" type="text" class="form-control custom-textbox" runat="server"></asp:TextBox>
                  <!-- 姓名验证 -->
                  <asp:RequiredFieldValidator ID="rfvName" runat="server"
                      ControlToValidate="RoomNumber"
                      ErrorMessage="单元名称不能为空！"
                      Display="Dynamic"
                      ForeColor="Red"
                      Class="name">
                  </asp:RequiredFieldValidator>
              </div>

                 <div class="form-group">
    
        <label for="leibie">类别</label>
        <select id="LeiBie" class="form-control" runat="server">
            <option value="2">水费</option>
            <option value="3">电费</option>
        </select>
    </div>
         
              <div class="form-group">
                  <label for="benci">本次表值</label>
                  <asp:TextBox ID="BenCi" type="text" class="form-control custom-textbox" AutoPostBack="true" runat="server"></asp:TextBox>
                  <%-- 验证房产单元 --%>
                  <asp:RequiredFieldValidator ID="rfvHouseName" runat="server"
                      ControlToValidate="BenCi"
                      ErrorMessage="表值不能为空！"
                      Display="Dynamic"
                      ForeColor="Red"
                      Class="room">
                  </asp:RequiredFieldValidator>
              </div>
              <div class="form-group">
                  <label for="sangci">上次表值</label>
                  <asp:TextBox ID="SangCi" type="text" class="form-control custom-textbox" AutoPostBack="true" runat="server"></asp:TextBox>
                  <%-- 验证房产单元 --%>
                  <asp:RequiredFieldValidator ID="rfvPurpose" runat="server"
                      ControlToValidate="SangCi"
                      ErrorMessage="表值不能为空！"
                      Display="Dynamic"
                      ForeColor="Red"
                      Class="Ps">
                  </asp:RequiredFieldValidator>
              </div>
                   <div class="form-group">
         <label for="biaocha">表值差</label>
         <asp:TextBox ID="BiaoCha" type="text" class="form-control custom-textbox" runat="server"></asp:TextBox>
         <!-- 姓名验证 -->

     </div>         
              <div class="form-group">
         <label for="name">合计</label>
         <asp:TextBox ID="sum" type="text" class="form-control custom-textbox" runat="server"></asp:TextBox>


     </div>
              <div class="button">
                  <div class="form-group">
                      <asp:Button ID="SigninButton" runat="server" Text="保存" OnClick="SigninButton_Click" class="  btn btn-danger custom-size-button" />
                  </div>
              </div>
          </div>
      </div>
  
            </div>
</div>
          </div>
</asp:Content>
