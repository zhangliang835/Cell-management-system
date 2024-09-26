<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="UI.Views.Text.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
        <!-- 引入Tabulator的CSS -->
    <link rel="stylesheet" href="~/css/tabulator.min.css" />

    <!-- 引入jQuery（如果还未引入） -->
        <script src="../../JS/jquery-3.7.1.min.js"></script>

    <!-- 引入Tabulator的JavaScript库 -->
    <script src="~/js/tabulator.min.js"></script>
      <!-- 初始化Tabulator的JavaScript代码 -->
    <script>
        $(function () {
            // 获取Repeater控件生成的表格容器
            var repeaterContainer = $("#ResidentListTable");

            // 创建一个空div用来存放Tabulator表格
            var tableElement = $("<div id='residentTable'></div>");
            repeaterContainer.before(tableElement);

            // 定义Tabulator表格数据源，此处假设已在后台代码中将数据绑定到了repeater的DataSource属性
            var residentData = repeaterContainer.find("tbody tr").map(function () {
                return {
                    Id: $(this).find("td:eq(0)").text(),
                    Name: $(this).find("td:eq(1)").text(),
                    Sex: $(this).find("td:eq(2)").text(),
                    Phone: $(this).find("td:eq(3)").text(),
                    CarName: $(this).find("td:eq(4)").text()
                };
            }).get();

            // 初始化Tabulator表格
            var table = new Tabulator("#residentTable", {
                height: "auto",
                data: residentData,
                columns: [
                    { title: "编号", field: "Id", sorter: "string" },
                    { title: "姓名", field: "Name", sorter: "string" },
                    { title: "用户性别", field: "Sex", sorter: "string" },
                    { title: "电话", field: "Phone", sorter: "string" },
                    { title: "车牌号", field: "CarName", sorter: "string" }
                ]
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table id="myTable" class="table table-striped table-bordered dt-responsive nowrap" width="100%">
            <asp:Repeater ID="ResidentListTable" runat="server"  Visible="true">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>用户性别</th>                 
                            <th>电话</th>
                            <th>车牌号</th>
                        </tr>
                    </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tbody>
                        <tr>
                            <td><%# Eval("Id")%></td>
                            <td><%# Eval("Name") %></td>
                            <td><%# (int)Eval("Sex") == 1 ? "男生" : "女生" %></td>                     
                            <td><%# Eval("Phone") %></td>
                            <td><%# Eval("CarName") %></td>                 
                        </tr>
                    </tbody>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </form>
</body>
</html>
