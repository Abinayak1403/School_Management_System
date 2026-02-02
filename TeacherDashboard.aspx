<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherDashboard.aspx.cs" Inherits="YourNamespace.TeacherDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f1f1f1;
        }
        .sidebar {
            background-color: white;
            height: 100vh;
            padding-top: 20px;
            border-right: 1px solid #ddd;
        }
        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #333;
            text-decoration: none;
        }
        .sidebar a:hover, .sidebar a.active {
            background-color: #e5f0ff;
            color: #0d6efd;
            font-weight: bold;
        }
        .analytics-card {
            border-radius: 10px;
            padding: 20px;
            color: white;
            font-size: 1.2rem;
        }
        .notice-dot {
            height: 10px;
            width: 10px;
            border-radius: 50%;
            display: inline-block;
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2 sidebar">
                    <h4 class="text-center mb-4">Teacher Pannel</h4>
                    <a href="TeacherDashboard.aspx" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
                    <a href="Students.aspx"><i class="fas fa-user-graduate"></i> Student</a>
                    <a href="StudentAttendance.aspx"><i class="fas fa-calendar-check"></i> Attendance</a>
                    <a href="NoticeBoard.aspx"><i class="fas fa-bullhorn"></i> Notice Board</a>
                    <a href="TimeTableT.aspx"><i class="fas fa-table"></i> Time Table</a>
                    <a href="Syllabus.aspx"><i class="fas fa-book"></i> Syllabus</a>
                    <a href="Notes.aspx"><i class="fas fa-sticky-note"></i> Notes</a>
                    <a href="Marks.aspx"><i class="fas fa-clipboard-check"></i> Marks</a>
                    <a href="Leave.aspx"><i class="fas fa-suitcase-rolling"></i> Leaves</a>
                    <a href="Setting1.aspx"><i class="fas fa-cogs"></i> Settings</a>
                    <a href="Login.aspx" class="text-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </div>

                <!-- Main Content -->
                <div class="col-md-10 p-4">
                    <h3 class="mb-4">Welcome,Teacher</h3>

                    <!-- Analytics -->
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="analytics-card bg-primary text-white text-center">
                                <i class="fas fa-chalkboard-teacher fa-2x"></i><br />
                                <strong><asp:Label ID="lblTeacherCount" runat="server" Text="2" /></strong><br />
                                Teachers
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="analytics-card bg-warning text-white text-center">
                                <i class="fas fa-user-graduate fa-2x"></i><br />
                                <strong><asp:Label ID="lblStudentCount" runat="server" Text="3" /></strong><br />
                                Students
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="analytics-card bg-success text-white text-center">
                                <i class="fas fa-sticky-note fa-2x"></i><br />
                                <strong><asp:Label ID="lblNotesCount" runat="server" Text="1" /></strong><br />
                                Notes
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="analytics-card bg-danger text-white text-center">
                                <i class="fas fa-bullhorn fa-2x"></i><br />
                                <strong><asp:Label ID="lblNoticesCount" runat="server" Text="6" /></strong><br />
                                Notices
                            </div>
                        </div>
                    </div>

                    <!-- Latest Notices and Reminders -->
                    <div class="row">
                        <!-- Notices -->
                        <div class="col-md-7 mb-4">
                            <div class="card shadow">
                                <div class="card-header bg-white">
                                    <h5>Latest Notices</h5>
                                </div>
                                <div class="card-body">
                                    <asp:GridView ID="gvNotices" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Title">
                                                <ItemTemplate>
                                                    <span class="notice-dot bg-warning"></span>
                                                    <%# Eval("Title") %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Date" DataField="Date" DataFormatString="{0:dd MMM, yyyy}" />
                                            <asp:BoundField HeaderText="Sender" DataField="Sender" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>

                        <!-- Reminders -->
                        <asp:TextBox ID="txtReminder" runat="server" CssClass="form-control" placeholder="Enter new reminder" />
<asp:Button ID="btnAddReminder" runat="server" Text="Add" CssClass="btn btn-success mt-2" OnClick="btnAddReminder_Click" />

<asp:Repeater ID="rptReminders" runat="server" OnItemCommand="rptReminders_ItemCommand">
    <ItemTemplate>
        <div class="alert alert-info d-flex justify-content-between align-items-center">
            <%# Eval("Message") %>
            <asp:Button ID="btnDelete" runat="server" CssClass="btn-close" CommandName="DeleteReminder" CommandArgument='<%# Eval("ReminderId") %>' />
        </div>
    </ItemTemplate>
</asp:Repeater>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
