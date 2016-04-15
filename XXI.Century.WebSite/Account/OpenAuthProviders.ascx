<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenAuthProviders.ascx.cs" Inherits="XXI.Century.WebSite.Account.OpenAuthProviders" %>

<div id="socialLoginList">
    <div class="signup-form">
        <!--sign up form-->
        <h2>Use another service to log in.</h2>
        <hr />
        <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
            SelectMethod="GetProviderNames" ViewStateMode="Disabled">
            <ItemTemplate>
                <p>
                    <button type="submit" class="btn btn-default" name="provider" value="<%#: Item %>"
                        title="Log in using your <%#: Item %> account.">
                        <%#: Item %>
                    </button>
                </p>
            </ItemTemplate>
            <EmptyDataTemplate>
                <div>
                    <p>There are no external authentication services configured. See <a href="http://go.microsoft.com/fwlink/?LinkId=252803">this article</a> for details on setting up this ASP.NET application to support logging in via external services.</p>
                </div>
            </EmptyDataTemplate>
        </asp:ListView>
    </div>
</div>
