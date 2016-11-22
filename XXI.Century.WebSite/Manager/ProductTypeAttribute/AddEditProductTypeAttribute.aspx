<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEditProductTypeAttribute.aspx.cs" Inherits="XXI.Century.WebSite.Manager.ProductTypeAttribute.AddEditProductTypeAttribute" %>
<%@ Register TagPrefix="uc" TagName="ManagerMenu"
    Src="~\Controls\ManagerAccountMenu.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <uc:ManagerMenu id="Menu1"  runat="server" />
            <div class="col-sm-9 padding-right">
                <div class="blog-post-area">
                    <h2 class="title text-center">Тип продукта</h2>
                    <div class="form-horizontal">
                        <asp:HiddenField runat="server" ID="HiddenProductTypeAttributeId" />
                        <asp:HiddenField runat="server" ID="HiddenProductTypeId" />
                        <div class="form-group">
                            <label for="InputName" class="col-sm-2 control-label">Название</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputName" placeholder="Название" runat="server" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="InputName"
                                    CssClass="text-danger" ErrorMessage="Поле не может быть пустым." />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputDescription" class="col-sm-2 control-label">Описание</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="InputDescription" placeholder="Описание" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <a class="btn btn-primary" onserverclick="FormSubmit" runat="server">Сохранить</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
