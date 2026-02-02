<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNotice.aspx.cs" Inherits="YourNamespace.AddNotice" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Notice</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="mb-4 text-center">📢 Add Notice</h2>

            <div class="mb-3">
                <label for="txtTitle" class="form-label">Notice Title</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter title" />
            </div>

            

            <div class="mb-3">
                <label for="txtDate" class="form-label">Date</label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" />
            </div>

            <asp:Button ID="btnAdd" runat="server" Text="Add Notice" CssClass="btn btn-primary" OnClick="btnAdd_Click" />

            <br /><br />
            <asp:Label ID="lblStatus" runat="server" CssClass="text-success fw-bold" />
        </div>
    </form>
</body>
</html>
