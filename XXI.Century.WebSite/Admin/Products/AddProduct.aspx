<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="XXI.Century.WebSite.Admin.Products.AddProduct" %>

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
                        <div class="form-group">
                            <label for="InputName" class="col-sm-2 control-label">Название</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputName" placeholder="Название" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="* Поле не может быть пустым." ControlToValidate="InputName"
                                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputDescription" class="col-sm-2 control-label">Описание</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputDescription" placeholder="Описание продукта" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="* Поле не может быть пустым." ControlToValidate="InputDescription"
                                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputPrice" class="col-sm-2 control-label">Цена</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputPrice" placeholder="Цена продукта" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="* Поле не может быть пустым." ControlToValidate="InputPrice"
                                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RequiredFieldValidator5" runat="server" Text="* Введите значение от 1 до 999999999." ControlToValidate="InputPrice"
                                    SetFocusOnError="true" Display="Dynamic" MinimumValue="1" MaximumValue="999999999"></asp:RangeValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="DropDownAddType" class="col-sm-2 control-label">Тип</label>
                            <div class="col-sm-10">
                                <asp:DropDownList ID="DropDownAddType" runat="server"
                                    ItemType="XXI.Centuty.DataBusiness.Models.Entities.ProductTypeEntity"
                                    SelectMethod="GetTypes" DataTextField="Name"
                                    DataValueField="Id">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="DropDownAddType" class="col-sm-2 control-label">Категория</label>
                            <div class="col-sm-10">
                                <asp:DropDownList ID="DropDownListCategory" runat="server"
                                    ItemType="XXI.Centuty.DataBusiness.Models.Entities.CategoryEntity"
                                    SelectMethod="GetCategories" DataTextField="Name"
                                    DataValueField="Id">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Изображение</label>
                            <div class="col-sm-10">
                                <asp:FileUpload ID="ProductImage" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="* Файл не выбран." ControlToValidate="ProductImage"
                                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <a class="btn btn-primary" onserverclick="FormSubmit" runat="server">Далее &rarr; </a>
                                <asp:Label ID="LabelAddStatus" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
