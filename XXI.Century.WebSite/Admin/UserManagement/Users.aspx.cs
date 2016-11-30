using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XXI.Century.WebSite.Admin.UserManagement
{
    using Centuty.DataBusiness.Models.Entities;
    using Centuty.DataBusiness.Models.Membership;
    using Centuty.DataBusiness.Services;

    public partial class Users : System.Web.UI.Page
    {

        public readonly UserService _userService;

        public Users()
        {
            _userService = new UserService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ApplicationUser> GetUsers()
        {
            var users = _userService.GetUsers();
            return _userService.GetUsers();
        }

        protected void ProductTypeList_OnRowCommand_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int orderCommodityId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "DeleteRow")
            {
               // _userService.DeleteProductTypeById(orderCommodityId);

            }
            ProductTypeList.DataBind();
        }
    }
}