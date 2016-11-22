<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductTypeAttriburtes.aspx.cs" Inherits="XXI.Century.WebSite.Manager.ProductTypeAttribute.ProductTypeAttriburtes" %>
<%@ Register TagPrefix="uc" TagName="ManagerMenu"
    Src="~\Controls\ManagerAccountMenu.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <uc:ManagerMenu id="Menu1"  runat="server" />
            <div class="col-sm-9 padding-right">
                <div class="blog-post-area">
                    <h2 class="title text-center">Типы продуктов</h2>
                    <asp:HiddenField runat="server" ID="HiddenId" />
                    <asp:GridView ID="ProductTypeAttributeList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="None" BorderWidth="0px"
                        ItemType="XXI.Centuty.DataBusiness.Models.Entities.ProductTypeAttributeEntity" SelectMethod="GetProductTypeAttributes"
                        CssClass="table table-condensed"
                        EnablePaging="True"
                        AllowPaging="true"
                        AllowSorting="True"
                        DataKeyNames="Name"
                        PageSize="4"
                        OnRowCommand="ProductTypeAttributeList_OnRowCommand_RowCommand">
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
                                    <a id="editProductType" href="/Manager/ProductTypeAttribute/AddEditProductTypeAttribute.aspx?Id=<%#:Item.Id %>&ProductTypeId=<%#: Item.ProductTypeId %>">Редактировать</a>
                                    <asp:LinkButton ID="lnkBtnDel" runat="server" CommandName="DeleteRow" OnClientClick="return confirm('Вы действительно хотите удалить запись?');" CommandArgument='<%#Eval("Id") %>'>Удалить</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <a class="btn btn-primary" runat="server" id="AddButton">Добавить</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
