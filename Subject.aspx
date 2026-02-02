<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="YourNamespace.Subject" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subject Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body id="body" runat="server">
    <form id="form1" runat="server" class="container mt-5">
        <div class="d-flex justify-content-between align-items-center">
            <h2>Subject Module</h2>
            <asp:Label ID="lblUser" runat="server" CssClass="fw-bold text-primary"></asp:Label>
        </div>

        <hr />

        <a href="AddSubject.aspx" class="btn btn-success me-3"><i class="fas fa-plus"></i> Add Subject</a>
        <a href="ViewSubject.aspx" class="btn btn-info"><i class="fas fa-eye"></i> View Subjects</a>
    </form>
</body>
</html>
