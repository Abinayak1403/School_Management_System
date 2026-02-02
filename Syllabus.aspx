<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Syllabus.aspx.cs" Inherits="YourNamespace.Syllabus" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Syllabus Upload</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="text-center mb-4">Upload Syllabus</h2>

        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Class</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <label class="form-label">Subject</label>
                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-4">
                <label class="form-label">Upload Date</label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" />
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Syllabus Title</label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label class="form-label">Upload PDF</label>
            <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Button ID="btnSubmit" runat="server" Text="Add Syllabus" CssClass="btn btn-success" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="ms-3 fw-bold"></asp:Label>
        </div>

        <hr />

        <h4>Uploaded Syllabus</h4>
        <asp:GridView ID="gvSyllabus" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="SyllabusTitle" HeaderText="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="UploadDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:TemplateField HeaderText="PDF">
                    <ItemTemplate>
    <a href='<%# ResolveUrl(Eval("FilePath").ToString()) %>' target="_blank">F</a>
</ItemTemplate>

                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
