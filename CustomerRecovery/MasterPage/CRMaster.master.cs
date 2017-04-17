using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;

namespace MasterPage
{
    public partial class MasterPage_CRMaster : System.Web.UI.MasterPage
    {
        private static readonly string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["CustomerRecoveryConnectionString"].ConnectionString;
        private static readonly SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(connectionString);
        private static readonly string name = builder.InitialCatalog;
        readonly string SessionuserID = name + "_" + "userid";

        protected void Page_Load(object sender, EventArgs e)
        {
            LBL_UserName.Text = Request.Cookies["UserName"].Value;
            if (Request.QueryString["userlogout"] != null && Request.QueryString["userlogout"] == "1")
            {
                LogoutPage();
            }
        }

        protected void LogoutPage()
        {
            if (Request.Cookies["udata"] != null)
            {
                Request.Cookies["udata"].Expires = DateTime.Now;
            }
            if (Request.Cookies[SessionuserID] != null)
            {
                Request.Cookies[SessionuserID].Expires = DateTime.Now;
                Response.Cookies.Add(Request.Cookies[SessionuserID]);
            }
            Request.Cookies["Pass"].Expires = DateTime.Now;
            Response.Cookies.Add(Request.Cookies["Pass"]);
            Session.Abandon();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
            Response.Redirect(String.Format("{0}?ReturnUrl={1}", FormsAuthentication.LoginUrl, Server.UrlEncode(HttpContext.Current.Request.Url.ToString())));
        }
    }
}
