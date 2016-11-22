<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCarouselItem.aspx.cs" Inherits="XXI.Century.WebSite.Manager.CarouselItems.AddCarouselItem" %>
<%@ Register TagPrefix="uc" TagName="ManagerMenu"
    Src="~\Controls\ManagerAccountMenu.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
           <uc:ManagerMenu id="Menu1"  runat="server" />
            <div class="col-sm-9 padding-right">
                <div class="blog-post-area">
                    <h2 class="title text-center">Добавление в карусель</h2>
                    <div class="form-horizontal" runat="server" id="FormHorizontal">
                        <div class="form-group">
                            <label for="Title" class="col-sm-2 control-label">Заголовок</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="Title" placeholder="Заголовок" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="* Поле не может быть пустым." ControlToValidate="Title"
                                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="SubTitle" class="col-sm-2 control-label">Подзаголовок</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="SubTitle" placeholder="Подзаголовок" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="* Поле не может быть пустым." ControlToValidate="SubTitle"
                                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Text" class="col-sm-2 control-label">Текст</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="Text" placeholder="Текст" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="* Поле не может быть пустым." ControlToValidate="Text"
                                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="UrltoProject" class="col-sm-2 control-label">URL продукта</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="UrltoProject" placeholder="URL продукта" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="* Поле не может быть пустым." ControlToValidate="UrltoProject"
                                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                      
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Изображение</label>
                            <div class="col-sm-10">
                                <asp:FileUpload ID="CarouselImage" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="* Файл не выбран." ControlToValidate="CarouselImage"
                                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <a class="btn btn-primary" onserverclick="FormSubmit" runat="server">Добавить </a>
                                <asp:Label ID="LabelAddStatus" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
