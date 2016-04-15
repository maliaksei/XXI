using System;
using System.Collections.Generic;
using XXI.Centuty.DataBusiness.Models.Enums;

namespace XXI.Century.WebSite.Models
{
    public class OrderItemViewModel
    {
        public long OrderId { get; set; }
        public string AddressDelivery { get; set; }
        public DateTime? OderDate { get; set; }
        public OrderStatus Status { get; set; }
        public double Price { get; set; }
        public ShipingMethod? ShipingMethod { get; set; }
        public PaymentMethod ?PaymentMethod { get; set; }
        public string PhoneNumber { get; set; }
    }
}