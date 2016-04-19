using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.Admin.CarouselItems
{
    public partial class CarouselItems : System.Web.UI.Page
    {
        private readonly CarouselService _carouselService;

        public CarouselItems()
        {
            _carouselService = new CarouselService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<CarouselEntity> GetCarouselItems()
        {
            return _carouselService.GetAllService();
        }

        protected void ProductList_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
           
            if (e.CommandName == "DeleteRow")
            {
                var carouselModel = _carouselService.GetModelById(productId);
                String path = Server.MapPath("~/Catalog/CarouselImages/");

                var response = _carouselService.Delete(productId);
                if (response.CompletedStatus == CompletedStatus.Successed)
                {
                    System.IO.File.Delete(path + carouselModel.Image);
                }
                else
                {
                    //LabelAddStatus.Text = "Unable to add new product to database.";
                }
            }
            ProductList.DataBind();
        }
    }
}