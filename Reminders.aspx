<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reminders.aspx.cs" Inherits="YourNamespace.Reminders" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reminders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="text-center mb-4">🔔 Manage Reminders</h2>

        <div class="row mb-4">
            <div class="col-md-6">
                <label class="form-label">Reminder Message</label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-3">
                <label class="form-label">Reminder Date</label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" />
            </div>
            <div class="col-md-3">
                <label class="form-label">Created By</label>
                <asp:TextBox ID="txtCreatedBy" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="mb-3">
            <asp:Button ID="btnSave" runat="server" Text="Save Reminder" CssClass="btn btn-success" OnClick="btnSave_Click" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="fw-bold"></asp:Label>

        <hr />
        <h4 class="mt-4">🔍 Existing Reminders</h4>
        <asp:GridView ID="gvReminders" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ReminderId" HeaderText="ID" />
                <asp:BoundField DataField="Message" HeaderText="Message" />
                <asp:BoundField DataField="ReminderDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="CreatedBy" HeaderText="Created By" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
