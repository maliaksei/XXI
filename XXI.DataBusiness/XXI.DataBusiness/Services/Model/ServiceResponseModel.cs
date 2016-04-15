using XXI.Centuty.DataBusiness.Models.Enums;

namespace XXI.Centuty.DataBusiness.Services.Model
{
    public class ServiceResponseModel
    {
        public CompletedStatus CompletedStatus { get; set; }
        public object Data { get; set; }
    }
}