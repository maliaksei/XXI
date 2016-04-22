<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarouselItems.aspx.cs" Inherits="XXI.Century.WebSite.Admin.CarouselItems.CarouselItems" %>


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
                    <h2 class="title text-center">Элементы карусели</h2>
                    <asp:HiddenField runat="server" ID="HiddenId" />
                    <asp:GridView ID="ProductList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="None" BorderWidth="0px"
                        ItemType="XXI.Centuty.DataBusiness.Models.Entities.CarouselEntity" SelectMethod="GetCarouselItems"
                        CssClass="table table-condensed"
                        EnablePaging="True"
                        AllowPaging="true"
                        AllowSorting="True"
                        DataKeyNames="Id"
                        PageSize="4"
                        OnRowCommand="ProductList_OnRowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Заголовок">
                                <ItemTemplate>
                                    <p><%#: Item.Tittle %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Подзаголовок">
                                <ItemTemplate>
                                    <p><%#: Item.SubTitle %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkBtnDel" runat="server" CommandName="DeleteRow" OnClientClick="return confirm('Вы действительно хотите удалить запись?');" CommandArgument='<%#Eval("Id") %>'>Удалить</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <a class="btn btn-primary" href="/Admin/CarouselItems/AddCarouselItem.aspx" id="AddButton">Добавить</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

