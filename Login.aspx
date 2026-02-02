<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="YourNamespace.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - School Management System</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #f4f6f9;
        }

        .login-container {
            max-width: 420px;
            margin: 80px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .position-relative {
            position: relative;
        }

        .eye-icon {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #6c757d;
        }

        .login-logo {
            display: block;
            margin: 0 auto 20px;
            width: 100px;
        }

        #lblError {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <!-- Optional Logo -->
            <img src="code.png" alt="Logo" class="login-logo" />

            <h4 class="text-center mb-4">Login</h4>

            <!-- Error Label -->
            <asp:Label ID="lblError" runat="server" Text="" />

            <!-- Username -->
            <div class="mb-3">
                <label for="txtUsername" class="form-label">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username" />
            </div>

            <!-- Password with Eye Button -->
            <div class="mb-3 position-relative">
                <label for="txtPassword" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password" />
                <span class="eye-icon" onclick="togglePassword()">
                    👁️
                </span>
            </div>

            <!-- Login Button -->
            <div class="d-grid">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            </div>
        </div>
    </form>

    <script>
        function togglePassword() {
            var pwdBox = document.getElementById('<%= txtPassword.ClientID %>');
            if (pwdBox.type === "password") {
                pwdBox.type = "text";
                
            } else {
                pwdBox.type = "password";
            }
        }
    </script>
</body>
</html>
