<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="XXI.Century.WebSite.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
                        ItemType="XXI.Century.WebSite.Models.ProductItemViewModel" SelectMethod="GetProducts"
                        >
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
</asp:Content>
