using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Centuty.DataBusiness.Helpers
{
    public static class AddressHelper
    {
        public static string AddressToString(this AddressEntity addreas)
        {
            if (addreas != null)
            {
                return addreas.Country + " " + addreas.City + " " +
                       addreas.Street + " " + addreas.House + " " +
                       addreas.Flat;
            }

            return string.Empty;

        }
    }
}