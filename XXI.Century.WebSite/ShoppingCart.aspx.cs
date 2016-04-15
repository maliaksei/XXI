using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using XXI.Century.WebSite.Mappings;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Services;


namespace XXI.Century.WebSite
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        private readonly OrderService orderService;
        private readonly AddressService addressService;

        public ShoppingCart()
        {
            orderService = new OrderService();
            addressService = new AddressService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SelectAddres.Items.AddRange(
                    AddressModelMap.GetAddressListItems(addressService.GetAddresses(User.Identity.GetUserId<long>())));
                var user = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var phoneNumber = user.GetPhoneNumber(User.Identity.GetUserId<long>());
                Phone.Text = phoneNumber;
            }
        }

        public IEnumerable<OrderCommodityViewModel> GetShoppingCartItems()
        {
            var userId = User.Identity.GetUserId<long>();
            var order = orderService.GetInCardOrderCommodity(userId);
            return OrderModelMapper.GetCartItems(order);
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            CartList.ShowHeaderWhenEmpty = true;
            CartList.HeaderRow.TableSection = TableRowSection.TableHeader;
            CartList.UseAccessibleHeader = false;
            CartList.HeaderStyle.CssClass = "cart_menu";
            CartList.HeaderRow.Cells[0].CssClass = "image";
            CartList.HeaderRow.Cells[1].CssClass = "description";
            CartList.HeaderRow.Cells[2].CssClass = "price";
            CartList.HeaderRow.Cells[3].CssClass = "quantity";
            CartList.HeaderRow.Cells[4].CssClass = "total";

            for (int i = 0; i < CartList.Rows.Count; i++)
            {
                CartList.Rows[i].Cells[0].CssClass = "cart_product";
                CartList.Rows[i].Cells[1].CssClass = "cart_description";
                CartList.Rows[i].Cells[2].CssClass = "cart_price";
                CartList.Rows[i].Cells[3].CssClass = "cart_quantity";
                CartList.Rows[i].Cells[4].CssClass = "cart_total";
                CartList.Rows[i].Cells[5].CssClass = "cart_delete";
            }
        }

        public void CartList_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            //incase you need the row index 
            int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            int orderCommodityId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "DeleteRow")
            {
                orderService.DeleteOrderCommodityByCommodityId(orderCommodityId);

            }
            if (e.CommandName == "QuantityDown")
            {
                orderService.QuantityDown(orderCommodityId);
            }
            if (e.CommandName == "QuantityUp")
            {
                orderService.QuantityUp(orderCommodityId);
            }
            CartList.DataBind();
        }

        public void FormSubmit(object sender, EventArgs eventArgs)
        {
            var data = new ShoppingCartDataModel
            {
                AddresId = long.Parse(SelectAddres.Value),
                UserId = User.Identity.GetUserId<long>(),
                PaymentMethod = PaymentCard.Checked ? PaymentMethod.InCart : PaymentMethod.InCash,
                ShipingMethod = ShipingCourier.Checked ? ShipingMethod.ByCourier : ShipingMethod.ByPickup,
                PhoneNumber = int.Parse(Phone.Text)
            };
            orderService.CompleteOrder(data);
            Response.Redirect("ProductList.aspx");
        }
    }
}