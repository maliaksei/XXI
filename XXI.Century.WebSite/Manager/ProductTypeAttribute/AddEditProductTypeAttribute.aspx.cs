using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XXI.Centuty.DataBusiness.Models.Data;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.Admin.ProductTypeAttribute
{
    public partial class AddEditProductTypeAttribute : System.Web.UI.Page
    {
        private readonly ProductTypeAttributeService _productTypeAttributeService;

        public AddEditProductTypeAttribute()
        {
            _productTypeAttributeService = new ProductTypeAttributeService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string rawId = Request.QueryString["Id"];
                string rawProductType = Request.QueryString["ProductTypeId"];
                long productTypeAttributeId;
                long productTypeId;
                if (!String.IsNullOrEmpty(rawId) && long.TryParse(rawId, out productTypeAttributeId))
                {
                    var productTypeAttribute = _productTypeAttributeService.GetProductTypeAttributesById(productTypeAttributeId);
                    InputName.Value = productTypeAttribute.Name;
                    InputDescription.Value = productTypeAttribute.Description;
                    HiddenProductTypeAttributeId.Value = productTypeAttribute.Id.ToString();
                }
                if (!String.IsNullOrEmpty(rawProductType) && long.TryParse(rawProductType, out productTypeId))
                {
                    HiddenProductTypeId.Value = rawProductType;
                }
            }
        }

        public void FormSubmit(object sender, EventArgs eventArgs)
        {
            var model = new ProductTypeAttributeDataModel
            {
                Name = InputName.Value,
                Description = InputDescription.Value,
            };

            long productTypeId = long.Parse(HiddenProductTypeId.Value);
            long productTypeAttributeId;
            if (long.TryParse(HiddenProductTypeAttributeId.Value, out productTypeAttributeId))
            {
                model.Id = productTypeAttributeId;
                try
                {
                    _productTypeAttributeService.UpdateProductTypeAttribute(model);

                }
                catch (Exception)
                {
                    //todo: add varning dialog
                }

            }
            else
            {
                model.ProductTypeId = productTypeId;
                _productTypeAttributeService.AddProductTypeAttribute(model);
            }
            Response.Redirect("~/Manager/ProductTypeAttribute/ProductTypeAttriburtes.aspx?Id=" + productTypeId);
        }
    }
}