<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="YourNamespace.Teacher" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher Module</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5 text-center">
        <h2 class="mb-4">Teacher Module Dashboard</h2>

        <div class="mb-3">
            <asp:Button ID="btnAddTeacher" runat="server" Text="➕ Add Teacher" CssClass="btn btn-success w-50 p-3 fs-5" OnClick="btnAddTeacher_Click" />
        </div>

        <div class="mb-3">
            <asp:Button ID="btnViewTeachers" runat="server" Text="📋 View Teachers" CssClass="btn btn-primary w-50 p-3 fs-5" OnClick="btnViewTeachers_Click" />
        </div>
        <div class="mb-3">
    <asp:Button ID="btnadmin" runat="server" Text="📋 Manage Leave Request" CssClass="btn btn-primary w-50 p-3 fs-5" OnClick="btnadminleave" />
</div>
    </form>
</body>
</html>
