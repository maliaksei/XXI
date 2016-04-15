using System.Collections.Generic;
using Repository.Pattern.Ef6;
using XXI.Centuty.DataBusiness.Models.Enums;

namespace XXI.Centuty.DataBusiness.Models.Entities
{
    public class ProductEntity : Entity
    {
        public ProductEntity()
        {
            OrderCommodities = new List<OrderCommodityEntity>();
            Categories = new List<CategoryEntity>();
            ProductAttributeValues = new List<ProductTypeAttributeValueEntity>();
            Reviews = new List<ReviewEntity>();
        }
        public long Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public double Price { get; set; }
        public long ProductTypeId { get; set; }
        public ProductStatus Status { get; set; }
        public virtual ICollection<OrderCommodityEntity> OrderCommodities { get; set; }
        public virtual ICollection<CategoryEntity> Categories { get; set; }
        public virtual ICollection<ProductTypeAttributeValueEntity> ProductAttributeValues { get; set; }
        public virtual ICollection<ReviewEntity> Reviews { get; set; }
        public virtual ProductTypeEntity ProductType { get; set; }
    }
}
