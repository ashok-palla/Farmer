using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

public partial class Masters_Farmer : BasePage
{

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.QueryString.AllKeys.Contains("ReportType"))
        {
            //CRBusinessLogicLayer.GENERATEREPORT(CRBusinessLogicLayer.USER_DETAILS_REPORT(), "FARMER DETAILS", Convert.ToInt32(Request.QueryString["ReportType"]));
        }
        LoginRequired = true;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    #region  GET_FARMER_RELATED_DATA
    [WebMethod(EnableSession = true)]
    public static string GET_FARMER_RELATED_DATA(int? FarmerID)
    {
        try
        {
            return CRBusinessLogicLayer.GET_FARMER_RELATED_DATA(FarmerID).GetXml();
        }
        catch (Exception ex)
        {
            logfile.ErrorFormat(ex.Message);
            HttpContext.Current.Server.Transfer("");
        }
        return null;
    }
    #endregion

    #region GET_USER_NAME_EXIST_OR_NOT
    [WebMethod(EnableSession = true)]
    public static UserNameUnique[] GET_USER_NAME_EXIST_OR_NOT()
    {
        List<UserNameUnique> details = new List<UserNameUnique>();
        try
        {
            var DT = CRBusinessLogicLayer.GET_USER_NAME_EXIST_OR_NOT();
            if (DT.Rows.Count > 0)
            {
                details.AddRange(from DataRow dtrow in DT.Rows select new UserNameUnique { CustomerId = dtrow["LOGIN"].ToString() });
            }
        }
        catch (Exception ex)
        {
            logfile.ErrorFormat(ex.Message);
            return null;
        }
        return details.ToArray();
    }

    public class UserNameUnique
    {
        public string CustomerId { get; set; }
    }
    #endregion

    #region SAVE FARMER
    [WebMethod(EnableSession = true)]
    public static void INSERTANDUPDATEFARMERDETAILS(string FarmerID, string Name, string Location, string ContactNo, string PanNo, string BankAccountNo, string Active)
    {
        try
        {
            CRBusinessLogicLayer.FARMER_DETAILS_INSERT_UPDATE(FarmerID == "" ? 0 : Convert.ToInt32(FarmerID), Name, Location, ContactNo, PanNo, BankAccountNo, Active);
        }
        catch (Exception ex)
        {
            logfile.ErrorFormat(ex.Message);
        }

    }
    #endregion

    #region  Farmer_GET_EDIT
    [WebMethod(EnableSession = true)]
    public static string FARMER_GET_EDIT(string EditFarmerID)
    {
        try
        {
            return CRBusinessLogicLayer.GET_FARMER_RELATED_DATA(Convert.ToInt32(EditFarmerID)).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  ChangePassword
    [WebMethod]
    public static string UserChangePassword(string OldPassword, string NewPassword)
    {
        try
        {
            int? userId;
            CRBusinessLogicLayer.IsValidUser(HttpContext.Current.Session["UserName"].ToString(), OldPassword, out userId);
            if (userId == null)
            {
                return "Incorrect Old Password";
            }
            else
            {
                CRBusinessLogicLayer.UpdatePassword(HttpContext.Current.Session["UserName"].ToString(), NewPassword);
                return "Successfully Saved New Password";
            }
        }
        catch (Exception ex)
        {
            logfile.ErrorFormat(ex.Message);
            return ex.Message;
        }
    }
    #endregion

    #region  MANAGER_DROPDOEN_GET
    [WebMethod(EnableSession = true)]
    public static string MANAGER_DROPDOEN_GET()
    {
        try
        {
            return CRBusinessLogicLayer.MANAGER_DROPDOEN_GET().GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  USERROLECHECK
    [WebMethod(EnableSession = true)]
    public static string USERROLECHECK()
    {
        try
        {
            int UserID = CRBusinessLogicLayer.GetUserIDFromCookie();
            int UserRole = CRBusinessLogicLayer.GetUserRoleFromCookie();
            if (UserRole == 0 || UserRole == 3 || UserRole == 1)
            {
                return null;
            }
            return UserID.ToString() + '_' + UserRole.ToString();
        }
        catch (Exception ex)
        {
            logfile.ErrorFormat(ex.Message);
        }
        return null;
    }
    #endregion
}