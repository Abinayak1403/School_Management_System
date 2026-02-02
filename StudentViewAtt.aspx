<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentViewAtt.aspx.cs" Inherits="YourNamespace.StudentViewAtt" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Student Attendance Summary</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="text-center mb-4">
            📅 Student Attendance Summary
        </h2>

        <div class="row mb-4 justify-content-center">
            <div class="col-md-3">
                <asp:TextBox ID="txtStudentId" runat="server" CssClass="form-control" placeholder="Enter Student Roll No" />
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnSearch" runat="server" Text="🔍 Search" CssClass="btn btn-primary w-100" OnClick="btnSearch_Click" />
            </div>
        </div>

        <div class="row text-center mb-4">
            <div class="col-md-3">
                <div class="btn btn-success w-100">✅ Present: <asp:Label ID="lblPresent" runat="server" Text="0"></asp:Label></div>
            </div>
            <div class="col-md-3">
                <div class="btn btn-danger w-100">❌ Absent: <asp:Label ID="lblAbsent" runat="server" Text="0"></asp:Label></div>
            </div>
            <div class="col-md-3">
                <div class="btn btn-info w-100">📊 <asp:Label ID="lblPercentage" runat="server" Text="0% attendance overall on that date"></asp:Label></div>
            </div>
        </div>

        <asp:GridView ID="gvAttendance" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="ClassId" HeaderText="Class" />
                <asp:BoundField DataField="SubjectId" HeaderText="Subject" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
