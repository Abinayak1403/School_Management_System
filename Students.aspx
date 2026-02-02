<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="YourNamespace.Student" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Module</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container text-center mt-5">
        <h2 class="mb-4">Student Module Dashboard</h2>

        <div class="d-grid gap-3 col-6 mx-auto">
            <a href="AddStudent.aspx" class="btn btn-success btn-lg">➕ Add Student</a>
            <a href="ViewStudent.aspx" class="btn btn-primary btn-lg">📋 View Students</a>
            <a href="GiveFeedback.aspx" class="btn btn-primary btn-lg">📣 Give Feedback to Student</a>
        </div>
    </form>
</body>
</html>
