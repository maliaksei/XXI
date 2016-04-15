using XXI.Centuty.DataBusiness.Models.Enums;

namespace XXI.Centuty.DataBusiness.Models.Data
{
    public class ProductDataModel
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public double Price { get; set; }
        public long ProductTypeId { get; set; }
        public long CategoryId { get; set; }
        public ProductStatus ProductStatus { get; set; } 
    }
}