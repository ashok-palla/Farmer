using System;
using System.Linq;
using System.Web.Services;
using System.Data;

public partial class DailyTransactions_ExecutiveWiseVisitDetails : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.AllKeys.Contains("ReportType"))
        {
            DataTable ExportDT = CRBusinessLogicLayer.EXECUTIVE_VISIT_DETAILS(Convert.ToInt32(Request.QueryString["EXID"]), Request.QueryString["FDATE"], Request.QueryString["TDATE"], Request.QueryString["BANK"], Request.QueryString["BRANCH"], Convert.ToInt32(Request.QueryString["CITYID"]));
            if (ExportDT.Rows.Count > 0)
            {
                CRBusinessLogicLayer.GENERATEREPORT(ExportDT, "RECORDS OF VISIT", Convert.ToInt32(Request.QueryString["ReportType"]));
            }
            else
            {
                Response.Redirect("~/DailyTransactions/ExecutiveWiseVisitDetails.aspx?Error='No data to display'", false);
            }
        }
        LoginRequired = true;
    }

    #region  EXECUTIVEWISEVISITDETAILS_GET
    [WebMethod(EnableSession = true)]
    public static string EXECUTIVEWISEVISITDETAILS_GET(int? ID, int? EXID, string BANK, string BRANCH, string FDATE, string TDATE, int? CITYID)
    {
        try
        {
            return CRBusinessLogicLayer.EXECUTIVEWISEVISITDETAILS_GET(ID, EXID, BANK, BRANCH, FDATE, TDATE, CITYID).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  EXECUTEWISEDETAILS_INSERT_UPDATE
    [WebMethod(EnableSession = true)]
    public static void EXECUTEWISEDETAILS_INSERT_UPDATE(string EWVID, string ExecutiveName, string NPADetails, string Date, string LoanAmount, string AmountRecovered, string BalanceAmount, string Comments, string NextDateForVisit, string Active, string BankRangeType)//string PlaceVisited,
    {
        try
        {
            CRBusinessLogicLayer.EXECUTEWISEDETAILS_INSERT_UPDATE(EWVID, ExecutiveName, NPADetails, Date, LoanAmount, AmountRecovered, BalanceAmount, Comments, NextDateForVisit, Active, BankRangeType);//, PlaceVisited
        }
        catch (Exception)
        {
            // ignored
        }
    }
    #endregion

    #region  EXECUTEWISEDETAILS_DELETE
    [WebMethod(EnableSession = true)]
    public static string EXECUTEWISEDETAILS_DELETE(int ID)
    {
        try
        {
            return CRBusinessLogicLayer.EXECUTEWISEDETAILS_DELETE(Convert.ToInt32(ID)).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  NPADETAILS_EX_GET
    [WebMethod(EnableSession = true)]
    public static string NPADETAILS_EX_GET(int? ID, int REF_ID)
    {
        try
        {
            return CRBusinessLogicLayer.NPADETAILS_EX_GET(ID, REF_ID).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  PRE_RECOVERED_AMOUNT_ON_EXECUTIVE_VISIT
    [WebMethod(EnableSession = true)]
    public static string PRE_RECOVERED_AMOUNT_ON_EXECUTIVE_VISIT(int? ID)
    {
        try
        {
            return CRBusinessLogicLayer.PRE_RECOVERED_AMOUNT_ON_EXECUTIVE_VISIT(ID).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

}