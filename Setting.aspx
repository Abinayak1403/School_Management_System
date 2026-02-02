<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="YourNamespace.Settings" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Settings</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
</head>
<body style="background-color: white;">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h3 class="mb-4">Settings</h3>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-bold"></asp:Label>

            <div class="row">
                <!-- Profile Image -->
                <div class="col-md-4 text-center">
                    <asp:Image ID="imgProfile" runat="server" CssClass="img-thumbnail mb-3" Width="150" Height="150" />
                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control mb-2" />
                    <asp:Button ID="btnUpload" runat="server" Text="Upload Image" CssClass="btn btn-outline-primary" OnClick="btnUpload_Click" />
                </div>

                <!-- Profile Info -->
                <div class="col-md-8">
                    <asp:Panel ID="pnlProfileView" runat="server">
                        <table class="table table-bordered">
                            <tr><th>UID</th><td><asp:Label ID="lblUID" runat="server" /></td></tr>
                            <tr><th>Name</th><td><asp:Label ID="lblName" runat="server" /></td></tr>
                            <tr><th>BirthDay</th><td><asp:Label ID="lblDOB" runat="server" /></td></tr>
                            <tr><th>Email</th><td><asp:Label ID="lblEmail" runat="server" /></td></tr>
                            <tr><th>Phone</th><td><asp:Label ID="lblPhone" runat="server" /></td></tr>
                            <tr><th>Gender</th><td><asp:Label ID="lblGender" runat="server" /></td></tr>
                            <tr><th>Address</th><td><asp:Label ID="lblAddress" runat="server" /></td></tr>
                        </table>
                    </asp:Panel>

                    <!-- Edit Profile Panel -->
                    <asp:Panel ID="pnlEditProfile" runat="server" Visible="false">
                        <div class="mb-2"><asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Name" /></div>
                        <div class="mb-2"><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email" /></div>
                        <div class="mb-2"><asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Phone" /></div>
                        <div class="mb-2"><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Placeholder="Address" /></div>
                        <asp:Button ID="btnSaveProfile" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSaveProfile_Click" />
                    </asp:Panel>

                    <!-- Change Password Panel -->
                    <asp:Panel ID="pnlChangePassword" runat="server" Visible="false" CssClass="mt-3">
                        <div class="mb-2"><asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="New Password" /></div>
                        <div class="mb-2"><asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Confirm Password" /></div>
                        <asp:Button ID="btnUpdatePassword" runat="server" Text="Change Password" CssClass="btn btn-danger" OnClick="btnUpdatePassword_Click" />
                    </asp:Panel>

                    <!-- Actions -->
                    <asp:Button ID="btnEdit" runat="server" Text="Edit Profile" CssClass="btn btn-primary me-2 mt-2" OnClick="btnEdit_Click" />
                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn btn-warning mt-2" OnClick="btnChangePassword_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
