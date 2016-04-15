<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminAccount.aspx.cs" Inherits="XXI.Century.WebSite.Admin.AdminAccount" %>

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
                                <p id="TextForLastName" class="form-control-static" runat="server"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Имя</label>
                            <div class="col-sm-10">
                                <p id="TextForFirstName" class="form-control-static" runat="server"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Отчество</label>
                            <div class="col-sm-10">
                                <p id="TextForPatronymic" class="form-control-static" runat="server"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <p id="TextForEmail" class="form-control-static" runat="server"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <a class="btn btn-primary" href="/Admin/EditUserData.aspx">Редактиоровать</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
