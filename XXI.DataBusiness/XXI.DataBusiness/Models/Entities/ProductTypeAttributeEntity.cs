using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace XXI.Centuty.DataBusiness.Models.Entities
{
    public class ProductTypeAttributeEntity : Entity
    {
        public long Id { get; set; }
        public long ProductTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public virtual ICollection<ProductTypeAttributeValueEntity> ProductTypeAttributeValues { get; set; } 
        public virtual ProductTypeEntity ProductType { get; set; } 
    }
}
