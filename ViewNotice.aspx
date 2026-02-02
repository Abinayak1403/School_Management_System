<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewNotices.aspx.cs" Inherits="YourNamespace.ViewNotices" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Notices</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="mb-4 text-center">📄 All Notices</h2>

            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control mb-3" placeholder="Search by title" />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary mb-3" OnClick="btnSearch_Click" />

            <asp:GridView ID="gvNotices" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" EmptyDataText="No notices found.">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Sender" HeaderText="Sender" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
