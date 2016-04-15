using System.ComponentModel;

namespace XXI.Centuty.DataBusiness.Models.Enums
{
    public enum ShipingMethod
    {
        [Description("Курьером")]
        ByCourier = 1,
        [Description("Самовывоз")]
        ByPickup = 2
    }
}