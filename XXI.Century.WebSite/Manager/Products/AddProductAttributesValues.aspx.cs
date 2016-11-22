namespace XXI.Century.WebSite.Manager.Products
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.UI.WebControls;
    using Centuty.DataBusiness.Models.Data;
    using Centuty.DataBusiness.Models.Entities;
    using Centuty.DataBusiness.Models.Enums;
    using Centuty.DataBusiness.Services;

    public partial class AddProductAttributesValues : System.Web.UI.Page
    {
        private readonly ProductTypeAttributeService _productTypeAttributeService;
        private readonly ProductTypeAttributeValueService _productTypeAttributeValueService;
        private readonly ProductService _productService;

        public AddProductAttributesValues()
        {
            _productTypeAttributeService = new ProductTypeAttributeService();
            _productTypeAttributeValueService = new ProductTypeAttributeValueService();
            _productService = new ProductService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string rawProductId = Request.QueryString["productId"];
                long productId;
                if (!String.IsNullOrEmpty(rawProductId) && long.TryParse(rawProductId, out productId))
                {
                    HiddenProductId.Value = productId.ToString();
                }
            }
        }

        public IQueryable<ProductTypeAttributeEntity> GetAttrubutes()
        {
            long productId;
            var rawProductId = HiddenProductId.Value;
            if (!String.IsNullOrEmpty(rawProductId) && long.TryParse(rawProductId, out productId))
            {
                var product = _productService.GetProductById(productId);
                if (product != null)
                {
                    var productTypeId = product.ProductTypeId;
                    return _productTypeAttributeService.GetProductTypeAttributesByProductTypeId(productTypeId);
                }
            }
            return null;
        }

        public void FormSubmit(object sender, EventArgs e)
        {
            var productTypeAttributeValueList = new List<ProductTypeAttributeValueDataModel>();
            var productId = long.Parse(HiddenProductId.Value);
            foreach (var item in AttributeList.Items)
            {
                var control = (TextBox)item.FindControl("AttributeValue");
                var productAttribyteId = control.Attributes["attribyteId"];
                var value = control.Text;
                if (!String.IsNullOrEmpty(value))
                {
                    productTypeAttributeValueList.Add(new ProductTypeAttributeValueDataModel
                    {
                        ProductTypeAttributeId = long.Parse(productAttribyteId),
                        Value = value,
                        ProductId = productId
                    });
                }
            }

            var response = _productTypeAttributeValueService.AddProductAttributeValues(productTypeAttributeValueList);
            if (response.CompletedStatus == CompletedStatus.Successed)
            {
                _productService.ChangeProductStatus(productId, ProductStatus.Active);
                Response.Redirect("/Manager/Products/Products.aspx");
            }

        }


    }
}
