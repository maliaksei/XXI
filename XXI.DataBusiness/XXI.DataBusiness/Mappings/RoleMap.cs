namespace XXI.Centuty.DataBusiness.Mappings
{
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.ModelConfiguration;
    using Models.Entities;

    public class RoleMap : EntityTypeConfiguration<RoleEntity>
    {
        public RoleMap()
        {
            ToTable("Role");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Relationships

            HasMany(i => i.User).WithMany(c => c.Role).Map(mc =>
            {
                mc.MapRightKey("UserId");
                mc.MapLeftKey("RoleId");
                mc.ToTable("UserRole");
            });
        }
    }
}