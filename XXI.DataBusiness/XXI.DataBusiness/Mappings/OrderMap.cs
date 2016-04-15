using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Mappings
{
    public class OrderMap : EntityTypeConfiguration<OrderEntity>
    {
        public OrderMap()
        {
            ToTable("Order");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Relationships
            HasRequired(t => t.User)
                .WithMany(t => t.Orders).HasForeignKey(t => t.UserId);
            HasRequired(t => t.Address)
                .WithMany(t => t.Orders).HasForeignKey(t => t.DeliveryAddresId);

            HasMany(t => t.OrderCommodities);
            
        }
       
    }
}
