using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Repository.Pattern.Infrastructure;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.User
{
    public partial class AddEditAddress : System.Web.UI.Page
    {
        private readonly AddressService _addressService;

        public AddEditAddress()
        {
            _addressService = new AddressService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string rawId = Request.QueryString["AddressId"];
                long addressId;
                if (!String.IsNullOrEmpty(rawId) && long.TryParse(rawId, out addressId))
                {
                    var address = _addressService.GetAddressByIdAndUserId(addressId, User.Identity.GetUserId<long>());
                    InputCountry.Value = address.Country;
                    InputCity.Value = address.City;
                    InputHouse.Value = address.House;
                    InputStreet.Value = address.Street;
                    InputFlat.Value = address.Flat;
                    HiddenAddressId.Value = address.Id.ToString();
                    HiddenIsEdit.Value = true.ToString();
                }
            }
        }

        public void FormSubmit(object sender, EventArgs eventArgs)
        {
            var model = new AddressDataModel
            {
                City = InputCity.Value,
                Country = InputCountry.Value,
                Street = InputStreet.Value,
                House = InputHouse.Value,
                Flat = InputFlat.Value,
                UserId = User.Identity.GetUserId<long>()
            };

            long addresId;
            if (long.TryParse(HiddenAddressId.Value, out addresId))
            {
                model.Id = addresId;
                _addressService.UpdateAddress(model);
            }
            else
            {
                _addressService.AddAddress(model);
            }
            Response.Redirect("UserAddressesDelivery.aspx");
        }
    }
}