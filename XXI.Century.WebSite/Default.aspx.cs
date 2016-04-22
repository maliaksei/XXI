using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using XXI.Century.WebSite.Mappings;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite
{
    public partial class _Default : Page
    {
        private readonly ProductService productService;
        private readonly CategoryService categoryService;
        private readonly CarouselService carouselService;

        public _Default()
        {
            productService = new ProductService();
            categoryService = new CategoryService();
            carouselService = new CarouselService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        public IQueryable<ProductItemViewModel> GetProducts([RouteData] string id)
        {
            IQueryable<ProductEntity> products;
            long parseCategoryId;
            products = !long.TryParse(id, out parseCategoryId) ? productService.GetAllProductsByStatuses(new List<ProductStatus>{ProductStatus.Active}) : productService.GetProductsByCategoryId(parseCategoryId);
            return ProductModelMapper.GetProductItems(products);
        }

        public IEnumerable<CategoryItemViewModel> GetCategories()
        {
            return CategoryModelMapper.GetCategoryItems(categoryService.GetAllCategory());
        }

        public IEnumerable<CarouselViewModel> GetCarouselItems()
        {
            return CarouselModelMapper.GetcarouselItems(carouselService.GetAllService());
        }

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            //(lvCustomers.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            //this.BindListView();
        }
    }
}