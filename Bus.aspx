<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentBusPanel.aspx.cs" Inherits="YourNamespace.StudentBusPanel" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bus Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h3 class="mb-4">🚌 Bus Panel</h3>

        <asp:Panel ID="pnlBusInfo" runat="server" Visible="false">
            <table class="table table-bordered">
                <tr><th>Bus Number</th><td><asp:Label ID="lblBusNumber" runat="server" /></td></tr>
                <tr><th>Route</th><td><asp:Label ID="lblRoute" runat="server" /></td></tr>
                <tr><th>Driver Name</th><td><asp:Label ID="lblDriverName" runat="server" /></td></tr>
                <tr><th>Contact Number</th><td><asp:Label ID="lblContact" runat="server" /></td></tr>
                <tr><th>Capacity</th><td><asp:Label ID="lblCapacity" runat="server" /></td></tr>
            </table>
        </asp:Panel>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>
    </form>
</body>
</html>
