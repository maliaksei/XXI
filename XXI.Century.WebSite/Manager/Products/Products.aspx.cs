using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.Admin.Products
{
    public partial class Products : System.Web.UI.Page
    {
        private readonly ProductService _productService;

        public Products()
        {
            _productService = new ProductService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ProductEntity> GetPoducts()
        {
            return
                _productService.GetAllProductsByStatuses(new List<ProductStatus>
                {
                    ProductStatus.Active,
                    ProductStatus.WithoutAttributes
                });
        }

        protected void ProductList_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "DeleteRow")
            {
                _productService.ChangeProductStatus(productId, ProductStatus.Delete);

            }
            ProductList.DataBind();
        }
    }
}