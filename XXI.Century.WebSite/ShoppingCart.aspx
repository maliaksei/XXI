<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="XXI.Century.WebSite.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Shopping Cart</li>
                </ol>
            </div>
            <div class="table-responsive cart_info">
                <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="None" BorderWidth="0px"
                    ItemType="XXI.Century.WebSite.Models.OrderCommodityViewModel" SelectMethod="GetShoppingCartItems"
                    CssClass="table table-condensed" OnRowCommand="CartList_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Элемент">
                            <ItemTemplate>
                                <a href="">
                                    <img class="cart-roduct-img" alt="" src="/Catalog/ProductImages/<%#: Item.PathImage %>">
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <h4><a href=""><%#: Item.ProductName %></a></h4>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Цена">
                            <ItemTemplate>
                                <p><%#: String.Format("{0:c}", Item.Price)%></p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Количество">
                            <ItemTemplate>
                                <div class="cart_quantity_button">
                                    <asp:LinkButton ID="lnkBtnDown" CssClass="cart_quantity_down" runat="server" CommandName="QuantityDown" CommandArgument='<%#Eval("OrderCommodityId") %>'>-</asp:LinkButton>
                                    <asp:TextBox ID="PurchaseQuantity" name="quantity" CssClass="cart_quantity_input" runat="server" autocomplete="off" size="2" Text="<%#: Item.Quantity %>"></asp:TextBox>
                                    <asp:LinkButton ID="lnkBtnUp" CssClass="cart_quantity_up" runat="server" CommandName="QuantityUp" CommandArgument='<%#Eval("OrderCommodityId") %>'>+</asp:LinkButton>

                                </div>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Всего">
                            <ItemTemplate>
                                <p class="cart_total_price"><%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Price)))%></p>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkBtnDel" runat="server" CommandName="DeleteRow" OnClientClick="return confirm('Are you sure you want to Delete this Record?');" CommandArgument='<%#Eval("OrderCommodityId") %>'>Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </section>
    <!--/#cart_items-->

    <section id="do_action">
        <div class="container">
            <div class="heading">
                <h3>Доставка и способы оплаты</h3>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="chose_area">
                        <h4 class="user_option">Доставка:</h4>
                        <ul class="user_option">
                            <li>
                                <asp:RadioButton ID="ShipingCourier" runat="server" GroupName="delivery" Checked="true"/>
                                <label>Курьером</label>
                            </li>
                            <li>
                                <asp:RadioButton ID="ShipingPickup" runat="server" GroupName="delivery" />
                                <label>Самовывоз</label>
                            </li>
                        </ul>
                        <ul class="user_info">
                            <li class="single_field">
                                <label>Адрес:</label>
                                <select id="SelectAddres" runat="server">
                                   
                                </select>
                            </li>
                            <li class="single_field">
                                <label>Телефон:</label>
                                <asp:TextBox ID="Phone" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="* Поле не может быть пустым." ControlToValidate="Phone"
                                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="chose_area">
                        <h4 class="user_option">Способы оплаты:</h4>
                        <ul class="user_option">
                            <li>
                                <asp:RadioButton ID="PaymentCash" runat="server" GroupName="payment" Checked="True"/>
                                <label>Наличными</label>
                            </li>
                            <li>
                                <asp:RadioButton ID="PaymentCard" runat="server" GroupName="payment" />
                                <label>Пластиковой картой</label>
                            </li>
                        </ul>

                        <h4 class="user_option">Комментарий:</h4>
                        <ul class="user_option">
                            <li>
                                <textarea name=""></textarea>
                            </li>
                        </ul>

                    </div>
                    <a class="btn btn-default update" ID="BtnSubmit" runat="server" OnServerClick="FormSubmit">Оформить заказ</a>
                </div>

            </div>
        </div>
    </section>
    <!--/#do_action-->


</asp:Content>
