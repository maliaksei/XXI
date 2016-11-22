<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="XXI.Century.WebSite.Admin.Orders.OrderList" %>

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
                                <a href="/Manager/ManagerAccount">
                                    <span class="badge pull-right"></span>
                                    Мой профиль
                                </a>
                            </h4>
                        </div>
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="/Manager/ProductType/ProductTypes">
                                    <span class="badge pull-right"></span>
                                    Типы продуктов
                                </a>
                            </h4>
                        </div>
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="/Manager/Products/Products">
                                    <span class="badge pull-right"></span>
                                    Продукты
                                </a>
                            </h4>
                        </div>
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="/Manager/Orders/OrderList.aspx">
                                    <span class="badge pull-right"></span>
                                    Заказы
                                </a>
                            </h4>
                        </div>
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="/Manager/CarouselItems/CarouselItems.aspx">
                                    <span class="badge pull-right"></span>
                                    Карусель
                                </a>
                            </h4>
                        </div>
                    </div>
                    <!--/category-productsr-->
                </div>
            </div>
            <div class="col-sm-9 padding-right">
                <div class="blog-post-area">
                    <h2 class="title text-center">Заказы</h2>
                    <asp:HiddenField runat="server" ID="HiddenId" />
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Тип продукта</label>
                            <div class="col-sm-10">
                                <asp:DropDownList ItemType="System.Web.UI.WebControls.ListItem" runat="server" AutoPostBack="true" SelectMethod="GetOrderStatuses"
                                    ID="orderStatus" DataValueField="Value" DataTextField="Text" />
                            </div>
                        </div>
                    </div>
                    <asp:GridView ID="OrdersGrid" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="None" BorderWidth="0px"
                        ItemType="XXI.Centuty.DataBusiness.Models.Entities.OrderEntity" SelectMethod="GetOrders"
                        CssClass="table table-condensed"
                        EnablePaging="True"
                        AllowPaging="true"
                        AllowSorting="True"
                        DataKeyNames="Id"
                        PageSize="4">
                        <Columns>
                            <asp:TemplateField HeaderText="Адрес">
                                <ItemTemplate>
                                    <p><%#: Item.Address.AddressToString() %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Дата">
                                <ItemTemplate>
                                    <p><%#: Item.OrderDateTime %></p>
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
                                    <p><%#: Item.ShippingMethod.GetDescription() %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Способ оплаты">
                                <ItemTemplate>
                                    <p><%#: Item.PaymentMethod.GetDescription() %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <a id="editAddres" href="/Manager/Orders/OrderCommodities.aspx?OrderId=<%#:Item.Id %>">Подробнее</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
