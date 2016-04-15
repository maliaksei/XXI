using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using XXI.Century.WebSite.Mappings;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite
{
    public partial class ProductList : System.Web.UI.Page
    {
        private readonly ProductService productService;
        private readonly CategoryService categoryService;

        public ProductList()
        {
            productService = new ProductService();
            categoryService = new CategoryService();
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

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            //(lvCustomers.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            //this.BindListView();
        }
    }
}