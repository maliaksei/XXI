namespace XXI.Centuty.DataBusiness.Mappings
{
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.ModelConfiguration;
    using XXI.Centuty.DataBusiness.Models.Entities;

    public class UserMap : EntityTypeConfiguration<UserEntity>
    {
        public UserMap()
        {
            ToTable("User");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Relationships

            HasMany(i => i.Role).WithMany(c => c.User).Map(mc =>
            {
                mc.MapLeftKey("UserId");
                mc.MapRightKey("RoleId");
                mc.ToTable("UserRole");
            });

            HasMany(t => t.Address);
            HasMany(t => t.Order);
            HasMany(t => t.Review);
        }
    }
}