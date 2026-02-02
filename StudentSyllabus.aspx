<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentSyllabus.aspx.cs" Inherits="YourNamespace.StudentSyllabus" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Syllabus</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h3 class="mb-4">Available Syllabus</h3>

       <!-- Syllabus -->
<div class="row">
    <div class="col-md-6 dashboard-box">
        <div class="title">📚 Syllabus</div>
        <asp:Repeater ID="rptSyllabus" runat="server">
            <ItemTemplate>
                <div class="mb-2">
                    <i class="fa fa-file-pdf text-danger icon"></i>
                    <%# Eval("SubjectId") %> - 
                    <a href='<%# ResolveUrl(Eval("FilePath").ToString()) %>' target="_blank">View</a>

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

    </form>
</body>
</html>
