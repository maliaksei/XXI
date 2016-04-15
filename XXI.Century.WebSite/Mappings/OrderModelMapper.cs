using System.Collections.Generic;
using System.Linq;
using Microsoft.Ajax.Utilities;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Helpers;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Century.WebSite.Mappings
{
    public class OrderModelMapper
    {
        public static IEnumerable<OrderCommodityViewModel> GetCartItems(IQueryable<OrderCommodityEntity> orderCommodities)
        {
            var cartItems = new List<OrderCommodityViewModel>();
            if (orderCommodities == null || !orderCommodities.Any()) return cartItems;
            cartItems.AddRange(orderCommodities.Select(item => new OrderCommodityViewModel
            {
                ProductId = item.Product.Id,
                OrderCommodityId = item.Id,
                ProductName = item.Product.Name,
                PathImage = item.Product.Image,
                Price = item.Product.Price,
                Quantity = item.Count
            }));
            return cartItems;
        }
        public static IEnumerable<OrderItemViewModel> GetOrderItems(IEnumerable<OrderEntity> order)
        {
            var cartItems = new List<OrderItemViewModel>();
            if (!order.Any()) return cartItems;
            cartItems.AddRange(order.Select(item => new OrderItemViewModel
            {
                AddressDelivery = item.Address.AddressToString(),
                OderDate = item.OrderDateTime,
                PaymentMethod = item.PaymentMethod,
                Price = item.Price,
                Status = item.Status,
                PhoneNumber = item.PhoneNumber.ToString(),
                ShipingMethod = item.ShippingMethod,
                OrderId = item.Id
            }));
            return cartItems;
        }
    }
}