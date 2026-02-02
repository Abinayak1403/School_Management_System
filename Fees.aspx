<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fees.aspx.cs" Inherits="YourNamespace.Fees" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fees Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="text-center mb-4">Fees Management</h2>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Class</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Fees Amount</label>
                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" />
            </div>
        </div>

        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success mb-3" OnClick="btnSave_Click" />

        <asp:Label ID="lblMessage" runat="server" CssClass="fw-bold"></asp:Label>

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered mt-4" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="FeesId" HeaderText="ID" />
                <asp:BoundField DataField="ClassId" HeaderText="Class ID" />
                <asp:BoundField DataField="FeesAmount" HeaderText="Fees Amount" />
            </Columns>
        </asp:GridView>
    </form>
    <script>
    window.onload = function () {
    if (localStorage.getItem("theme") === "dark") {
        document.body.classList.add("dark-mode");
    }
};
    </script>

</body>
</html>
