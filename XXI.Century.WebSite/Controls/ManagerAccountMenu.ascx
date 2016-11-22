<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManagerAccountMenu.ascx.cs" Inherits="XXI.Century.WebSite.Controls.ManagerAccountMenu" %>
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
