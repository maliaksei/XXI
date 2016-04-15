using Repository.Pattern.Ef6;

namespace XXI.Centuty.DataBusiness.Models.Entities
{
    public class OrderCommodityEntity : Entity
    {
        public long Id { get; set; }
        public long OrderId { get; set; }
        public long ProductId { get; set; }
        public int Count { get; set; }
        public virtual OrderEntity Order { get; set; }
        public virtual ProductEntity Product { get; set; }
    }
}
