<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserAddressesDelivery.aspx.cs" Inherits="XXI.Century.WebSite.User.UserAddressesDelivery" %>

<%@ Import Namespace="System.Security.Policy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <h2>Меню</h2>
                    <div class="panel-group category-products" id="accordian">
                        <!--category-productsr-->
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="/User/UserAccountPage.aspx">
                                    <span class="badge pull-right"></span>
                                    Мой профиль
                                </a>
                            </h4>
                        </div>
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="/User/UserAddressesDelivery.aspx">
                                    <span class="badge pull-right"></span>
                                    Адреса доставки
                                </a>
                            </h4>
                        </div>
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="/User/Orders.aspx">
                                    <span class="badge pull-right"></span>
                                    Заказы
                                </a>
                            </h4>
                        </div>
                    </div>
                    <!--/category-productsr-->
                </div>
            </div>
            <div class="col-sm-9 padding-right">
                <div class="blog-post-area">
                    <h2 class="title text-center">Контактная информация</h2>
                    <div class="alert alert-danger" role="alert" runat="server" id="ErrorAlert" hidden>
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                        <span class="sr-only">Error:</span>
                        Адрес не может быть удален.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:GridView ID="AddressList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="None" BorderWidth="0px"
                        ItemType="XXI.Century.WebSite.Models.AddressItemViewModel" SelectMethod="GetAddressesItems"
                        CssClass="table table-condensed" OnRowCommand="AddressLis_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Страна">
                                <ItemTemplate>
                                    <p><%#: Item.Country %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Город">
                                <ItemTemplate>
                                    <p><%#: Item.City %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Улица">
                                <ItemTemplate>
                                    <p><%#: Item.Street %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Дом">
                                <ItemTemplate>
                                    <p><%#: Item.House %></p>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Квартира">
                                <ItemTemplate>
                                    <p><%#: Item.Flat %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkBtnDel" runat="server" CommandName="DeleteRow" OnClientClick="return confirm('Are you sure you want to Delete this Record?');" CommandArgument='<%#Eval("Id") %>'>Delete</asp:LinkButton>
                                    <%--<asp:LinkButton ID="lnkBtnEdit" runat="server" CommandName="EditRow" OnClientClick="return confirm('Are you sure you want to Delete this Record?');" CommandArgument='<%#Eval("Id") %>'>Edit</asp:LinkButton>--%>
                                    <a id="editAddres" href="/User/AddEditAddress.aspx?AddressId=<%#:Item.Id %>">Edit</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                   <a class="btn btn-primary" href="/User/AddEditAddress.aspx">Добавить</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
