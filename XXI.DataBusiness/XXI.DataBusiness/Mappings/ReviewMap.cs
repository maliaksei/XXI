using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Mappings
{
    public class ReviewMap : EntityTypeConfiguration<ReviewEntity>
    {
        public ReviewMap()
        {
            ToTable("Review");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Relationships

            HasRequired(t => t.Product)
              .WithMany(t => t.Reviews).HasForeignKey(t => t.ProductId);
            HasRequired(t => t.User)
                .WithMany(t => t.Reviews).HasForeignKey(t => t.UserId);
        }
    }
}
