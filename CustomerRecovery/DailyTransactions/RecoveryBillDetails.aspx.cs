using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

public partial class DailyTransactions_RecoveryBillDetails : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.AllKeys.Contains("ReportType"))
        {
            DataTable ExportDT = CRBusinessLogicLayer.RECOVERY_BILL_DETAILS(Convert.ToInt32(Request.QueryString["EXECUTIVE"]), Request.QueryString["BANK"], Request.QueryString["BRANCH"], Convert.ToInt32(Request.QueryString["NPAID"]), Request.QueryString["FDATE"], Request.QueryString["TDATE"]);
            if (ExportDT.Rows.Count > 0)
            {
                CRBusinessLogicLayer.GENERATEREPORT(ExportDT, "RECOVERY BILL DETAILS", Convert.ToInt32(Request.QueryString["ReportType"]));
            }
            else
            {
                Response.Redirect("~/DailyTransactions/RecoveryBillDetails.aspx?Error='No data to display'", false);
            }
        }
        else if (Request.QueryString.AllKeys.Contains("RecoveryBillID"))
        {
            try
            {
                var BillDt = CRBusinessLogicLayer.RECOVERY_BILL_SN(HttpContext.Current.Server.UrlDecode(Request.QueryString["RecoveryBillID"]));
                if (BillDt.Rows.Count > 0)
                {
                    CRBusinessLogicLayer.RECOVERY_BILL_PAYMENT_LETTER(BillDt, "ST001", "AAACK8658H");
                }
                else
                {
                    Response.Redirect("~/DailyTransactions/RecoveryBillDetails.aspx?Error='Please enter valid serial number.'", true);
                }
            }
            catch (Exception)
            {
                // ignored
            }
        }
        LoginRequired = true;
    }

    #region  RECOVERYBILLDETAILS_GET
    [WebMethod(EnableSession = true)]
    public static string RECOVERYBILLDETAILS_GET(int? ID, int? EXECUTIVE, string BANK, string BRANCH, int? NPAID, string FDATE, string TDATE)
    {
        try
        {
            return CRBusinessLogicLayer.RECOVERYBILLDETAILS_GET(ID,EXECUTIVE, BANK, BRANCH, NPAID, FDATE, TDATE).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  RECOVERYBILLDETAILS_INSERT_UPDATE
    [WebMethod(EnableSession = true)]
    public static void RECOVERYBILLDETAILS_INSERT_UPDATE(string RecoveryBillID, string ExecutiveName, string NPADetails, string RecoveredAmount, string BalanceAmount, string RecoveredDate, string RecoveredAmountCommission, string ServiceTax, string TotalCommission, string BoardCharges, string TransportCharges, string ValuationCharges, string Surveyorcharges, string PropertyIdentificationcharges, string InvestigationCharges, string MiscellaneousCharges, string Active, string BankRangeType)
    {
        try
        {

            CRBusinessLogicLayer.RECOVERYBILLDETAILS_INSERT_UPDATE(RecoveryBillID, ExecutiveName, NPADetails, RecoveredAmount, BalanceAmount, RecoveredDate, RecoveredAmountCommission, ServiceTax, TotalCommission, BoardCharges, TransportCharges, ValuationCharges, Surveyorcharges, PropertyIdentificationcharges, InvestigationCharges, MiscellaneousCharges, Active, BankRangeType);
        }
        catch (Exception)
        {
            // ignored
        }
    }
    #endregion

    #region  PREVIOUS_RECOVERED_AMOUNT
    [WebMethod(EnableSession = true)]
    public static string PREVIOUS_RECOVERED_AMOUNT(int? ID)
    {
        try
        {
            return CRBusinessLogicLayer.PREVIOUS_RECOVERED_AMOUNT(ID).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  NPADETAILS_GET_EXID
    [WebMethod(EnableSession = true)]
    public static string NPADETAILS_GET_EXID(int EXID, int REF_ID)
    {
        try
        {
            return CRBusinessLogicLayer.NPADETAILS_GET_EXID(EXID, REF_ID).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  BANK_RANGE_PERCENTAGE
    [WebMethod(EnableSession = true)]
    public static string BANK_RANGE_PERCENTAGE(int NPAID, int RANGETYPE, string AMOUNT)
    {
        try
        {
            return CRBusinessLogicLayer.BANK_RANGE_PERCENTAGE(NPAID, RANGETYPE, AMOUNT).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  ATHENTICATE_FOR_RECORD
    [WebMethod(EnableSession = true)]
    public static string ATHENTICATE_FOR_RECORD(string UserPass)
    {
        int? userId;
        try
        {
            CRBusinessLogicLayer.IsValidUser(HttpContext.Current.Request.Cookies["UserName"].Value, UserPass, out userId);
            return userId.ToString();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  RECOVERYBILLS_LIST_GET
    [WebMethod(EnableSession = true)]
    public static string RECOVERYBILLS_LIST_GET(int NPAID)
    {
        try
        {
            return CRBusinessLogicLayer.RECOVERYBILLS_LIST_GET(NPAID).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  EDIT_RECOVERYBILLDETAILS_GET
    [WebMethod(EnableSession = true)]
    public static string EDIT_RECOVERYBILLDETAILS_GET(int? ID, string BANK, string BRANCH, int? NPAID, string FDATE, string TDATE)
    {
        try
        {
            return CRBusinessLogicLayer.EDIT_RECOVERYBILLDETAILS_GET(ID, BANK, BRANCH, NPAID, FDATE, TDATE).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  NPADETAILS_FOR_SN
    [WebMethod(EnableSession = true)]
    public static string NPADETAILS_FOR_SN(int? BankID)
    {
        try
        {
            return CRBusinessLogicLayer.NPADETAILS_FOR_SN(BankID).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  RECOVERY_BILLS_FOR_SN
    [WebMethod(EnableSession = true)]
    public static string RECOVERY_BILLS_FOR_SN(string IDS)
    {
        try
        {
            return CRBusinessLogicLayer.RECOVERY_BILLS_FOR_SN(IDS).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  SERIALNUMBER_INSERT
    [WebMethod(EnableSession = true)]
    public static string SERIALNUMBER_INSERT(string RBIDS)
    {
        try
        {
            DataTable Dt = CRBusinessLogicLayer.SERIALNUMBER_INSERT(RBIDS);
            if (Dt.Rows.Count > 0)
            {
                DataColumnCollection columns = Dt.Columns;
                if (columns.Contains("SERIAL_NUMBER"))
                {
                    return "SN_" + Dt.Rows[0][0];
                }
                return Dt.Rows[0][0].ToString();
            }
            return "";
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
    #endregion
}