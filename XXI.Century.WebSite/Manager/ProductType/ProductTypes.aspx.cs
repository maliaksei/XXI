namespace XXI.Century.WebSite.Manager.ProductType
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;
    using Centuty.DataBusiness.Models.Entities;
    using Centuty.DataBusiness.Services;

    public partial class ProductTupes : System.Web.UI.Page
    {
        public readonly ProductTypeService _productTypeService;

        public ProductTupes()
        {
            _productTypeService = new ProductTypeService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ProductTypeEntity> GetProductTypes()
        {
            return _productTypeService.GetProductTypes();
        }

        protected void ProductTypeList_OnRowCommand_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int orderCommodityId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "DeleteRow")
            {
                _productTypeService.DeleteProductTypeById(orderCommodityId);

            }
            ProductTypeList.DataBind();
        }
    }
}