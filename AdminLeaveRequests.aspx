<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLeaveRequests.aspx.cs" Inherits="SchoolManagementSystem.AdminLeaveRequests" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Teacher Leave Requests</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h3 class="text-center">Teacher Leave Requests</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                OnRowCommand="GridView1_RowCommand" DataKeyNames="LeaveId">
                <Columns>
        <asp:BoundField DataField="LeaveId" HeaderText="Leave ID" />
        <asp:BoundField DataField="TeacherId" HeaderText="Teacher ID" />
        <asp:BoundField DataField="LeaveDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="Reason" HeaderText="Reason" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="btnApprove" runat="server" CommandName="Approve" CommandArgument='<%# Eval("LeaveId") %>' Text="Approve" CssClass="btn btn-success btn-sm" />
                <asp:Button ID="btnReject" runat="server" CommandName="Reject" CommandArgument='<%# Eval("LeaveId") %>' Text="Reject" CssClass="btn btn-danger btn-sm" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

    </form>
</body>
</html>
