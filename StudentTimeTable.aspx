<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentTimeTable.aspx.cs" Inherits="YourNamespace.StudentTimeTable" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Student Time Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f6f7fb;
        }
        .container {
            margin-top: 40px;
        }
        .title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="title">📅 My Time Table</div>
            <asp:GridView ID="gvTimeTable" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="DayOfWeek" HeaderText="Day" />
                    <asp:BoundField DataField="SubjectName" HeaderText="Subject" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" />

                    <asp:BoundField DataField="EndTime" HeaderText="End Time"/>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
