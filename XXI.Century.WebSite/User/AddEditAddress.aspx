<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEditAddress.aspx.cs" Inherits="XXI.Century.WebSite.User.AddEditAddress" %>
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
                    <h2 class="title text-center">Адрес</h2>
                    <div class="form-horizontal">
                        <asp:HiddenField runat="server" ID="HiddenIsEdit"/>
                        <asp:HiddenField runat="server" ID="HiddenAddressId"/>
                        <div class="form-group">
                            <label for="InputCountry" class="col-sm-2 control-label">Страна</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputCountry" placeholder="Страна" runat="server"/>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="InputCountry"
                                CssClass="text-danger" ErrorMessage="Поле не может быть пустым." SetFocusOnError="true" Display="Dynamic"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputCity" class="col-sm-2 control-label">Город</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputCity" placeholder="Город" runat="server"/>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="InputCity"
                                CssClass="text-danger" ErrorMessage="Поле не может быть пустым." SetFocusOnError="true" Display="Dynamic" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputStreet" class="col-sm-2 control-label">Улица</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputStreet" placeholder="Улица" runat="server"/>
                                 <asp:RequiredFieldValidator runat="server" ControlToValidate="InputStreet"
                                CssClass="text-danger" ErrorMessage="Поле не может быть пустым." SetFocusOnError="true" Display="Dynamic"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputHouse" class="col-sm-2 control-label">Дом</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputHouse" placeholder="Дом" runat="server"/>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="InputHouse"
                                CssClass="text-danger" ErrorMessage="Поле не может быть пустым." SetFocusOnError="true" Display="Dynamic"/>
                            </div>
                        </div>
                         <div class="form-group">
                            <label for="InputFlat" class="col-sm-2 control-label">Квартира</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputFlat" placeholder="Квартира" runat="server"/>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="InputFlat"
                                CssClass="text-danger" ErrorMessage="Поле не может быть пустым." SetFocusOnError="true" Display="Dynamic"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <a class="btn btn-primary" OnServerClick="FormSubmit" runat="server">Сохранить</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
