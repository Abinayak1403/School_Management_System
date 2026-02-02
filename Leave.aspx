<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="YourNamespace.Leave" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leave Request</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h3 class="mb-4">Leave Application</h3>

            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="txtLeaveDate" class="form-label">Leave Date</label>
                    <asp:TextBox ID="txtLeaveDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="col-md-8">
                    <label for="txtLeaveReason" class="form-label">Reason</label>
                    <asp:TextBox ID="txtLeaveReason" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>
            </div>

            <asp:Button ID="btnSubmitLeave" runat="server" Text="Submit Leave" CssClass="btn btn-primary" OnClick="btnSubmitLeave_Click" />

            <hr class="my-4" />

            <h4>My Leave Requests</h4>
            <asp:GridView ID="gvLeaves" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="LeaveDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
.