namespace XXI.Century.WebSite.Manager.Orders
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.ModelBinding;
    using System.Web.UI.WebControls;
    using Centuty.DataBusiness.Helpers;
    using Centuty.DataBusiness.Models.Entities;
    using Centuty.DataBusiness.Models.Enums;
    using Centuty.DataBusiness.Services;

    public partial class OrderList : System.Web.UI.Page
    {
        private readonly OrderService _orderService;

        public OrderList()
        {
            _orderService = new OrderService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<ListItem> GetOrderStatuses()
        {
            var listItem = new List<ListItem> { new ListItem { Text = "Все", Value = "" } };
            listItem.AddRange(Enum.GetValues(typeof (OrderStatus))
                .Cast<OrderStatus>()
                .Select(x => new ListItem {Text = x.GetDescription(), Value = x.ToString()}));
            return listItem;

        }

        public IQueryable<OrderEntity> GetOrders([Control] OrderStatus? orderStatus)
        {
            return orderStatus == null ? _orderService.GetAllOrders() : _orderService.GetOrdersByStatus(orderStatus);
        }
    }
}