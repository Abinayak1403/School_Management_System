<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentDashboard.aspx.cs" Inherits="YourNamespace.StudentDashboard" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Chart.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
        }

        .sidebar {
            height: 100vh;
            background-color: #343a40;
            padding-top: 20px;
            position: fixed;
            width: 220px;
            color: #fff;
        }

        .sidebar a {
            color: #fff;
            display: block;
            padding: 10px 20px;
            text-decoration: none;
            margin-bottom: 5px;
        }

        .sidebar a:hover {
            background-color: #495057;
            border-radius: 4px;
        }

        .main-content {
            margin-left: 240px;
            padding: 20px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .dashboard-box {
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            height: 100%;
        }

        .title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .pie-legend span {
            display: inline-block;
            margin-right: 15px;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h5 class="text-center">📚 Student Panel</h5>
        <a href="index.aspx">🏠 Home</a>
        <a href="StudentTimeTable.aspx">📅 Time Table</a>
        <a href="StudentExam.aspx">📝 Examination</a>
        <a href="StudentWorkspace.aspx">💼 Workspace</a>
        <a href="ChangePassword.aspx">🔑 Change Password</a>
        <a href="Logout.aspx">🚪 Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h3>👋 Hey, Student</h3>

        <div class="row g-4 mt-3">
            <!-- Student Details -->
            <div class="col-md-4">
                <div class="card p-3">
                    <p><strong>ID:</strong> <asp:Label ID="lblStudentId" runat="server" /></p>
                    <p><strong>Roll No:</strong> <asp:Label ID="lblClass" runat="server" /></p>
                    <p><strong>DOB:</strong> <asp:Label ID="lblDOB" runat="server" /></p>
                    <p><strong>Contact:</strong> <asp:Label ID="lblContact" runat="server" /></p>
                    <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
                    <p><strong>Address:</strong> <asp:Label ID="lblAddress" runat="server" /></p>

                    <hr />
                    <p>🚍 <strong>Bus Panel</strong></p>
                    <a href="Bus.aspx" class="btn btn-primary btn-sm mb-2 w-100">View Bus Details</a>

                    <p>💰 <strong>Pay Fee</strong></p>
                    <a href="FessStudent.aspx" class="btn btn-warning btn-sm w-100">Go to Payment</a>
                </div>
            </div>

            <!-- Attendance Chart -->
            <div class="col-md-4">
                <div class="card p-4 text-center">
                    <h5 class="mb-3">📊 Attendance Overview</h5>
                    <canvas id="attendanceChart" style="height:260px;"></canvas>
                    <div class="pie-legend mt-3">
                        <span class="text-success">✔ Present: 75%</span>
                        <span class="text-danger">✘ Absent: 25%</span>
                    </div>
                    <a href="StudentViewAtt.aspx" class="btn btn-outline-secondary btn-sm mt-3">
                                <i class="fa fa-calendar-check"></i> View Full Attendance
                            </a>
                </div>
            </div>

            <!-- Notice Board -->
            <div class="col-md-4">
                <div class="dashboard-box">
                    <div class="title">🗒️ Notices</div>
                    <asp:Repeater ID="rptNotices" runat="server">
                        <ItemTemplate>
                            <div class="mb-2">
                                <b><%# Eval("Title") %></b><br />
                                <small><%# Eval("Date") %></small><br />
                                <i><%# Eval("Sender") %></i>
                                <hr />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>

        <!-- Extra Info Cards -->
 


        <div class="row g-4 mt-4">
            <div class="col-md-4">
                <div class="card p-3">
                    <h6>📘 Syllabus</h6>
                    <asp:Repeater ID="rptSyllabus" runat="server">
                        <ItemTemplate>
                            <div class="mb-2">
                                <a href="StudentSyllabus.aspx">
                                    <i class="fas fa-book-open me-2"></i>Syllabus for <%# Eval("SubjectId") %>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card p-3">
                <a href="ViewFeedback.aspx" class="nav-link fw-semibold">
                                <i class="fa fa-comment"></i> Feedback
                            </a>

                </div>
            </div>

            <div class="col-md-4">
                <div class="card p-3">
                    <h6>🧾 Student Details Summary</h6>
                    <p>Basic details are visible here. For updates, contact your class mentor.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Chart Script -->
    <script>
        const ctx = document.getElementById('attendanceChart').getContext('2d');
        new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['Present', 'Absent'],
                datasets: [{
                    data: [75, 25],
                    backgroundColor: ['#28a745', '#dc3545']
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    }
                }
            }
        });
    </script>
</body>
</html>
