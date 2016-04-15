using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XXI.Centuty.DataBusiness.Models.Data
{
    public class ReviewDataModel
    {
        public long Id { get; set; }
        public long UserId { get; set; }
        public long ProductId { get; set; }
        public string Text { get; set; }
    }
}
