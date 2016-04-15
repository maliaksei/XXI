using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace XXI.Century.WebSite.Models
{
    public class ProductDetailsViewModel
    {
        public long ProductId { get; set; }

        public string ProductName { get; set; }

        public string Description { get; set; }

        public string ImagePath { get; set; }

        public double? UnitPrice { get; set; }

        public Dictionary<string, string> Reviews { get; set; }

        public Dictionary<string, string> Attributes { get; set; }
    }
}