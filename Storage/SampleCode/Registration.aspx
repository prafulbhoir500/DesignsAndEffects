<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Web.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title text-center">Registration</h5>
                            <div class="mb-3">
                                <label for="txtUsername">Username</label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtUsername_TextChanged"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="txtEmail">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-6">
                                            <label for="txtPassword">Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                      
                                
                            </div>
                            <div class="mb-3">
                                <label for="txtFullName">Full Name</label>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="ddlGender">Gender</label>
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="mb-3">
                                <label for="txtAddress">Address</label>
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
                            </div>
                            <div class="mb-3 text-end">
                                <asp:HyperLink ID="HLRegistration" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

