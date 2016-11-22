<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEditProductTypeAttribute.aspx.cs" Inherits="XXI.Century.WebSite.Admin.ProductTypeAttribute.AddEditProductTypeAttribute" %>

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
                    <h2 class="title text-center">Тип продукта</h2>
                    <div class="form-horizontal">
                        <asp:HiddenField runat="server" ID="HiddenProductTypeAttributeId" />
                        <asp:HiddenField runat="server" ID="HiddenProductTypeId" />
                        <div class="form-group">
                            <label for="InputName" class="col-sm-2 control-label">Название</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputName" placeholder="Название" runat="server" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="InputName"
                                    CssClass="text-danger" ErrorMessage="Поле не может быть пустым." />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputDescription" class="col-sm-2 control-label">Описание</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputDescription" placeholder="Описание" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <a class="btn btn-primary" onserverclick="FormSubmit" runat="server">Сохранить</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
