using System.ComponentModel;

namespace XXI.Centuty.DataBusiness.Models.Enums
{
    public enum OrderStatus
    {
        [Description("В корзине")]
        InCart = 1,
        [Description("Созданный")]
        Issued = 2,
        [Description("Отправленный")]
        Delivery = 3,
        [Description("Доставленный")]
        Delivered = 4,
        [Description("Заверщенный")]
        Completed = 5
    }
}