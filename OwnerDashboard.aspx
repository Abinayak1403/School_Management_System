<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OwnerDashboard.aspx.cs" Inherits="YourNamespace.OwnerDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Owner Dashboard </title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
        }
        .sidebar {
            height: 100vh;
            background: #343a40;
            color: white;
            position: fixed;
            width: 250px;
        }
        .sidebar a {
            color: white;
            padding: 12px 20px;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover, .sidebar .active {
            background-color: #495057;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .card {
            border: none;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .topbar {
            background-color: #f8f9fa;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-left: 250px;
        }
        .dark-mode {
            background-color: #212529 !important;
            color: #fff !important;
        }
        .dark-mode .sidebar, .dark-mode .topbar {
            background-color: #1a1a1a !important;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="index.aspx" class="active"><h4 class="text-center py-3">Home</h4></a>

        <a href="OwnerDashboard.aspx" class="active"><i class="fas fa-home me-2"></i>Dashboard</a>
        <a href="ViewStudent.aspx"><i class="fas fa-user-graduate me-2"></i>Students</a>
        <a href="ViewTeacher.aspx"><i class="fas fa-chalkboard-teacher me-2"></i>Teachers</a>
        <a href="Subject.aspx"><i class="fas fa-book me-2"></i>Subjects</a>
        <a href="NoticeBoard.aspx"><i class="fas fa-clipboard me-2"></i>Notices</a>
            <a href="Payments.aspx"><i class="fas fa-clipboard me-2"></i>Payments</a>
        <a href="ChangePassword1.aspx"><i class="fas fa-key me-2"></i>Change Password</a>
        <a href="Logout.aspx"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
    </div>

    <!-- Topbar -->
    <div class="topbar d-flex align-items-center justify-content-between">
        <h5 class="m-0">Welcome, Owner</h5>
        <div>
            <button class="btn btn-sm btn-outline-dark me-2" onclick="toggleDarkMode()">🌙 Dark Mode</button>
        </div>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h3 class="mb-4">Dashboard Overview</h3>

        <div class="row g-4">
            <div class="col-md-3">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-user-graduate"></i> Students<a href="ViewStudent.aspx"></a></h5>
                        <h2><%= GetCount("Student") %></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-chalkboard-teacher"></i> Teachers</h5>
                        <h2><%= GetCount("Teacher") %></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-warning">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-book"></i> Subjects</h5>
                        <h2><%= GetCount("Subject") %></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-danger">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-clipboard"></i> Notices</h5>
                        <h2><%= GetCount("Notices") %></h2>
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-5">
            <h5>Reminders</h5>
            <ul class="list-group">
                <li class="list-group-item">Check student attendance summary</li>
                <li class="list-group-item">Review recent teacher activity</li>
                <li class="list-group-item">Update notices and announcements</li>
            </ul>
        </div>
    </div>

    <script>
        function toggleDarkMode() {
            document.body.classList.toggle('dark-mode');
        }
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
