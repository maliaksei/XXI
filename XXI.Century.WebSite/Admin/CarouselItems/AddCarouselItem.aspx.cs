using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.Admin.CarouselItems
{
    public partial class AddCarouselItem : System.Web.UI.Page
    {
        private readonly CarouselService _carouselService;

        public AddCarouselItem()
        {
            _carouselService = new CarouselService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormSubmit(object sender, EventArgs e)
        {
            Boolean fileOK = false;
            var imageFileName = CarouselImage.FileName;
            String path = Server.MapPath("~/Catalog/CarouselImages/");
            if (CarouselImage.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(imageFileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                        imageFileName = Guid.NewGuid() + fileExtension;
                        break;
                    }
                }
            }

            if (fileOK)
            {
                try
                {
                    // Save to Images folder.
                    CarouselImage.PostedFile.SaveAs(path + imageFileName);

                    var carouselDataModel = new CarouselDataModel
                    {
                        Text = Text.Value,
                        SubTitle = SubTitle.Value,
                        Tittle = Title.Value,
                        Image = imageFileName,
                        UrlToProdict = UrltoProject.Value,
                    };
                    var response = _carouselService.Add(carouselDataModel);
                    if (response.CompletedStatus == CompletedStatus.Successed)
                    {
                        var productId = (long)response.Data;
                        Response.Redirect("/Admin/CarouselItems/CarouselItems.aspx", false);
                    }
                    else
                    {
                        System.IO.File.Delete(path + imageFileName);
                        LabelAddStatus.Text = "Unable to add new product to database.";
                    }
                }
                catch (Exception ex)
                {
                    System.IO.File.Delete(path + imageFileName);
                    LabelAddStatus.Text = ex.Message;
                }

                // Add product data to DB.

            }
            else
            {
                LabelAddStatus.Text = "Unable to accept file type.";
            }
        }
    }
}