<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="XXI.Century.WebSite.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <%--    <h2><%: Title %>.</h2>--%>
    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-sm-offset-1">
                <div class="login-form">
                    <!--login form-->
                    <h2>Login to your account</h2>
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <asp:TextBox runat="server" ID="Email" TextMode="Email" placeholder="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." SetFocusOnError="true" Display="Dynamic" />
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="Password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger"
                        ErrorMessage="The password field is required." SetFocusOnError="true" Display="Dynamic" />
                    <div>
                        <span>
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                        </span>
                    </div>
                    <a class="btn btn-primary" onserverclick="LogIn" runat="server">Log in</a>
                    <br/>
                    <br/>
                    <p>
                        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                    </p>
                </div>
                <!--/login form-->
            </div>

            <div class="col-sm-1">
                <h2 class="or">OR</h2>
            </div>
            <div class="col-sm-4">
                <div class="signup-form">
                    <section id="socialLoginForm">
                        <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
                    </section>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
