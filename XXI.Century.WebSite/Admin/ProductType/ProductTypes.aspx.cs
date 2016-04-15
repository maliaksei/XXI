using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Models.Entities;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.Admin
{
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