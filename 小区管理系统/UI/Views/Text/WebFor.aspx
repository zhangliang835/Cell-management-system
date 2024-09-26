<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFor.aspx.cs" Inherits="UI.Views.ResidentUI.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../bootstrap/css/bootstrap.min.css" />
    <style>
        [class^="col"] {
            border: 1px solid;
            height:100px;
        }
        span{
            font-size:30px;
        }

        .row:nth-child(1) {
            background-color: rebeccapurple;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="row" style="background-color: red">
                        <div class="col-sm-10 col-xs-4  " style="background-color: aquamarine">
                            <span class="visible-lg">你好</span>
                        </div>
                        <div class="col-sm-2 col-xs-8 " style="background-color: cadetblue">b</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="row" style="background-color: red">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="background-color: aquamarine">a</div>
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="background-color: cadetblue">b</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="row" style="background-color: red">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" style="background-color: aquamarine">a</div>
                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="background-color: cadetblue">b</div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="row" style="background-color: red">
                        <div class="col-xs-4  col-xs-push-8 hidden-lg" style="background-color: wheat">a</div>
                        <div class="col-xs-4    col-xs-offset-4 col-xs-pull-8" style="background-color: blue">b</div>
                    </div>
                </div>

            </div>



        </div>
    </form>
</body>
</html>
