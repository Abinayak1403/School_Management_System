<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="YourNamespace.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>School Dashboard</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <style>
        body.dark-mode {
            background-color: #121212 !important;
            color: white !important;
        }

        .sidebar {
            height: 100vh;
            background-color: #343a40;
            color: white;
        }

        .sidebar a {
            color: white;
            display: block;
            padding: 12px;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        .topbar {
            background-color: #f8f9fa;
            padding: 10px;
        }

        .card-box {
            border-radius: 12px;
            padding: 20px;
            color: #fff;
        }

        .card-box i {
            font-size: 30px;
        }
    </style>
</head>
<body runat="server" id="body" class="bg-light">
    <form id="form1" runat="server">
        <div class="d-flex">
            <!-- Sidebar -->
            <div class="sidebar p-3">
                <h4 class="text-center mb-4">Codevocado Dashboard</h4>
                <a href="Dashboard.aspx"><i class="fas fa-home me-2"></i> Dashboard</a>
                <a href="Students.aspx"><i class="fas fa-user-graduate me-2"></i> Student</a>
                <a href="Teacher.aspx"><i class="fas fa-chalkboard-teacher me-2"></i> Teacher</a>
                <a href="Subject.aspx"><i class="fas fa-book me-2"></i> Subjects</a>
                <a href="StudentAttendance.aspx"><i class="fas fa-clipboard-check me-2"></i> Attendance</a>
                <a href="NoticeBoard.aspx"><i class="fas fa-bell me-2"></i> Notice Board</a>
                <a href="Reminders.aspx"><i class="fas fa-bell-slash me-2"></i> Reminders</a>
                <a href="TimeTable.aspx"><i class="fas fa-calendar-alt me-2"></i> Time Table</a>
                <a href="Syllabus.aspx"><i class="fas fa-file-alt me-2"></i> Syllabus</a>
                <a href="Notes.aspx"><i class="fas fa-sticky-note me-2"></i> Notes</a>
                <a href="Marks.aspx"><i class="fas fa-chart-line me-2"></i> Marks</a>
                <a href="BusService.aspx"><i class="fas fa-bus me-2"></i> Bus Service</a>
                <a href="Setting.aspx"><i class="fas fa-cogs me-2"></i> Settings</a>
                <a href="Login.aspx" class="text-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>

            <!-- Main Content -->
            <div class="flex-grow-1 p-4">
                <!-- Top Bar -->
                <div class="topbar d-flex justify-content-between align-items-center mb-4">
                    <div class="d-flex align-items-center gap-2">
                        <asp:TextBox ID="txtSearchTop" runat="server" CssClass="form-control" placeholder="Search..." />
                        <asp:Button ID="btnSearchTop" runat="server" Text="Search" CssClass="btn btn-outline-primary" />
                    </div>
                    <div>
                        <asp:Label ID="lblUser" runat="server" Text="Welcome, Admin!" CssClass="me-3 fw-bold"></asp:Label>
                        <asp:Button ID="btnToggleDark" runat="server" Text="Toggle Dark Mode" CssClass="btn btn-dark btn-sm" OnClick="btnToggleDark_Click" />
                    </div>
                </div>

                <!-- Success/Error Message -->
                <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-bold"></asp:Label>

                <!-- Analytics Cards -->
                <div class="row text-center mb-4">
                    <div class="col-md-3">
                        <div class="card-box bg-warning text-dark shadow-sm">
                            <i class="fas fa-user-graduate"></i>
                            <h5>Students</h5>
                            <asp:Label ID="lblStudentCount" runat="server" CssClass="fs-4 fw-bold" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card-box bg-primary text-white shadow-sm">
                            <i class="fas fa-chalkboard-teacher"></i>
                            <h5>Teachers</h5>
                            <asp:Label ID="lblTeacherCount" runat="server" CssClass="fs-4 fw-bold" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card-box bg-success text-white shadow-sm">
                            <i class="fas fa-book-open"></i>
                            <h5>Subjects</h5>
                            <asp:Label ID="lblSubjectCount" runat="server" CssClass="fs-4 fw-bold" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card-box bg-danger text-white shadow-sm">
                            <i class="fas fa-bullhorn"></i>
                            <h5>Notices</h5>
                            <asp:Label ID="lblNoticeCount" runat="server" CssClass="fs-4 fw-bold" />
                        </div>
                    </div>
                </div>

                <!-- Notices Table -->
                <h4>Latest Notices</h4>
                <asp:GridView ID="gvNotices" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Sender" HeaderText="Sender" />
                    </Columns>
                </asp:GridView>

                <!-- Reminders Summary -->
                <div class="col-md-4 mt-4">
                    <div class="card text-white bg-warning mb-3">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h5 class="card-title">Reminders</h5>
                                    <p class="card-text">
                                        <asp:Label ID="lblReminderCount" runat="server" Text="0" CssClass="fw-bold fs-4"></asp:Label>
                                    </p>
                                </div>
                                <i class="fas fa-bell fa-2x"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
