<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProductAttributesValues.aspx.cs" Inherits="XXI.Century.WebSite.Admin.Products.AddProductAttributesValues" %>

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
                    <h2 class="title text-center">Добавление продукта</h2>
                    <div class="form-horizontal" runat="server" id="FormHorizontal">
                        <asp:HiddenField runat="server" ID="HiddenProductId" />
                        <asp:ListView ID="AttributeList" runat="server"
                            DataKeyNames="Id"
                            ItemType="XXI.Centuty.DataBusiness.Models.Entities.ProductTypeAttributeEntity" SelectMethod="GetAttrubutes">
                            <EmptyDataTemplate>
                                <table>
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <EmptyItemTemplate>
                                <td />
                            </EmptyItemTemplate>
                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server">
                                    <td id="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <ItemTemplate>
                                <div class="form-group">
                                    <label for="InputName" class="col-sm-4 control-label"><%#: Item.Name %></label>
                                    <div class="col-sm-8">
                                        <asp:TextBox class="form-control" ID="AttributeValue" attribyteId="<%#: Item.Id %>" placeholder="<%#: Item.Name %>" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="* Поле не может быть пустым." ControlToValidate="AttributeValue"
                                            SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table style="width: 100%;">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <table id="groupPlaceholderContainer" runat="server" style="width: 100%">
                                                    <tr id="groupPlaceholder"></tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                        <tr></tr>
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                        </asp:ListView>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <a class="btn btn-primary" onserverclick="FormSubmit" runat="server">Далее &rarr; </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
