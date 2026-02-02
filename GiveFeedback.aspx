<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GiveFeedback.aspx.cs" Inherits="YourNamespace.GiveFeedback" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Give Student Feedback</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h3 class="mb-4">📣 Give Feedback to Student</h3>

        <div class="mb-3">
            <label for="ddlStudent" class="form-label">Select Student:</label>
            <asp:DropDownList ID="ddlStudent" runat="server" CssClass="form-select" AppendDataBoundItems="true">
                <asp:ListItem Text="-- Select Student --" Value="" />
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label for="txtFeedback" class="form-label">Feedback:</label>
            <asp:TextBox ID="txtFeedback" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
        </div>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />

        <asp:Label ID="lblMessage" runat="server" CssClass="text-success d-block mt-3" Visible="false" />
    </form>
</body>
</html>
