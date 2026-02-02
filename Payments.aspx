<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="YourNamespace.Payments" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Details - Owner View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card shadow">
                <div class="card-header text-center">
                    Payment Details
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped table-hover">
                        <thead class="table-light">
                            <tr>
                                <th>Student Name</th>
                                <th>Class</th>
                                <th>Amount Paid</th>
                                <th>Payment Date</th>
                                <th>Payment Mode</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Aarav Singh</td>
                                <td>10 A</td>
                                <td>₹12,000</td>
                                <td>12/07/2025</td>
                                <td>Online</td>
                            </tr>
                            <tr>
                                <td>Meera Jain</td>
                                <td>9 B</td>
                                <td>₹11,500</td>
                                <td>10/07/2025</td>
                                <td>Cash</td>
                            </tr>
                            <tr>
                                <td>Rahul Das</td>
                                <td>1</td>
                                <td>₹10,000</td>
                                <td>08/07/2025</td>
                                <td>UPI</td>
                            </tr>
                            <tr>
                                <td>Priya Nair</td>
                                <td>2 A</td>
                                <td>₹9,000</td>
                                <td>05/07/2025</td>
                                <td>Online</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="text-muted text-end">
                        * Owner can only view the payment details
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
