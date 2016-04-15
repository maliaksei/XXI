<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="XXI.Century.WebSite.ProductDetails" %>

<%@ Import Namespace="XXI.Century.WebSite.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="productDetail" runat="server" ItemType="XXI.Century.WebSite.Models.ProductDetailsViewModel" SelectMethod="GetProduct" RenderOuterTable="false">
        <ItemTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Category</h2>
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
                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="product-details">
                            <!--product-details-->
                            <div class="col-sm-5">
                                <div class="view-product">
                                    <img src="/Catalog/ProductImages/<%#:Item.ImagePath %>" alt="" />
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <div class="product-information">
                                    <!--/product-information-->
                                    <img src="/Content/images/product-details/new.jpg" class="newarrival" alt="" />
                                    <h2><%#:Item.ProductName %></h2>
                                    <p>Web ID: 1089772</p>
                                    <img src="" alt="" />
                                    <span>
                                        <span><%#:String.Format("{0:c}", Item.UnitPrice)%></span>
                                        <label>Quantity:</label>
                                        <input type="text" value="3" />
                                        <button type="button" class="btn btn-fefault cart">
                                            <i class="fa fa-shopping-cart"></i>
                                            Add to cart
                                        </button>
                                    </span>
                                    <p><b>Availability:</b> In Stock</p>
                                    <p><b>Condition:</b> New</p>
                                    <p><b>Brand:</b> E-Shop</p>
                                    <a href="">
                                        <img src="Content/images/product-details/share.png" class="share img-responsive" alt="" /></a>
                                </div>
                                <!--/product-information-->
                            </div>
                        </div>
                        <!--/product-details-->

                        <div class="category-tab shop-details-tab">
                            <!--category-tab-->
                            <div class="col-sm-12">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#details" data-toggle="tab">Details</a></li>
                                    <li><a href="#reviews" data-toggle="tab">Reviews</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="details">
                                    <div class="col-sm-12">
                                        <h4>Характеристики</h4>
                                        <table class="table table-striped">
                                            <tbody>
                                                <%
                                                    foreach (var game in ((ProductDetailsViewModel)productDetail.DataItem).Attributes)
                                                    {
                                                        Response.Write(String.Format(@"
                                                                                        <tr>
                                                                                            <td>{0}</td>
                                                                                            <td>{1}</td>
                                                                                        </tr>",
                                                            game.Key, game.Value));
                                                    }
                                                %>
                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade " id="reviews">
                                    <div class="col-sm-12">
                                        <%
                                            foreach (var review in ((ProductDetailsViewModel)productDetail.DataItem).Reviews)
                                            {
                                                Response.Write(String.Format(@"
                                                                                      <p><b>{0}</b></p>
                                                                                       <p>{1}</p>",
                                                    review.Key, review.Value));
                                            }
                                        %>

                                        <div class="col-sm-12">
                                            <p><b>Write Your Review</b></p>
                                            <div>
                                                <textarea name="" id="ReviewTextArea" runat="server"></textarea>
                                                <a class="btn btn-primary" onserverclick="SubmitReview" runat="server">Submit </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--/category-tab-->
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
