<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="UI.Views.Text.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <!-- 引入Tabulator的CSS -->
<link rel="stylesheet" href="~/css/tabulator.min.css" />

<!-- 引入jQuery（如果还未引入） -->
    <script src="../../JS/jquery-3.7.1.min.js"></script>

<!-- 引入Tabulator的JavaScript库 -->
<script src="~/js/tabulator.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
       <div id="example-table">
           
       </div>
        <script>
            var table = new Tabulator("#example-table", {
                data: tabledata,           //load row data from array
                layout: "fitColumns",      //fit columns to width of table
                responsiveLayout: "hide",  //hide columns that don't fit on the table
                addRowPos: "top",          //when adding a new row, add it to the top of the table
                history: true,             //allow undo and redo actions on the table
                pagination: "local",       //paginate the data
                paginationSize: 7,         //allow 7 rows per page of data
                paginationCounter: "rows", //display count of paginated rows in footer
                movableColumns: true,      //allow column order to be changed
                initialSort: [             //set the initial sort order of the data
                    { column: "name", dir: "asc" },
                ],
                columnDefaults: {
                    tooltip: true,         //show tool tips on cells
                },
                columns: [                 //define the table columns
                    { title: "Name", field: "name", editor: "input" },
                    { title: "Task Progress", field: "progress", hozAlign: "left", formatter: "progress", editor: true },
                    { title: "Gender", field: "gender", width: 95, editor: "select", editorParams: { values: ["male", "female"] } },
                    { title: "Rating", field: "rating", formatter: "star", hozAlign: "center", width: 100, editor: true },
                    { title: "Color", field: "col", width: 130, editor: "input" },
                    { title: "Date Of Birth", field: "dob", width: 130, sorter: "date", hozAlign: "center" },
                    { title: "Driver", field: "car", width: 90, hozAlign: "center", formatter: "tickCross", sorter: "boolean", editor: true },
                ],
            });
        </script>
    </form>
</body>
</html>
