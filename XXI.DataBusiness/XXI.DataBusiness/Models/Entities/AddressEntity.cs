using System.Collections.Generic;
using Repository.Pattern.Ef6;
using XXI.Centuty.DataBusiness.Models.Membership;

namespace XXI.Centuty.DataBusiness.Models.Entities
{
    public class AddressEntity : Entity
    {
        public long Id { get; set; }
        public long UserId { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Street { get; set; }
        public string House { get; set; }
        public string Flat { get; set; }
        public virtual ApplicationUser User { get; set; }

        public virtual ICollection<OrderEntity> Orders { get; set; } 

    }
}
