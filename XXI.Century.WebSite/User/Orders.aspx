<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="XXI.Century.WebSite.User.Orders" %>
<%@ Import Namespace="XXI.Centuty.DataBusiness.Helpers" %>

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
                   <asp:GridView ID="OrderList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="None" BorderWidth="0px"
                    ItemType="XXI.Century.WebSite.Models.OrderItemViewModel" SelectMethod="GetOrders"
                    CssClass="table table-condensed" OnRowCommand="OrderList_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Адрес">
                            <ItemTemplate>
                              <p><%#: Item.AddressDelivery %></p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Дата">
                            <ItemTemplate>
                               <p><%#: Item.OderDate %></p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Статус">
                            <ItemTemplate>
                                <p><%#: Item.Status.GetDescription() %></p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Общая стоимость">
                            <ItemTemplate>
                               <p><%#: Item.Price %></p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Способ доставки">
                            <ItemTemplate>
                                <p><%#: Item.ShipingMethod.GetDescription() %></p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Способ оплаты">
                            <ItemTemplate>
                                <p><%#: Item.PaymentMethod.GetDescription() %></p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <a id="editAddres" href="/User/OrderCommodities.aspx?OrderId=<%#:Item.OrderId %>">Подробнее</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
