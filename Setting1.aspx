<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherSettings.aspx.cs" Inherits="YourNamespace.TeacherSettings" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher Settings</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
</head>
<body style="background-color: white;">
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h3 class="mb-4">Teacher Settings</h3>

            <div class="row">
                <!-- Profile Image & Upload -->
                <div class="col-md-4 text-center">
                    <asp:Image ID="imgProfile" runat="server" CssClass="img-thumbnail mb-3" Width="200" Height="200" />
                    <br />
                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control mb-2" />
                    <asp:Button ID="btnUpload" runat="server" Text="Upload Image" CssClass="btn btn-outline-primary" OnClick="btnUpload_Click" />
                </div>

                <!-- Profile Info & Edit -->
                <div class="col-md-8">
                    <asp:Panel ID="pnlView" runat="server">
                        <table class="table table-bordered">
                            <tr><th>UID</th><td><asp:Label ID="lblUID" runat="server" /></td></tr>
                            <tr><th>Name</th><td><asp:Label ID="lblName" runat="server" /></td></tr>
                            <tr><th>DOB</th><td><asp:Label ID="lblDOB" runat="server" /></td></tr>
                            <tr><th>Gender</th><td><asp:Label ID="lblGender" runat="server" /></td></tr>
                            <tr><th>Mobile</th><td><asp:Label ID="lblPhone" runat="server" /></td></tr>
                            <tr><th>Address</th><td><asp:Label ID="lblAddress" runat="server" /></td></tr>
                        </table>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit Profile" CssClass="btn btn-primary me-2" OnClick="btnEdit_Click" />
                    </asp:Panel>

                    <asp:Panel ID="pnlEdit" runat="server" Visible="false">
                        <table class="table table-bordered">
                            <tr><th>Name</th><td><asp:TextBox ID="txtName" runat="server" CssClass="form-control" /></td></tr>
                            <tr><th>Mobile</th><td><asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" /></td></tr>
                            <tr><th>Address</th><td><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" /></td></tr>
                        </table>
                        <asp:Button ID="btnSaveProfile" runat="server" Text="Save Changes" CssClass="btn btn-success me-2" OnClick="btnSaveProfile_Click" />
                        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancelEdit_Click" />
                    </asp:Panel>

                    <hr />

                    <h5>Change Password</h5>
                    <div class="mb-2">
                        <label>Old Password</label>
                        <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>
                    <div class="mb-2">
                        <label>New Password</label>
                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>
                    <div class="mb-3">
                        <label>Confirm New Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>
                    <asp:Button ID="btnChangePassword" runat="server" Text="Update Password" CssClass="btn btn-warning" OnClick="btnChangePassword_Click" />
                    <br />
                    <asp:Label ID="lblStatus" runat="server" CssClass="text-success mt-3" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
