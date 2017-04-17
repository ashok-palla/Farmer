using System;
using System.Data;
using System.Linq;
using System.Web.Services;

public partial class DailyTransactions_RecoveryStatement : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.AllKeys.Contains("ReportType"))
        {
            DataTable ExportDT = CRBusinessLogicLayer.RECOVERY_STATEMENT_REPORT(null, Request.QueryString["BANK"], Request.QueryString["BRANCH"], Convert.ToInt32(Request.QueryString["NPAID"]), Convert.ToInt32(Request.QueryString["STATUS"]), Request.QueryString["FDATE"], Request.QueryString["TDATE"]);
            if (ExportDT.Rows.Count > 0)
            {
                CRBusinessLogicLayer.GENERATEREPORT(ExportDT, "RECOVERY STATEMENT", Convert.ToInt32(Request.QueryString["ReportType"]));
            }
            else
            {
                Response.Redirect("~/DailyTransactions/RecoveryStatement.aspx?Error='No data to display'", false);
            }
        }
        LoginRequired = true;
    }

    #region  RECOVERY_STATEMENT_GET
    [WebMethod(EnableSession = true)]
    public static string RECOVERY_STATEMENT_GET(int? ID, string BANK, string BRANCH, int? NPAID, int? STATUS, string FDATE, string TDATE)
    {
        try
        {
            return CRBusinessLogicLayer.RECOVERY_STATEMENT_GET(ID, BANK, BRANCH, NPAID, STATUS, FDATE, TDATE).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  RECOVERY_STATEMENT_BILLS_GET
    [WebMethod(EnableSession = true)]
    public static string RECOVERY_STATEMENT_BILLS_GET(int ID)
    {
        try
        {
            return CRBusinessLogicLayer.RECOVERY_STATEMENT_BILLS_GET(ID).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region RECOVERY_STATEMENT_INSERT_UPDATE
    [WebMethod(EnableSession = true)]
    public static void RECOVERY_STATEMENT_INSERT_UPDATE(string RecoveryStatementID, string BankName, string NPADetails, string BillAmountRecovered, string Date, string Amountlesspaid, string TDS, string Active)
    {
        try
        {
            CRBusinessLogicLayer.RECOVERY_STATEMENT_INSERT_UPDATE(RecoveryStatementID, BankName, NPADetails, BillAmountRecovered, Date, Amountlesspaid, TDS, Active);
        }
        catch (Exception)
        {
            // ignored
        }
    }
    #endregion

    #region  RECOVERY_STATEMENT_DELETE
    [WebMethod(EnableSession = true)]
    public static string RECOVERY_STATEMENT_DELETE(string ID)
    {
        try
        {
            return CRBusinessLogicLayer.RECOVERY_STATEMENT_DELETE(Convert.ToInt32(ID)).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  NPADETAILS_GET_BY_BANKID
    [WebMethod(EnableSession = true)]
    public static string NPADETAILS_GET_BY_BANKID(int? BankID, int REF_ID)
    {
        try
        {
            return CRBusinessLogicLayer.NPADETAILS_GET_BY_BANKID(BankID, REF_ID).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  RECOVERED_AMOUNT_GET
    [WebMethod(EnableSession = true)]
    public static string RECOVERED_AMOUNT_GET(int NPAID)
    {
        try
        {
            return CRBusinessLogicLayer.RECOVERED_AMOUNT_GET(NPAID).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  NPADETAILS_BY_BANK_BRANCH
    [WebMethod(EnableSession = true)]
    public static string NPADETAILS_BY_BANK_BRANCH(string BANK, string BRANCH)
    {
        try
        {
            return CRBusinessLogicLayer.NPADETAILS_BY_BANK_BRANCH(BANK, BRANCH).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion
}