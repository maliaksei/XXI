using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Mappings
{
    public class ProductTypeAttributeMap : EntityTypeConfiguration<ProductTypeAttributeEntity>
    {
        public ProductTypeAttributeMap()
        {
            ToTable("ProductTypeAttribute");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Relationships
            HasRequired(t => t.ProductType)
                .WithMany(t => t.ProductTypeAttributes).HasForeignKey(t => t.ProductTypeId);

           
            HasMany(t => t.ProductTypeAttributeValues);
        }
    }
}
