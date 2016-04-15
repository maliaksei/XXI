using System.ComponentModel.DataAnnotations;

namespace XXI.Century.WebSite.Models
{
    public class ProductItemViewModel
    {
        [ScaffoldColumn(false)]
        public long ProductId { get; set; }

        public string ProductName { get; set; }
        
        public string Description { get; set; }

        public string ImagePath { get; set; }

        public double? UnitPrice { get; set; }

    }
}
