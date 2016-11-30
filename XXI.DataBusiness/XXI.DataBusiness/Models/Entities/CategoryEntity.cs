using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace XXI.Centuty.DataBusiness.Models.Entities
{
    public class CategoryEntity : Entity
    {
        public CategoryEntity()
        {
            this.Categories = new HashSet<CategoryEntity>();
            this.Products = new HashSet<ProductEntity>();
        }

        public long Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public long? ParentCategoryId { get; set; }
        public virtual CategoryEntity Category { get; set; }
        public virtual ICollection<CategoryEntity> Categories { get; set; }
        public virtual ICollection<ProductEntity> Products { get; set; } 
    }
}
