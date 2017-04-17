using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.AllKeys.Contains("UserManual"))
        {
            Response.ContentType = "Application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=CR.pdf");
            if (File.Exists(Server.MapPath("~/CR_Manual.pdf")))
            {
                Response.TransmitFile(Server.MapPath("~/CR_Manual.pdf"));
            }
            Response.End(); 
        }
    }

    #region  ChangePassword
    [WebMethod]
    public static string UserChangePassword(string OldPassword, string NewPassword)
    {
        try
        {
            int? userId;
            CRBusinessLogicLayer.IsValidUser(HttpContext.Current.Request.Cookies["UserName"].Value, OldPassword, out userId);
            if (userId == null)
            {
                return "Incorrect Old Password";
            }
            else
            {
                CRBusinessLogicLayer.UpdatePassword(HttpContext.Current.Request.Cookies["UserName"].Value, NewPassword);
                return "Successfully Saved New Password";
            }
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
    #endregion

    #region  AddNewCity
    [WebMethod]
    public static string AddNewCity(string CityID, string AddCityName)
    {
        try
        {
           return CRBusinessLogicLayer.AddCity(CityID, AddCityName);
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
    #endregion

    #region  CITY_GET
    [WebMethod]
    public static string CITY_GET()
    {
        try
        {
           return CRBusinessLogicLayer.CITY_GET().GetXml();
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
    #endregion

}