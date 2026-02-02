<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSubjects.aspx.cs" Inherits="YourNamespace.ViewSubjects" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Subjects</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="text-center mb-4">Subjects List</h2>

        <div class="mb-3 d-flex justify-content-between">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control w-50" placeholder="Search by Subject Name" />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary ms-3" OnClick="btnSearch_Click" />
        </div>

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="SubjectId" HeaderText="Subject ID" ReadOnly="True" />
                <asp:BoundField DataField="ClassId" HeaderText="Class ID" />
                <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" />
            </Columns>
        </asp:GridView>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>
    </form>
</body>
</html>
