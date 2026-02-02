<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="YourNamespace.ChangePassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5" style="max-width: 500px;">
        <h3 class="mb-4 text-center">🔒 Change Password</h3>

        <!-- Current Password -->
        <div class="mb-3">
            <label for="txtCurrent" class="form-label">Current Password</label>
            <div class="input-group">
                <asp:TextBox ID="txtCurrent" runat="server" TextMode="Password" CssClass="form-control" />
                <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('<%= txtCurrent.ClientID %>', this)">
                    <i class="fa fa-eye"></i>
                </button>
            </div>
        </div>

        <!-- New Password -->
        <div class="mb-3">
            <label for="txtNew" class="form-label">New Password</label>
            <div class="input-group">
                <asp:TextBox ID="txtNew" runat="server" TextMode="Password" CssClass="form-control" />
                <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('<%= txtNew.ClientID %>', this)">
                    <i class="fa fa-eye"></i>
                </button>
            </div>
        </div>

        <!-- Confirm Password -->
        <div class="mb-4">
            <label for="txtConfirm" class="form-label">Confirm Password</label>
            <div class="input-group">
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" CssClass="form-control" />
                <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('<%= txtConfirm.ClientID %>', this)">
                    <i class="fa fa-eye"></i>
                </button>
            </div>
        </div>

        <!-- Button -->
        <div class="text-center">
            <asp:Button ID="btnChange" runat="server" CssClass="btn btn-primary" Text="Change Password" OnClick="btnChange_Click" />
        </div>

        <!-- Alert -->
        <asp:Label ID="lblMessage" runat="server" CssClass="mt-3 text-center fw-bold d-block"></asp:Label>

    </form>

    <!-- Toggle Password JS -->
    <script>
        function togglePassword(id, btn) {
            const input = document.getElementById(id);
            const icon = btn.querySelector('i');

            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                input.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>
