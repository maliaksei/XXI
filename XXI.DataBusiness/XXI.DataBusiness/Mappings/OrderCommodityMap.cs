using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Mappings
{
    public class OrderCommodityMap : EntityTypeConfiguration<OrderCommodityEntity>
    {
        public OrderCommodityMap()
        {
            ToTable("OrderCommodity");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Relationships
            HasRequired(t => t.Order)
                .WithMany(t => t.OrderCommodities).HasForeignKey(t => t.OrderId);
            HasRequired(t => t.Product)
                .WithMany(t => t.OrderCommodities).HasForeignKey(t => t.ProductId);
        }
    }
}
