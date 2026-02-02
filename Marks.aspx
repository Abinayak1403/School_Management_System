<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Marks.aspx.cs" Inherits="YourNamespace.Marks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Marks Entry</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4 text-center">Enter Student Marks</h2>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Student</label>
                <asp:DropDownList ID="ddlStudent" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6">
                <label class="form-label">Subject</label>
                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Marks Obtained</label>
                <asp:TextBox ID="txtMarksObtained" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <label class="form-label">Total Marks</label>
                <asp:TextBox ID="txtTotalMarks" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <label class="form-label">Exam Type</label>
                <asp:TextBox ID="txtExamType" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Exam Date</label>
                <asp:TextBox ID="txtExamDate" runat="server" TextMode="Date" CssClass="form-control" />
            </div>
        </div>

        <asp:Button ID="btnSave" runat="server" Text="Save Marks" CssClass="btn btn-success" OnClick="btnSave_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-bold d-block mt-3"></asp:Label>

        <hr />

        <h4 class="mb-3">Saved Marks</h4>
        <asp:GridView ID="gvMarks" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
            <Columns>
                <asp:BoundField DataField="MarkId" HeaderText="Mark ID" />
                <asp:BoundField DataField="StudentId" HeaderText="Student ID" />
                <asp:BoundField DataField="SubjectId" HeaderText="Subject ID" />
                <asp:BoundField DataField="MarksObtained" HeaderText="Marks Obtained" />
                <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks" />
                <asp:BoundField DataField="ExamType" HeaderText="Exam Type" />
                <asp:BoundField DataField="ExamDate" HeaderText="Exam Date" DataFormatString="{0:yyyy-MM-dd}" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
