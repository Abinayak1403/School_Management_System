<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStudents.aspx.cs" Inherits="YourNamespace.ViewStudents" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="text-center mb-4">Student Records</h2>

        <div class="row mb-3">
            <div class="col-md-6">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by Name or Roll No" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary w-100" OnClick="btnSearch_Click" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary w-100" OnClick="btnClear_Click" />
            </div>
             <div class="col-md-2">
     <asp:Button ID="btnExport" runat="server" Text="Export" CssClass="btn btn-outline-dark w-100" OnClick="btnExport_Click" />
 </div>
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" AllowPaging="true" PageSize="5"
            OnPageIndexChanging="GridView1_PageIndexChanging" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
            OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="StudentId">
            <Columns>
                <asp:BoundField DataField="StudentId" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-primary me-1">
                            <i class="fas fa-edit"></i> Edit
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this student?');" CssClass="btn btn-sm btn-danger">
                            <i class="fas fa-trash-alt"></i> Delete
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-sm btn-success me-1">
                            <i class="fas fa-save"></i> Update
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary">
                            <i class="fas fa-times"></i> Cancel
                        </asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
