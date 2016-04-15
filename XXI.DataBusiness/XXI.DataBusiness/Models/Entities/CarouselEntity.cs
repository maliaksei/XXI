using Repository.Pattern.Ef6;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XXI.Centuty.DataBusiness.Models.Entities
{
    public class CarouselEntity : Entity
    {
        public long Id { get; set; }
        public string Image { get; set; }
        public string PriceImage { get; set; }
        public string Tittle { get; set; }
        public string SubTitle { get; set; }
        public string Text { get; set; }
        public string UrlToProdict { get; set; }
    }
}
