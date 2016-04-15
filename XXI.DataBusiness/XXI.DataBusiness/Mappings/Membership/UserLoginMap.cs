using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using XXI.Centuty.DataBusiness.Models.Membership;

namespace XXI.Centuty.DataBusiness.Mappings.Membership
{
    public class UserLoginMap : EntityTypeConfiguration<ApplicationUserLogin>
    {
        public UserLoginMap()
        {
            ToTable("UserLogin");
            HasKey(x => x.UserId);
            HasKey(x => x.LoginProvider);
            HasKey(x => x.ProviderKey);
            Property(x => x.UserId).HasColumnName("UserId");
            Property(x => x.LoginProvider).HasColumnName("LoginProvider").HasMaxLength(128);
            Property(x => x.ProviderKey).HasColumnName("ProviderKey").HasMaxLength(128);
            HasOptional(a => a.User).WithMany(b => b.UserLogins).HasForeignKey(c => c.UserId);
        }
    }
}
