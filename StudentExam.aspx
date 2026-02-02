<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentExamination.aspx.cs" Inherits="YourNamespace.StudentExamination" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Student Examination</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h3 class="mb-4">📊 Examination Results</h3>
        <asp:GridView ID="gvExams" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField HeaderText="Subject" DataField="SubjectName" />
                <asp:BoundField HeaderText="Exam Type" DataField="ExamType" />
                <asp:BoundField HeaderText="Marks" DataField="MarksDisplay" />
                <asp:BoundField HeaderText="Exam Date" DataField="ExamDate" DataFormatString="{0:dd-MM-yyyy}" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
