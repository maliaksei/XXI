using System;
using System.Diagnostics;
using Microsoft.AspNet.Identity;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite
{
    public partial class AddToCart : System.Web.UI.Page
    {
        private readonly OrderService orderService;
        public AddToCart()
        {
            orderService = new OrderService();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string rawId = Request.QueryString["ProductId"];
            long productId;
            if (!String.IsNullOrEmpty(rawId) && long.TryParse(rawId, out productId))
            {
                orderService.AddProductToCart(productId, User.Identity.GetUserId<long>());
            }
            else
            {
                Debug.Fail("ERROR : We should never get to AddToCart.aspx without a ProductId.");
                throw new Exception("ERROR : It is illegal to load AddToCart.aspx without setting a ProductId.");
            }
            Response.Redirect("ShoppingCart.aspx");
        }
    }
}