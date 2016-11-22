using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using XXI.Century.WebSite.Mappings;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Helpers;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.Admin.Orders
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
                    var order = _orderService.GetOrderByIdIncludeAddress(orderId);
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
            var orderCommodities = _orderService.GetOrderCommodityByOrderId(orderId);
            return OrderModelMapper.GetCartItems(orderCommodities);
        }

        public void SendOrder_Click(object sender, EventArgs eventArgs)
        {
            var localOrderId = long.Parse(HiddenOrderId.Value);
            _orderService.ChangeOrderStatus(localOrderId, OrderStatus.Delivery);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        public void DeliveredOrder_Click(object sender, EventArgs eventArgs)
        {
            var localOrderId = long.Parse(HiddenOrderId.Value);
            _orderService.ChangeOrderStatus(localOrderId, OrderStatus.Delivered);
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}