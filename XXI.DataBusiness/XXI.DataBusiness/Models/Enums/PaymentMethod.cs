using System.ComponentModel;

namespace XXI.Centuty.DataBusiness.Models.Enums
{
    public enum PaymentMethod
    {
        [Description("Наличными")]
        InCash = 1,
        [Description("Картой")]
        InCart = 2
    }
}