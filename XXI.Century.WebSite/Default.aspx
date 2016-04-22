<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XXI.Century.WebSite._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section id="slider">
        <!--slider-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#slider-carousel" data-slide-to="1"></li>
                            <li data-target="#slider-carousel" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <asp:ListView ID="ListView1"
                                ItemType="XXI.Century.WebSite.Models.CarouselViewModel"
                                runat="server"
                                SelectMethod="GetCarouselItems">
                                <ItemTemplate>
                                    <div class="item <%#: Item.Active %>">
                                        <div class="col-sm-6">
                                            <h1><%#: Item.Tittle %></h1>
                                            <h2><%#: Item.SubTitle %></h2>
                                            <p><%#: Item.Text %> </p>
                                            <a href="<%#: Item.UrlToProdict %>" class="btn btn-default get">Get it now</a>
                                        </div>
                                        <div class="col-sm-6">
                                            <img src="/Catalog/CarouselImages/<%#:Item.Image%>"  class="girl img-carousel" alt="" /></a>
                                            <img src="Content/images/home/pricing.png" class="pricing" alt="" />
                                        </div>
                                    </div>
                                </ItemTemplate>

                                <ItemSeparatorTemplate></ItemSeparatorTemplate>
                            </asp:ListView>
                        </div>

                        <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!--/slider-->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="left-sidebar">
                        <h2>Категории</h2>
                        <div class="panel-group category-products" id="accordian">
                            <!--category-productsr-->
                            <asp:ListView ID="categoryList"
                                ItemType="XXI.Century.WebSite.Models.CategoryItemViewModel"
                                runat="server"
                                SelectMethod="GetCategories">
                                <ItemTemplate>
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a href="<%#: GetRouteUrl("ProductsByCategoryRoute", new {id = Item.Id}) %>">
                                                <span class="badge pull-right"></span>
                                                <%#: Item.Name %>
                                            </a>
                                        </h4>
                                    </div>
                                </ItemTemplate>
                                <ItemSeparatorTemplate></ItemSeparatorTemplate>
                            </asp:ListView>

                        </div>
                        <!--/category-productsr-->
                    </div>
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="features_items">
                        <!--features_items-->
                        <h2 class="title text-center">Продукты</h2>

                        <asp:ListView ID="productList" runat="server"
                            DataKeyNames="ProductId"
                            ItemType="XXI.Century.WebSite.Models.ProductItemViewModel" SelectMethod="GetProducts">
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
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href="<%#: GetRouteUrl("ProductByNameRoute", new {id = Item.ProductId}) %>">
                                                    <img src="/Catalog/ProductImages/<%#:Item.ImagePath%>" alt="" /></a>
                                                <h2><%#:String.Format("{0:c}", Item.UnitPrice)%></h2>
                                                <p><%#:Item.ProductName%></p>
                                                <a href="/AddToCart.aspx?productId=<%#:Item.ProductId %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </div>
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
                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="productList" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                            ShowNextPageButton="false" />
                                        <asp:NumericPagerField ButtonType="Link" />
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                                    </Fields>
                                </asp:DataPager>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
                    <!--features_items-->
                </div>
            </div>
            <div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-content">
                    <ul class="list-inline item-details">
                        <li><a href="http://themifycloud.com">ThemifyCloud</a></li>
                        <li><a href="http://themescloud.org">ThemesCloud</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
