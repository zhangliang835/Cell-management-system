<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Common.Master" AutoEventWireup="true" CodeBehind="InformList.aspx.cs" Inherits="UI.Views.DomesticConsumer.InformList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .fd {
            float: right;
        }

        .container {
            height: auto;
            padding: 0px !important;
        }

        a {
            color: black;
        }

            a:hover {
                color: black;
            }

        .navd a:hover {
            text-decoration: none; /* 可选，取消默认下划线 */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
             cursor: pointer;
        }
        .form-group {
           
        }
        .btn{
            float:right!important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="margin-top: 108px; margin-bottom: 50px">您现在的位置：个人通知 </h3>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="overflow-y: auto; max-height: 540px;">
                <asp:Repeater ID="repeaterInforms" runat="server">
                    <ItemTemplate>
                        <div class="navd" style="overflow-y: auto; max-height: 740px;">

                            <div class="card">
                                <a href="InformUI.aspx?id=<%# Eval("Id")%>">
                                    <div class="card-body" >
                                        <div class="form-group fd">
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("time") %>'></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblPople" runat="server" Text='<%# Eval("Sender") %>'></asp:Label>
                                      

                                        </div>
                                        
                                        <asp:Button ID="delete" runat="server" Text="删除" Class="btn btn-danger" OnClick="delete_Click" CommandArgument='<%# Eval("Id") %>' />
                                       
                                        <div class="form-group">
                                            <label><%# Eval("InformName") %></label>
                                        </div>
                                       
                                    </div>
                                </a>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

</asp:Content>
