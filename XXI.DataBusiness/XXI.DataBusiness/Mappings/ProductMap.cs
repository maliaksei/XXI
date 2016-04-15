using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Mappings
{
    public class ProductMap : EntityTypeConfiguration<ProductEntity>
    {
        public ProductMap()
        {
            ToTable("Product");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Relationships
            HasRequired(t => t.ProductType)
                .WithMany(t => t.Products).HasForeignKey(t => t.ProductTypeId);

            HasMany(i => i.Categories).WithMany(c => c.Products).Map(mc =>
            {
                mc.MapLeftKey("ProductId");
                mc.MapRightKey("CategoryId");
                mc.ToTable("ProductCategory");
            });

         
            HasMany(t => t.OrderCommodities);
            HasMany(t => t.Reviews);
        }
    }
}
