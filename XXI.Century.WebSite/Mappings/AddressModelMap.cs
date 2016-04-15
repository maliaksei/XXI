using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Models.Entities;

namespace XXI.Century.WebSite.Mappings
{
    public static class AddressModelMap
    {
        public static ListItem[] GetAddressListItems(IEnumerable<AddressEntity> addresses)
        {
            var listItems =
                 addresses.Select(
                    x =>
                        new ListItem
                        {
                            Text = x.Country + " " + x.City + " " + x.Street + " " + x.House + " " + x.Flat,
                            Value = x.Id.ToString()
                        });
            return listItems.ToArray();
        }

        public static IEnumerable<AddressItemViewModel> GetAddressItemsViewModel(IEnumerable<AddressEntity> addresses)
        {
            return addresses.Select(x => new AddressItemViewModel
            {
                City = x.City,
                Country = x.Country,
                Flat = x.Flat,
                Street = x.Street,
                House = x.House,
                Id = x.Id,
                UserId = x.UserId
            });
        }
    }
}