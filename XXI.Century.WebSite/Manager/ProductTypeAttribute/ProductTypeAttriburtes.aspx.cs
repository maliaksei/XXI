using System;
using System.Linq;
using System.Web.UI.WebControls;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.Admin
{
    public partial class ProductTypeAttriburtes : System.Web.UI.Page
    {
        public readonly ProductTypeAttributeService _productTypeAttributeService;
        

        public ProductTypeAttriburtes()
        {
            _productTypeAttributeService = new ProductTypeAttributeService();
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string rawId = Request.QueryString["Id"];
                long productTypeId;
                if (!String.IsNullOrEmpty(rawId) && long.TryParse(rawId, out productTypeId))
                {
                    HiddenId.Value = productTypeId.ToString();
                    AddButton.HRef = "/Manager/ProductTypeAttribute/AddEditProductTypeAttribute.aspx?ProductTypeId=" +
                                     rawId;
                }
            }
        }

        public IQueryable<ProductTypeAttributeEntity> GetProductTypeAttributes()
        {
            var id = HiddenId.Value;
            long productTypeId;
            if (!String.IsNullOrEmpty(id) && long.TryParse(id, out productTypeId))
            {
                return _productTypeAttributeService.GetProductTypeAttributesByProductTypeId(productTypeId);
            }
            return null;
        }

        protected void ProductTypeAttributeList_OnRowCommand_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "DeleteRow")
            {
                _productTypeAttributeService.DeleteProductTypeAttribute(id);

            }
            ProductTypeAttributeList.DataBind();
        }
    }
}