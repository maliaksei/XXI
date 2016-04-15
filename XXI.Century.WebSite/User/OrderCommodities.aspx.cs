using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using XXI.Century.WebSite.Mappings;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Helpers;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.User
{
    public partial class OrderCommodities : System.Web.UI.Page
    {
        public readonly OrderService _orderService;
        private long orderId;

        public OrderCommodities()
        {
            _orderService = new OrderService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string rawId = Request.QueryString["OrderId"];

                if (!String.IsNullOrEmpty(rawId) && long.TryParse(rawId, out orderId))
                {
                    var order = _orderService.GetOrderByIdAndUserIdIncludeAddress(orderId, User.Identity.GetUserId<long>());
                    if (order != null)
                    {
                        TextForAddress.InnerText = order.Address.AddressToString();
                        TextForDate.InnerText = order.OrderDateTime.ToString();
                        TextForPaymentMethod.InnerText = order.PaymentMethod.GetDescription();
                        TextForPhoneNumber.InnerText = order.PhoneNumber.ToString();
                        TextForPrice.InnerText = order.Price.ToString();
                        TextForShippingMethod.InnerText = order.ShippingMethod.GetDescription();
                        TextForStatus.InnerText = order.Status.GetDescription();
                        HiddenOrderId.Value = orderId.ToString();
                    }
                }
                else
                {
                    Response.Redirect("Orders.aspx");
                }
            }
        }

        public IEnumerable<OrderCommodityViewModel> GetOrders()
        {
            var userId = User.Identity.GetUserId<long>();
            var orderCommodities = _orderService.GetOrderCommodityByUserIdAndOrderId(userId, orderId);
            return OrderModelMapper.GetCartItems(orderCommodities);
        }
        public void CompletedOrder_Click(object sender, EventArgs eventArgs)
        {
            var localOrderId = long.Parse(HiddenOrderId.Value);
            _orderService.ChangeOrderStatus(localOrderId, OrderStatus.Completed);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
        public void OrderList_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            //incase you need the row index 
            int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            int orderCommodityId = Convert.ToInt32(e.CommandArgument);
            //if (e.CommandName == "DeleteRow")
            //{
            //    orderService.DeleteOrderCommodityByCommodityId(orderCommodityId);

            //}
            //if (e.CommandName == "QuantityDown")
            //{
            //    orderService.QuantityDown(orderCommodityId);
            //}
            //if (e.CommandName == "QuantityUp")
            //{
            //    orderService.QuantityUp(orderCommodityId);
            //}
            //CartList.DataBind();
        }
    }
}