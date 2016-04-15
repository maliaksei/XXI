using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Mappings
{
    class ProductTypeAttributeValueMap : EntityTypeConfiguration<ProductTypeAttributeValueEntity>
    {
        public ProductTypeAttributeValueMap()
        {
            ToTable("ProductTypeAttributeValue");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Relationships
            HasRequired(t => t.ProductTypeAttribute)
                .WithMany(t => t.ProductTypeAttributeValues).HasForeignKey(t => t.ProductTypeAttributeId);

            HasRequired(t => t.Product)
                .WithMany(t => t.ProductAttributeValues).HasForeignKey(t => t.ProductId);

           }
    }
}
