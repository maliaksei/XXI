<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditUserData.aspx.cs" Inherits="XXI.Century.WebSite.User.EditUserData" %>

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
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputLastName" class="col-sm-2 control-label">Фамилия</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputLastName" placeholder="Фамилия" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputFirstName" class="col-sm-2 control-label">Имя</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputFirstName" placeholder="Имя" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPatronymic" class="col-sm-2 control-label">Отчество</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputPatronymic" placeholder="Отчество" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPatronymic" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputEmail" placeholder="Email" runat="server" disabled/>
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
