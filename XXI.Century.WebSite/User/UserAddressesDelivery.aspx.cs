using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using XXI.Century.WebSite.Mappings;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.User
{
    public partial class UserAddressesDelivery : System.Web.UI.Page
    {
        private readonly AddressService _addressService;

        public UserAddressesDelivery()
        {
            _addressService = new AddressService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IEnumerable<AddressItemViewModel> GetAddressesItems()
        {
            var addresses = _addressService.GetAddressesByUserId(User.Identity.GetUserId<long>());
            if (addresses != null)
            {
                return AddressModelMap.GetAddressItemsViewModel(addresses);
            }
            return null;
        }

        public void AddressLis_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            //incase you need the row index 
            int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            int addressId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "DeleteRow")
            {
                try
                {
                    _addressService.DeleteAddress(addressId);
                }
                catch (DbUpdateException)
                {
                   ErrorAlert.Attributes.Remove("hidden");
                }
               

            }
            
            AddressList.DataBind();
        }
    }
}