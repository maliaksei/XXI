using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace XXI.Centuty.DataBusiness.Models.Entities
{
    public class ProductTypeAttributeValueEntity:Entity
    {
        public long Id { get; set; }
        public long ProductTypeAttributeId { get; set; }
        public string ValueName { get; set; }
        public string ValueDescription { get; set; }
        public long ProductId { get; set; }
        public virtual ProductTypeAttributeEntity ProductTypeAttribute { get; set; }
        public virtual ProductEntity Product { get; set; }
    }
}
