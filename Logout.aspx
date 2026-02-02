<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="SchoolManagementSystem.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <script>
    alert("🔓 You have been logged out successfully.");
    window.location.href = 'Login.aspx';
            </script>

        </div>
    </form>
</body>
</html>
