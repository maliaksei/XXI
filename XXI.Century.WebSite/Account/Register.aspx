<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="XXI.Century.WebSite.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-sm-offset-4">
                <div class="signup-form">

                    <h2><%: Title %>.</h2>
                    <p class="text-danger">
                        <asp:Literal runat="server" ID="ErrorMessage" />
                    </p>
                    <asp:TextBox runat="server" ID="Email" TextMode="Email" placeholder="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." SetFocusOnError="true" Display="Dynamic" />

                    <asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="Password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="The password field is required." SetFocusOnError="true" Display="Dynamic" />

                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" placeholder="Confirm password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." SetFocusOnError="true" />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." SetFocusOnError="true" />
                    <div>
                        <a class="btn btn-primary" onserverclick="CreateUser_Click" runat="server">Log in</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
