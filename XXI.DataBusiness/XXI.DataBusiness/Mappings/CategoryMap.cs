using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Mappings
{
    public class CategoryMap : EntityTypeConfiguration<CategoryEntity>
    {
        public CategoryMap()
        {
            ToTable("Category");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            HasRequired(t => t.Category)
                .WithMany(t => t.Categories).HasForeignKey(t => t.ParentCategoryId);
        }
    }
}
