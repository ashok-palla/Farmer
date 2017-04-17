using System;
using System.Linq;
using System.Web.Services;

namespace Masters
{
    public partial class Masters_LoanAccountDetails : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.AllKeys.Contains("ReportType"))
            {
                CRBusinessLogicLayer.GENERATEREPORT(CRBusinessLogicLayer.LOAN_ACCOUNT_DETAILS().Tables[0], "LOAN ACCOUNT DETAILS", Convert.ToInt32(Request.QueryString["ReportType"]));
            }
            LoginRequired = true;
        }
        #region  GET_LOAN_ACCOUNT_RELATED_DATA
        [WebMethod(EnableSession = true)]
        public static string GET_LOAN_ACCOUNT_RELATED_DATA()
        {
            try
            {
                return CRBusinessLogicLayer.GET_LOAN_ACCOUNT_RELATED_DATA(null).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  LOAN_ACCOUNT_GET_EDIT
        [WebMethod(EnableSession = true)]
        public static string LOAN_ACCOUNT_GET_EDIT(string LoanAccountID)
        {
            try
            {
                return CRBusinessLogicLayer.GET_LOAN_ACCOUNT_RELATED_DATA(Convert.ToInt32(LoanAccountID)).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region SAVE LOAN ACCOUNT
        [WebMethod(EnableSession = true)]
        public static void INSERTANDUPDATELOANACCOUNTDETAILS(string LoanAccountID, string LoanAccountDetails, string PurposeOfLoan, string Description, string Active)
        {
            try
            {
                CRBusinessLogicLayer.LOAN_ACCOUNT_DETAILS_INSERT_UPDATE(LoanAccountID, LoanAccountDetails, PurposeOfLoan, Description, Active);
            }
            catch (Exception)
            {
                // ignored
            }
        }
        #endregion

        #region  DELETE_LOANACCOUNT
        [WebMethod(EnableSession = true)]
        public static string DELETE_LOANACCOUNT(string LoanAccountID)
        {
            try
            {
                return CRBusinessLogicLayer.DELETE_LOAN_ACCOUNT_RELATED_DATA(Convert.ToInt32(LoanAccountID));
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion
    }
}