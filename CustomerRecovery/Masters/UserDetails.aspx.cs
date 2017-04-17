using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Masters
{
    public partial class Masters_UserDetails : BasePage
    {

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Request.QueryString.AllKeys.Contains("ReportType"))
            {
                CRBusinessLogicLayer.GENERATEREPORT(CRBusinessLogicLayer.USER_DETAILS_REPORT(), "USER DETAILS", Convert.ToInt32(Request.QueryString["ReportType"]));
            }
            LoginRequired = true;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        #region  GET_USER_RELATED_DATA
        [WebMethod(EnableSession = true)]
        public static string GET_USER_RELATED_DATA()
        {
            try
            {
                return CRBusinessLogicLayer.GET_USER_RELATED_DATA().GetXml();
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
                    details.AddRange(from DataRow dtrow in DT.Rows select new UserNameUnique {CustomerId = dtrow["LOGIN"].ToString()});
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

        #region SAVE USER
        [WebMethod(EnableSession = true)]
        public static void INSERTANDUPDATEUSERDETAILS(string UserID, string UserName, string FirstName, string LastName, string PHNumber, string EmailAddress, string Password, string Address, string City, string YearsofExperience, string DateofJoining, string UserRole, int? Manager, string Active, string IsAdmin)
        {
            try
            {
                if (UserRole == "1")
                {
                    Manager = null;
                }
                CRBusinessLogicLayer.USER_DETAILS_INSERT_UPDATE(UserID, UserName, FirstName, LastName, PHNumber, EmailAddress, Password, Address, City,YearsofExperience,DateofJoining, UserRole, Manager, Active, IsAdmin);
            }
            catch (Exception ex)
            {
                logfile.ErrorFormat(ex.Message);
            }

        }
        #endregion

        #region  USER_GET_EDIT
        [WebMethod(EnableSession = true)]
        public static string USER_GET_EDIT(string EditUserID)
        {
            try
            {
                return CRBusinessLogicLayer.USERS_GET_EDIT(Convert.ToInt32(EditUserID)).GetXml();
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
}