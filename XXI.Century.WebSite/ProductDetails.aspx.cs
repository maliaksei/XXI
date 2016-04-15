using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using XXI.Century.WebSite.Mappings;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        private readonly ProductService productService;
        private readonly CategoryService categoryService;
        private readonly ReviewService _reviewService;
        private long productId { get; set; }

        public ProductDetails()
        {
            productService = new ProductService();
            categoryService = new CategoryService();
            _reviewService = new ReviewService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string host = HttpContext.Current.Request.Url.Segments.ToList().Last();
                long productTypeId;
                if (!String.IsNullOrEmpty(host) && long.TryParse(host, out productTypeId))
                {
                    productId = productTypeId;
                }
            }
        }

        protected void SubmitReview(object sender, EventArgs e)
        {
            var viewHoursPopup = productDetail.FindControl("ReviewTextArea") as HtmlTextArea;
            if(viewHoursPopup != null)
            {
               
                var userId = User.Identity.GetUserId<long>();
                var value = viewHoursPopup.Value;

                var reviewDataModel = new ReviewDataModel
                {
                    ProductId = productId,
                    Text = value,
                    UserId = userId
                };
                _reviewService.AddReview(reviewDataModel);
                Response.Redirect("~/Product/"+ productId);
            }
        }

        public string IsVisible()
        {
            return "hidden";
        }

        public ProductDetailsViewModel GetProduct([RouteData] string id)
        {
            long parseId;
            if (long.TryParse(id, out parseId))
            {
                productId = parseId;
                return ProductModelMapper.GetProductDetails(productService.GetProductById(parseId));
            }
            return null;
        }

        public IEnumerable<CategoryItemViewModel> GetCategories()
        {
            return CategoryModelMapper.GetCategoryItems(categoryService.GetAllCategory());
        }
    }
}