<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSubject.aspx.cs" Inherits="YourNamespace.AddSubject" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Subject</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="text-center mb-4">Add Subject</h2>

        <div class="mb-3">
            <label for="ddlClass" class="form-label">Select Class</label>
            <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label for="txtSubjectName" class="form-label">Subject Name</label>
            <asp:TextBox ID="txtSubjectName" runat="server" CssClass="form-control" placeholder="Enter Subject Name" />
        </div>

        <div class="mb-3">
            <asp:Button ID="btnSave" runat="server" Text="Save Subject" CssClass="btn btn-success" OnClick="btnSave_Click" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="fw-bold"></asp:Label>
    </form>
</body>
</html>
