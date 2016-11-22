using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace XXI.Century.WebSite.Admin
{
    public partial class EditUserData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var userManager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = userManager.FindById(User.Identity.GetUserId<long>());
                if (user != null)
                {
                    InputFirstName.Value = user.FirstName;
                    InputLastName.Value = user.LastName;
                    InputPatronymic.Value = user.Patronymic;
                    InputEmail.Value = user.Email;
                }
            }
        }

        public void FormSubmit(object sender, EventArgs eventArgs)
        {
            var userManager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = userManager.FindById(User.Identity.GetUserId<long>());
            if (user == null) return;
            user.FirstName = InputFirstName.Value;
            user.LastName = InputLastName.Value;
            user.Patronymic = InputPatronymic.Value;
            userManager.Update(user);
            Response.Redirect("~/Manager/ManagerAccount.aspx");
        }
    }
}