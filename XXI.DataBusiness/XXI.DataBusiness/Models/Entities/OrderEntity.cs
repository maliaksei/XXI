using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Models.Membership;

namespace XXI.Centuty.DataBusiness.Models.Entities
{
    public class OrderEntity : Entity
    {
        public long Id { get; set; }
        public long UserId { get; set; }
        public long? DeliveryAddresId { get; set; }
        public DateTime? OrderDateTime { get; set; }
        public OrderStatus Status { get; set; }
        public double Price { get; set; }
        public ShipingMethod? ShippingMethod { get; set; }
        public PaymentMethod? PaymentMethod { get; set; }
        public int? PhoneNumber { get; set; }
        public virtual AddressEntity Address { get; set; }
        public virtual ApplicationUser User { get; set; }
        public virtual ICollection<OrderCommodityEntity> OrderCommodities { get; set; }
    }
}
