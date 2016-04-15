namespace XXI.Centuty.DataBusiness.Models.Data
{
    public class ProductTypeAttributeValueDataModel
    {
        public long Id { get; set; }
        public long ProductId { get; set; }
        public long ProductTypeAttributeId { get; set; }
        public string Value { get; set; }
        public string Description { get; set; }
    }
}