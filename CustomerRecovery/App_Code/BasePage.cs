using System;
using System.Web;
using System.Web.Security;
using System.Data.SqlClient;


/// <summary>
/// Base Page for All ASP.NET WebForms in Website. 
/// Enforces Authentication & Authorization before Page is Loaded, as Reqired
/// </summary>
public class BasePage : Atharvana.Web.Common.BasePage
{
    protected static readonly log4net.ILog logfile = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
    #region Public Properties
    //Set Login Required property of Master Page in All Pages 
    //Page_PreInit Event, to Set Login Options for the Page
    protected bool LoginRequired { get; set; }
    protected string DateFormatForDatePicker = System.Configuration.ConfigurationManager.AppSettings["JSDateFormat"];// dd/mm/yy is mandatory in Atharvana // dmm/dd/yy is mandatory in KGN Server

    //protected int LoggedInUserId
    //{
    //    //get
    //    //{
    //    //    if (!LoginRequired)
    //    //        throw new InvalidOperationException("Cannot Get UserID for Users Not Logged In!");
    //    //    var fIdent = (FormsIdentity)HttpContext.Current.User.Identity;
    //    //    var ticket = (fIdent.Ticket);
    //    //    return Convert.ToInt32(Common.GetTicketUserDataWordAt(ticket, 0));
    //    //}
    //}
    #endregion

    #region Page Events
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        string SessionuserID = DatabaseName() + "_" + "userid";
        if (!LoginRequired)
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
            Session.Abandon();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
            Response.Redirect(String.Format("{0}?ReturnUrl={1}", FormsAuthentication.LoginUrl, Server.UrlEncode(HttpContext.Current.Request.Url.ToString())));
        }
        else
        {

            int? userId;
            CRBusinessLogicLayer.IsValidUserForPage(HttpContext.Current.Request.Cookies["UserName"].Value, HttpContext.Current.Request.Cookies["Pass"].Value, out userId);
            if (userId == null)
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
                Session.Abandon();
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
                Response.Cache.SetNoStore();
                Response.Redirect(String.Format("{0}?ReturnUrl={1}", FormsAuthentication.LoginUrl, Server.UrlEncode(HttpContext.Current.Request.Url.ToString())));
            }

        }
        if (Request.Cookies[SessionuserID] != null)
        {
            //int UserID = Convert.ToInt32(Request.Cookies[SessionuserID].Value);
            //var resourceGroupAccessDt = StaticCache.GetResourceGroupAccessDt(UserID);
            //if (resourceGroupAccessDt != null)
            //{
            //    if (resourceGroupAccessDt.Rows.Count > 0)
            //    {
            //        for (int i = 0; i < resourceGroupAccessDt.Rows.Count; i++)
            //        {

            //            if (Convert.ToInt32(resourceGroupAccessDt.Rows[i]["ResourceID"]) == ResourceId)
            //            {
            //                hasAccessToThePage = true;
            //                break;
            //            }
            //        }

            //    }
            //}
            //else
            //{
            //    RedirectToDontHaveAccessPage();
            //}
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected override void OnPreInit(EventArgs e)
    {
        log4net.Config.XmlConfigurator.Configure();//This is used to start log file start
        base.OnPreInit(e);
    }
    #endregion

    #region Helper Methods
    protected void RedirectToDontHaveAccessPage()
    {
        Response.Redirect("~/ErrorPages/UnAuthorized.aspx");
    }
    protected void DisplayAlert(string message)
    {
        ClientScript.RegisterStartupScript(
                        GetType(),
                        Guid.NewGuid().ToString(),
                        string.Format("alert('{0}');", message.Replace("'", @"\'")),
                        true
                    );
    }
    #endregion

    public string DatabaseName()
    {
        string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["CustomerRecoveryConnectionString"].ConnectionString;
        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(connectionString);
        string name = builder.InitialCatalog;

        return name;
    }

}
