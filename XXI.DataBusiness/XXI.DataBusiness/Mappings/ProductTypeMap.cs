using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Mappings
{
    public class ProductTypeMap :  EntityTypeConfiguration<ProductTypeEntity>
    {
        public ProductTypeMap()
        {
            ToTable("ProductType");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Relationships
           HasMany(t => t.ProductTypeAttributes);
           HasMany(t => t.Products);
        }
    }
}
