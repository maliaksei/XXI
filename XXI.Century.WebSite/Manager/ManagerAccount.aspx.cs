namespace XXI.Century.WebSite.Manager
{
    using System;
    using System.Web;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.Owin;

    public partial class ManagerAccount : System.Web.UI.Page
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