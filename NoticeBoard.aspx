<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticeBoard.aspx.cs" Inherits="YourNamespace.NoticeBoard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Notice Board</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="text-center mb-4">📢 Notice Board</h2>

            <div class="d-grid gap-3 col-md-6 mx-auto">
                <asp:Button ID="btnAddNotice" runat="server" Text="➕ Add Notice" CssClass="btn btn-outline-primary btn-lg" OnClick="btnAddNotice_Click" />
                <asp:Button ID="btnViewNotices" runat="server" Text="📄 View Notices" CssClass="btn btn-outline-secondary btn-lg" OnClick="btnViewNotices_Click" />
            </div>
        </div>
    </form>
</body>
</html>
