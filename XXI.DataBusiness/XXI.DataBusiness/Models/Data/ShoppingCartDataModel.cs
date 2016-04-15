using XXI.Centuty.DataBusiness.Models.Enums;

namespace XXI.Centuty.DataBusiness.Models.Data
{
    public class ShoppingCartDataModel
    {
        public long UserId { get; set; }
        public ShipingMethod ShipingMethod { get; set; }
        public PaymentMethod PaymentMethod { get; set; }
        public long AddresId { get; set; }

        public int PhoneNumber { get; set; }
    }
}