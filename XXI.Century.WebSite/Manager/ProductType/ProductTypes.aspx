<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductTypes.aspx.cs" Inherits="XXI.Century.WebSite.Manager.ProductType.ProductTupes" %>
<%@ Register TagPrefix="uc" TagName="ManagerMenu"
    Src="~\Controls\ManagerAccountMenu.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <uc:ManagerMenu id="Menu1"  runat="server" />

            <div class="col-sm-9 padding-right">
                <div class="blog-post-area">
                    <h2 class="title text-center">Типы продуктов</h2>
                    <asp:GridView ID="ProductTypeList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="None" BorderWidth="0px"
                        ItemType="XXI.Centuty.DataBusiness.Models.Entities.ProductTypeEntity" SelectMethod="GetProductTypes"
                        CssClass="table table-condensed"
                        EnablePaging="True"
                        AllowPaging="true"
                        AllowSorting="True"
                        DataKeyNames="Name"
                        PageSize="4"
                        OnRowCommand="ProductTypeList_OnRowCommand_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Название">
                                <ItemTemplate>
                                    <p><%#: Item.Name %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Описание">
                                <ItemTemplate>
                                    <p><%#: Item.Description %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <a id="editProductType" href="/Manager/ProductType/AddEditProductType.aspx?Id=<%#:Item.Id %>">Редактировать</a>
                                    <asp:LinkButton ID="lnkBtnDel" runat="server" CommandName="DeleteRow" OnClientClick="return confirm('Вы действительно хотите удалить запись?');" CommandArgument='<%#Eval("Id") %>'>Удалить</asp:LinkButton>
                                    <a id="productTypeAttribute" href="/Manager/ProductTypeAttribute/ProductTypeAttriburtes.aspx?Id=<%#:Item.Id %>">Аттрибуты</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <a class="btn btn-primary" href="/Manager/ProductType/AddEditProductType.aspx">Добавить</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
