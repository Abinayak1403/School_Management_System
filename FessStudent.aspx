<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FessStudent.aspx.cs" Inherits="YourNamespace.StudentPayFees" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Pay Fees</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div class="card shadow p-4">
            <h3 class="mb-4">Pay Your Fees</h3>

            <!-- Fee Details -->
            <asp:Label ID="lblStudentName" runat="server" CssClass="h5 text-dark d-block" />
            <asp:Label ID="lblAmount" runat="server" CssClass="h5 text-primary d-block mb-3" />

            <!-- Static QR Code Image -->
            <asp:Image ID="imgQRCode" runat="server" ImageUrl="~/Images/fee_qr.png" Width="200" Height="200" CssClass="mb-3 d-block" />

            <p class="text-muted">Scan this QR code with GPay, PhonePe, or any UPI app to complete your payment.</p>

            <!-- Buttons -->
            <asp:Button ID="btnMarkPaid" runat="server" Text="✅ I Have Paid" CssClass="btn btn-success me-2" OnClick="btnMarkPaid_Click" />
            <asp:Button ID="btnDownloadReceipt" runat="server" Text="📄 Download Receipt" CssClass="btn btn-outline-primary" OnClick="btnDownloadReceipt_Click" />
        </div>
    </form>
</body>
</html>
