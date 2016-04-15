namespace XXI.Centuty.DataBusiness.Models.Data
{
    public class AddressDataModel
    {
        public long Id { get; set; }
        public long UserId { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Street { get; set; }
        public string House { get; set; }
        public string Flat { get; set; } 
    }
}