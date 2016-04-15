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
    class CarouselMap : EntityTypeConfiguration<CarouselEntity>
    {
        public CarouselMap()
        {
            ToTable("Carousel");
            HasKey(x => x.Id);
            Property(x => x.Id)
                .HasColumnName("Id")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
        }
    }
}
