<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="ComplaintUI.aspx.cs" Inherits="UI.Views.DomesticConsumer.ComplaintUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="../../Master.CSS/Maintenance.css" />
    <link rel="stylesheet" type="text/css" href="../../Master.CSS/Signin.css"/>
    <style type="text/css">
        .baoxiu {
            margin-top: 108px !important;
            /*background-color:saddlebrown;*/
        }

        .textAreaAutoSize {
            width: 100%;
            resize: none;
        }

        .wew {
            margin-top: -20px !important;
        }

            .wew img {
                width: 100%;
                height: 342px;
            }

        .fd {
            display: flex;
            justify-content: center;
        }

        .tijiao {
            width: 200px;
        }

        .form-control {
            border: 1px solid black;
        }

        .col-md-4 {
            box-shadow: -1px 0px 7px 0px rgba(0, 0, 0, 0.3);
            padding-top: 20px;
            background-color:#EDEEEF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="baoxiu">

        <div class="col-md-10 ">
            <div class="row">

                <div class="col-md-3"></div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="username">姓名</label>

                        <asp:Label ID="ResidentName" runat="server" Text="Label" class="form-control"></asp:Label>
                    </div>
                    <div class="form-group ">
                        <label for="RoomNumber">房产号</label>

                        <asp:Label ID="RoomNumber" runat="server" Text="Label" class="form-control"></asp:Label>
                    </div>
                    <div class="form-group ">
                        <label for="biaoti">标题</label>

                        <asp:TextBox ID="Headline" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">

                        <textarea id="TextArea1" class="textAreaAutoSize" runat="server" cols="56" rows="10"></textarea>
                    </div>
                    <div class="form-group fd">
                        <asp:Button ID="Uploading" runat="server" Text="提交" class="  btn btn-danger tijiao " OnClick="Uploading_Click" />
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">图片</label>
                        <asp:FileUpload ID="Photo" runat="server" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="control-label">上传</label>
                        <asp:Button ID="PhotoUpload" class="btn btn-success" runat="server" Text="上传" OnClick="PhotoUpload_Click" />
                    </div>
                    <div class="form-group wew">

                        <asp:Image ID="NoticePhotoView" runat="server" />
                    </div>
                </div>


            </div>

        </div>

    </div>
</asp:Content>
