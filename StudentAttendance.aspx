<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentAttendance.aspx.cs" Inherits="YourNamespace.StudentAttendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Attendance</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
        .dark-mode {
    background-color: #121212 !important;
    color: #f1f1f1 !important;
}

.dark-mode .form-control,
.dark-mode .table {
    background-color: #2a2a2a !important;
    color: white;
}

.dark-mode .btn {
    background-color: #444;
    color: white;
}

    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="text-center mb-4">Student Attendance</h2>

        <div class="row">
            <div class="col-md-4 mb-3">
                <label class="form-label">Roll No</label>
                <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Class</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label">Subject</label>
                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Date</label>
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" />
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Status</label><br />
                <asp:RadioButton ID="rbPresent" runat="server" GroupName="status" Text="Present" />
                <asp:RadioButton ID="rbAbsent" runat="server" GroupName="status" Text="Absent" CssClass="ms-3" />
            </div>
        </div>

        <div class="mb-3">
            <asp:Button ID="btnSave" runat="server" Text="Save Attendance" OnClick="btnSave_Click" CssClass="btn btn-success" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-bold"></asp:Label>
        <asp:Label ID="lblSummary" runat="server" CssClass="fw-bold text-primary mt-3 d-block"></asp:Label>

        <div class="alert alert-info mt-3" role="alert">
            <strong>Total Records:</strong>
            <asp:Label ID="lblTotalRecords" runat="server" CssClass="fw-bold" />
        </div>

        <hr />

        <h4 class="mt-4">Attendance Records</h4>
        <div class="row mb-3">
            <div class="col-md-6">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by Roll No" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary w-100" OnClick="btnSearch_Click" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary w-100" OnClick="btnClear_Click" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnExport" runat="server" Text="Export" CssClass="btn btn-outline-dark w-100" OnClick="btnExport_Click" />
            </div>
        </div>

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                <asp:BoundField DataField="ClassId" HeaderText="Class ID" />
                <asp:BoundField DataField="SubjectId" HeaderText="Subject ID" />
                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>
    </form>
     <script>
 // Apply dark mode on every page load
 window.onload = function () {
     if (localStorage.getItem("theme") === "dark") {
         document.body.classList.add("dark-mode");
     }
 };
     </script>

</body>
</html>
