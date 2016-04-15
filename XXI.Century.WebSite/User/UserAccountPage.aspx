<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserAccountPage.aspx.cs" Inherits="XXI.Century.WebSite.UserAccountPage" %>

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
                            <label class="col-sm-2 control-label">Фамилия</label>
                            <div class="col-sm-10">
                                <p ID="TextForLastName" class="form-control-static" runat="server"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Имя</label>
                            <div class="col-sm-10">
                                <p ID="TextForFirstName" class="form-control-static" runat="server"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Отчество</label>
                            <div class="col-sm-10">
                                 <p ID="TextForPatronymic" class="form-control-static" runat="server"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                 <p ID="TextForEmail" class="form-control-static" runat="server"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <a class="btn btn-primary" href="/User/EditUserData.aspx">Редактиоровать</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
