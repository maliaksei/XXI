using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.Admin
{
    public partial class AddEditProductType : System.Web.UI.Page
    {
        private readonly ProductTypeService _productTypeService;

        public AddEditProductType()
        {
            _productTypeService = new ProductTypeService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string rawId = Request.QueryString["Id"];
                long productTypeId;
                if (!String.IsNullOrEmpty(rawId) && long.TryParse(rawId, out productTypeId))
                {
                    var productType = _productTypeService.GetProductTypeById(productTypeId);
                    InputName.Value = productType.Name;
                    InputDescription.Value = productType.Description;
                    HiddenProductTypeId.Value = productType.Id.ToString();
                }
            }
        }

        public void FormSubmit(object sender, EventArgs eventArgs)
        {
            var model = new ProductTypeDataModel
            {
                Name = InputName.Value,
                Description = InputDescription.Value,
            };

            long productTypeId;
            if (long.TryParse(HiddenProductTypeId.Value, out productTypeId))
            {
                model.Id = productTypeId;
                _productTypeService.UpdateProductType(model);
            }
            else
            {
                _productTypeService.AddProductType(model);
            }
            Response.Redirect("~/Admin/ProductType/ProductTypes.aspx");
        }
    }
}