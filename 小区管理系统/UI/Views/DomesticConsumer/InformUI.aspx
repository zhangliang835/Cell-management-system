<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="InformUI.aspx.cs" Inherits="UI.Views.DomesticConsumer.InformUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            height: auto;
            padding: 0px !important;
        }

        .card-body {
            background-color: white; /* 选择一种比内容区域稍浅或稍深的颜色 */
        }

        .ww {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 7px;
        }

        .btn {
            width: 150px;
        }

 
  
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-2" >

            </div>
            <div class="col-md-8">
                <div class="card bg-success">

                    <div class="card-header">
                        <label>通知</label>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label>通知名称:</label>
                            <asp:label id="name" runat="server" text="label"></asp:label>
                        </div>
                        <hr />
                        <div class="form-group">
                            <label>通知日期:</label>
                            <asp:Label ID="date" runat="server" Text="Label"></asp:Label>
                        </div>
                        <hr />
                        <div class="form-group ww">
                            <label>通知内容:</label>
                            <textarea id="TextArea1" runat="server" cols="98" rows="10" style="font-size: 14px"></textarea>
                        </div>
                        <hr />
                        <div class="form-group ">
                            <label>通知人：</label>
                            <asp:Label ID="pople" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div class="form-group ww">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary " OnClick="Button1_Click" Text="确认" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
