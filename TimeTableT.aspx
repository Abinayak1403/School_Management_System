<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherTimeTable.aspx.cs" Inherits="YourNamespace.TeacherTimeTable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher Timetable</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h3 class="mb-4">My Timetable</h3>
            <asp:GridView ID="gvTeacherTimetable" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ClassName" HeaderText="Class" />
                    <asp:BoundField DataField="SubjectName" HeaderText="Subject" />
                    <asp:BoundField DataField="DayOfWeek" HeaderText="Day" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                    <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
