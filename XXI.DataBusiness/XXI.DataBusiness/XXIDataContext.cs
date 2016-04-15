using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using Repository.Pattern.Ef6;
using XXI.Centuty.DataBusiness.Mappings;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Models.Membership;

namespace XXI.Centuty.DataBusiness
{
    public class XXIDataContext : DataContext
    {
        static XXIDataContext()
        {
            Database.SetInitializer(new CreateDatabaseIfNotExists<ApplicationDbContext>());
        }
        public XXIDataContext()
            : base("MyIdentityDbContext")
        {
        }
       
        public DbSet<AddressEntity> Addresses { get; set; }
        public DbSet<CategoryEntity> Category { get; set; }
        public DbSet<OrderCommodityEntity> OrderCommodity { get; set; }
        public DbSet<OrderEntity> Order { get; set; }
        public DbSet<ProductEntity> Product { get; set; }
        public DbSet<ProductTypeAttributeEntity> ProductTypeAttribute { get; set; }
        public DbSet<ProductTypeAttributeValueEntity> ProductTypeAttributeValue { get; set; }
        public DbSet<ProductTypeEntity> ProductTypeEntities { get; set; }



        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            modelBuilder.Configurations.Add(new AddressMap());
            modelBuilder.Configurations.Add(new CarouselMap());
            modelBuilder.Configurations.Add(new CategoryMap());
            modelBuilder.Configurations.Add(new OrderCommodityMap());
            modelBuilder.Configurations.Add(new OrderMap());
            modelBuilder.Configurations.Add(new ProductMap());
            modelBuilder.Configurations.Add(new ReviewMap());
            modelBuilder.Configurations.Add(new ProductTypeAttributeMap());
            modelBuilder.Configurations.Add(new ProductTypeAttributeValueMap());
            modelBuilder.Configurations.Add(new ProductTypeMap());

            modelBuilder.Entity<ApplicationUser>().ToTable("User")
                .Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            modelBuilder.Entity<ApplicationRole>().ToTable("Role")
                .Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            modelBuilder.Entity<ApplicationUserClaim>().ToTable("UserClaim")
                .Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            modelBuilder.Entity<ApplicationUserRole>().ToTable("UserRole");
            modelBuilder.Entity<ApplicationUserLogin>().ToTable("UserLogin");
            
            modelBuilder.Entity<ApplicationUserLogin>().HasKey<long>(l => l.UserId);
            modelBuilder.Entity<ApplicationUserLogin>().HasKey<string>(l => l.LoginProvider);
            modelBuilder.Entity<ApplicationUserLogin>().HasKey<string>(l => l.ProviderKey);

            modelBuilder.Entity<ApplicationUserRole>().HasKey(r => new { r.RoleId, r.UserId });

            modelBuilder.Entity<ApplicationUser>().HasMany(x => x.Addresses);
            modelBuilder.Entity<ApplicationUser>().HasMany(x => x.Orders);
        }
    }
}
