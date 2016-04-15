using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Pattern.Ef6;
using XXI.Centuty.DataBusiness.Models.Membership;

namespace XXI.Centuty.DataBusiness.Models.Entities
{
    public class ReviewEntity:Entity
    {
        public long Id { get; set; }
        public string Text { get; set; }
        public long UserId { get; set; }
        public long ProductId { get; set; }
        public virtual ApplicationUser User { get; set; }
        public virtual ProductEntity Product { get; set; }
        
    }
}
