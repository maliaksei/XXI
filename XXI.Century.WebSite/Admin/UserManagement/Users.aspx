<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Users.aspx.cs" Inherits="XXI.Century.WebSite.Admin.UserManagement.Users" %>
<%@ Register TagPrefix="uc" TagName="AdminMenu"
    Src="~\Controls\AdminAccountMenu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <uc:AdminMenu id="Menu1"  runat="server" />

            <div class="col-sm-9 padding-right">
                <div class="blog-post-area">
                    <h2 class="title text-center">Типы продуктов</h2>
                    <asp:GridView ID="ProductTypeList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="None" BorderWidth="0px"
                        ItemType="XXI.Centuty.DataBusiness.Models.Membership.ApplicationUser" SelectMethod="GetUsers"
                        CssClass="table table-condensed"
                        EnablePaging="True"
                        AllowPaging="true"
                        AllowSorting="True"
                        DataKeyNames="Email"
                        PageSize="4"
                        OnRowCommand="ProductTypeList_OnRowCommand_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Электронный адрес">
                                <ItemTemplate>
                                    <p><%#: Item.Email %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Фамилия">
                                <ItemTemplate>
                                    <p><%#: Item.LastName %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Имя">
                                <ItemTemplate>
                                    <p><%#: Item.FirstName %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Отчество">
                                <ItemTemplate>
                                    <p><%#: Item.Patronymic %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Статус">
                                <ItemTemplate>
                                    <p><%#: Item.UserStatus %></p>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkBtnDel" runat="server" CommandName="DeleteRow" OnClientClick="return confirm('Вы действительно хотите удалить запись?');" CommandArgument='<%#Eval("Id") %>'>Удалить</asp:LinkButton>
                                    <asp:LinkButton ID="lnkBtnApprove" runat="server" CommandName="ApproveRow" OnClientClick="return confirm('Вы действительно хотите изменить статус пользователя?');" CommandArgument='<%#Eval("Id") %>'>Поддтердить регистрацию</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
