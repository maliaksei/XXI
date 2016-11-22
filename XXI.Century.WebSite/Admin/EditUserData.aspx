<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditUserData.aspx.cs" Inherits="XXI.Century.WebSite.Admin.EditUserData" %>
<%@ Register TagPrefix="uc" TagName="UserMenu"
    Src="~\Controls\AdminAccountMenu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
             <uc:UserMenu id="Menu1"  runat="server" />
            <div class="col-sm-9 padding-right">
                <div class="blog-post-area">
                    <h2 class="title text-center">Контактная информация</h2>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputLastName" class="col-sm-2 control-label">Фамилия</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputLastName" placeholder="Фамилия" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputFirstName" class="col-sm-2 control-label">Имя</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputFirstName" placeholder="Имя" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPatronymic" class="col-sm-2 control-label">Отчество</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputPatronymic" placeholder="Отчество" runat="server"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPatronymic" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputEmail" placeholder="Email" runat="server" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <a class="btn btn-primary" OnServerClick="FormSubmit" runat="server">Сохранить</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
