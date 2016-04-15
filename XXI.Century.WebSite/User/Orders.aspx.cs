using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using XXI.Century.WebSite.Mappings;
using XXI.Century.WebSite.Models;
using XXI.Centuty.DataBusiness.Models.Enums;
using XXI.Centuty.DataBusiness.Services;

namespace XXI.Century.WebSite.User
{
    public partial class Orders : System.Web.UI.Page
    {
        public readonly OrderService _OrderService;

        public Orders()
        {
            _OrderService = new OrderService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<OrderItemViewModel> GetOrders()
        {
            var orders = _OrderService.GetOrdersByUserId(User.Identity.GetUserId<long>());
            return OrderModelMapper.GetOrderItems(orders);
        }

        public void OrderList_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            //incase you need the row index 
            int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            int orderCommodityId = Convert.ToInt32(e.CommandArgument);
            //if (e.CommandName == "DeleteRow")
            //{
            //    orderService.DeleteOrderCommodityByCommodityId(orderCommodityId);

            //}
            //if (e.CommandName == "QuantityDown")
            //{
            //    orderService.QuantityDown(orderCommodityId);
            //}
            //if (e.CommandName == "QuantityUp")
            //{
            //    orderService.QuantityUp(orderCommodityId);
            //}
            //CartList.DataBind();
        }
    }
}