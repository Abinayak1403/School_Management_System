<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="YourNamespace.AddStudent" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="text-center mb-4">Add Student</h2>

        <div class="mb-3">
            <label>Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label>DOB</label>
            <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" />
        </div>

        <div class="mb-3">
            <label>Gender</label>
            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                <asp:ListItem Text="--Select--" Value="" />
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label>Mobile</label>
            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label>Roll No</label>
            <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label>Address</label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
        </div>

       

        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-success" />
        <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-bold d-block mt-3" />
    </form>
</body>
</html>
