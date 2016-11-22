<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagerAccount.aspx.cs" Inherits="XXI.Century.WebSite.Manager.ManagerAccount" %>
<%@ Register TagPrefix="uc" TagName="ManagerMenu"
    Src="~\Controls\ManagerAccountMenu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <uc:ManagerMenu id="Menu1"  runat="server" />
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
                                <a class="btn btn-primary" href="/Manager/EditUserData.aspx">Редактиоровать</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
