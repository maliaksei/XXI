namespace XXI.Century.WebSite.Models
{
    public class OrderCommodityViewModel
    {
        public long ProductId { get; set; }
        public long OrderCommodityId { get; set; }
        public string ProductName { get; set; }
        public string PathImage{ get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; } 
    }
}