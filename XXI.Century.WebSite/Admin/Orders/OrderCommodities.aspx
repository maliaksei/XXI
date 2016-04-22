<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderCommodities.aspx.cs" Inherits="XXI.Century.WebSite.Admin.Orders.OrderCommodities" %>

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
                                <a href="/Admin/AdminAccount">
                                    <span class="badge pull-right"></span>
                                    Мой профиль
                                </a>
                            </h4>
                        </div>
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="/Admin/ProductType/ProductTypes">
                                    <span class="badge pull-right"></span>
                                    Типы продуктов
                                </a>
                            </h4>
                        </div>
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="/Admin/Products/Products">
                                    <span class="badge pull-right"></span>
                                    Продукты
                                </a>
                            </h4>
                        </div>
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="/Admin/Orders/OrderList.aspx">
                                    <span class="badge pull-right"></span>
                                    Заказы
                                </a>
                            </h4>
                        </div>
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="/Admin/CarouselItems/CarouselItems.aspx">
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
                    <h2 class="title text-center">Информация о заказе</h2>
                    <asp:HiddenField runat="server" ID="HiddenOrderId"/>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Адес доставки</label>
                                    <div class="col-sm-8">
                                        <p id="TextForAddress" class="form-control-static" runat="server"></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Дата заказа</label>
                                    <div class="col-sm-8">
                                        <p id="TextForDate" class="form-control-static" runat="server"></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Статус заказа</label>
                                    <div class="col-sm-8">
                                        <p id="TextForStatus" class="form-control-static" runat="server"></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Стоимость заказа</label>
                                    <div class="col-sm-8">
                                        <p id="TextForPrice" class="form-control-static" runat="server"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">Способ доставки</label>
                                    <div class="col-sm-7">
                                        <p id="TextForShippingMethod" class="form-control-static" runat="server"></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">Способ оплаты</label>
                                    <div class="col-sm-7">
                                        <p id="TextForPaymentMethod" class="form-control-static" runat="server"></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">Номер телефона</label>
                                    <div class="col-sm-7">
                                        <p id="TextForPhoneNumber" class="form-control-static" runat="server"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:GridView ID="OrderCommodityList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="None" BorderWidth="0px"
                        ItemType="XXI.Century.WebSite.Models.OrderCommodityViewModel" SelectMethod="GetOrders"
                        CssClass="table table-condensed">
                        <Columns>
                            <asp:TemplateField HeaderText="Item">
                                <ItemTemplate>
                                    <a href="">
                                        <img class="table-img" alt="" src="/Catalog/ProductImages/<%#: Item.PathImage %>">
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <h4><a href=""><%#: Item.ProductName %></a></h4>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <p><%#: String.Format("{0:c}", Item.Price)%></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <div class="cart_quantity_button">
                                        <asp:TextBox ID="PurchaseQuantity" name="quantity" CssClass="cart_quantity_input" runat="server" autocomplete="off" size="2" Text="<%#: Item.Quantity %>"></asp:TextBox>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total">
                                <ItemTemplate>
                                    <p class="cart_total_price"><%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Price)))%></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                     <div>
                        <a class="btn btn-primary" onserverclick="SendOrder_Click" runat="server">Отправить заказ</a>
                    </div>
                    <div>
                        <a class="btn btn-primary" onserverclick="DeliveredOrder_Click" runat="server">Отметить как доставленый</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
