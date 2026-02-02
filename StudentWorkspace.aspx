<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentWorkspace.aspx.cs" Inherits="YourNamespace.StudentWorkspace" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Workspace</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h3 class="mb-4">📂 Student Workspace</h3>

        <!-- Notes Section -->
        <div class="row">
            <div class="col-md-8">
                <div class="card shadow-sm p-4">
                    <h5 class="mb-3"><i class="fas fa-sticky-note me-2 text-primary"></i> Available Notes</h5>
                    <asp:Repeater ID="rptNotes" runat="server">
                        <ItemTemplate>
                            <div class="border-bottom mb-3 pb-2">
                                <strong><%# Eval("Title") %></strong><br />
                                📘 Subject: <span class="text-muted"><%# Eval("SubjectName") %></span><br />
                                🏫 Class: <span class="text-muted"><%# Eval("ClassName") %></span><br />
                                📅 Date: <span class="text-muted"><%# Eval("UploadDate", "{0:dd MMM yyyy}") %></span><br />
                                🔗  <a href='<%# ResolveUrl(Eval("FilePath").ToString()) %>' target="_blank">Download PDF</a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
