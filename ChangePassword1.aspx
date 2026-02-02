<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword1.aspx.cs" Inherits="YourNamespace.ChangePassword1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password - Owner</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5" style="max-width: 500px;">
        <h3 class="text-center mb-4">Change Password</h3>

        <div class="form-group">
            <label>Current Password</label>
            <div class="input-group">
                <asp:TextBox ID="txtCurrent" runat="server" TextMode="Password" CssClass="form-control" />
                <div class="input-group-append">
                    <button type="button" class="btn btn-outline-secondary" onclick="toggleVisibility('txtCurrent', this)">
                        <i class="fa fa-eye"></i>
                    </button>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label>New Password</label>
            <div class="input-group">
                <asp:TextBox ID="txtNew" runat="server" TextMode="Password" CssClass="form-control" />
                <div class="input-group-append">
                    <button type="button" class="btn btn-outline-secondary" onclick="toggleVisibility('txtNew', this)">
                        <i class="fa fa-eye"></i>
                    </button>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label>Confirm New Password</label>
            <div class="input-group">
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" CssClass="form-control" />
                <div class="input-group-append">
                    <button type="button" class="btn btn-outline-secondary" onclick="toggleVisibility('txtConfirm', this)">
                        <i class="fa fa-eye"></i>
                    </button>
                </div>
            </div>
        </div>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="d-block mb-3 text-center"></asp:Label>

        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn btn-primary btn-block" OnClick="btnChangePassword_Click" />
    </form>

    <script>
        function toggleVisibility(inputId, btn) {
            var input = document.getElementById(inputId);
            var icon = btn.querySelector("i");

            if (input.type === "password") {
                input.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                input.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        }
    </script>
</body>
</html>
