using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace XXI.Centuty.DataBusiness.Models.Entities
{
    public class ProductTypeEntity : Entity
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public virtual ICollection<ProductEntity> Products { get; set; } 
        public virtual ICollection<ProductTypeAttributeEntity> ProductTypeAttributes { get; set; } 
    }
}
