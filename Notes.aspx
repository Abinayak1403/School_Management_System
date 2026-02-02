<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="YourNamespace.Notes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Notes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-4">
        <h2 class="mb-4 text-center">Upload Notes</h2>

        <div class="row mb-3">
            <div class="col-md-4">
                <label>Class</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <label>Subject</label>
                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <label>Title</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
            </div>
        </div>

        <div class="mb-3">
            <label>Upload Note (PDF/DOC)</label>
            <asp:FileUpload ID="fileNote" runat="server" CssClass="form-control" />
        </div>

        <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary mb-3" OnClick="btnUpload_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="fw-bold d-block mt-2"></asp:Label>

        <hr />

        <h4 class="mt-4">Uploaded Notes</h4>
        <asp:GridView ID="gvNotes" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="UploadDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:TemplateField HeaderText="Download">
                    <ItemTemplate>
                        <a href='<%# ResolveUrl(Eval("FilePath").ToString()) %>' target="_blank">View</a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%# Eval("NoteId") %>' OnClick="lnkDelete_Click" CssClass="btn btn-danger btn-sm">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
