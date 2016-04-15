using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Mappings
{
    public class AddressMap : EntityTypeConfiguration<AddressEntity>
    {
        public AddressMap()
        {
            ToTable("Address");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Relationships
            HasRequired(t => t.User)
                .WithMany(t => t.Addresses).HasForeignKey(t => t.UserId);

            HasMany(t => t.Orders);
        }
    }
}
