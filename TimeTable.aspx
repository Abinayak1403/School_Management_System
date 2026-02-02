<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TimeTable.aspx.cs" Inherits="YourNamespace.TimeTable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Time Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4 text-center">Manage Time Table</h2>

        <div class="row mb-3">
            <div class="col-md-4">
                <label>Class</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <label>Subject</label>
                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <label>Day of Week</label>
                <asp:DropDownList ID="ddlDay" runat="server" CssClass="form-control">
                    <asp:ListItem Text="-- Select Day --" Value="" />
                    <asp:ListItem Text="Monday" />
                    <asp:ListItem Text="Tuesday" />
                    <asp:ListItem Text="Wednesday" />
                    <asp:ListItem Text="Thursday" />
                    <asp:ListItem Text="Friday" />
                    <asp:ListItem Text="Saturday" />
                </asp:DropDownList>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label>Start Time</label>
                <asp:TextBox ID="txtStartTime" runat="server" TextMode="Time" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label>End Time</label>
                <asp:TextBox ID="txtEndTime" runat="server" TextMode="Time" CssClass="form-control" />
            </div>
        </div>

        <div class="mb-3">
            <asp:Button ID="btnSave" runat="server" Text="Add Entry" OnClick="btnSave_Click" CssClass="btn btn-primary" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="fw-bold"></asp:Label>

        <hr />
        <h4 class="mt-4">Time Table Entries</h4>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="TimeTableId" HeaderText="ID" />
                <asp:BoundField DataField="ClassId" HeaderText="Class ID" />
                <asp:BoundField DataField="SubjectId" HeaderText="Subject ID" />
                <asp:BoundField DataField="DayOfWeek" HeaderText="Day" />
                <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                <asp:BoundField DataField="EndTime" HeaderText="End Time" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
