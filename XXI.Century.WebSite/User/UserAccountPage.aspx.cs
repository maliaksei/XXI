using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using XXI.Centuty.DataBusiness.Models.Membership;

namespace XXI.Century.WebSite
{
    public partial class UserAccountPage : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var userManager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = userManager.FindById(User.Identity.GetUserId<long>());
                if (user != null)
                {
                    TextForFirstName.InnerText = user.FirstName;
                    TextForLastName.InnerText = user.LastName;
                    TextForPatronymic.InnerText = user.Patronymic;
                    TextForEmail.InnerText = user.Email;
                }
            }
        }
    }
}