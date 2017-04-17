using System;
using System.Data;
using System.Linq;
using System.Web.Services;
using Newtonsoft.Json;

public partial class Reports_ExecutiveReport : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.AllKeys.Contains("ReportType"))
        {
            DataTable ExportDT = CRBusinessLogicLayer.EXECUTIVE_REPORT(Convert.ToInt32(Request.QueryString["EXID"]), Request.QueryString["Bank"], Request.QueryString["Branch"], Convert.ToInt32(Request.QueryString["NPAID"])).Tables[0];
            if (ExportDT.Rows.Count > 0)
            {
                CRBusinessLogicLayer.GENERATEREPORT(ExportDT, "Executive Report", Convert.ToInt32(Request.QueryString["ReportType"]));
            }
            else
            {
                Response.Redirect("~/Reports/ExecutiveReport.aspx?Error='No data to display'", false);
            }
        }
        LoginRequired = true;
    }

    #region  EXECUTIVE_REPORT_GET
    [WebMethod(EnableSession = true)]
    public static string EXECUTIVE_REPORT_GET(int? EXID, string Bank, string Branch, int? NPAID)
    {
        try
        {
            return JsonConvert.SerializeObject(CRBusinessLogicLayer.EXECUTIVE_REPORT(EXID, Bank, Branch, NPAID).Tables[0]);
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion

    #region  EXECUTIVE_REPORT_GET_BY_BANKID
    [WebMethod(EnableSession = true)]
    public static string EXECUTIVE_REPORT_GET_BY_BANKID(int? EXID, string BANK, string BRANCH)
    {
        try
        {
            return CRBusinessLogicLayer.EXECUTIVE_REPORT_BY_BANK_BRANCH(EXID, BANK, BRANCH).GetXml();
        }
        catch (Exception)
        {
            // ignored
        }
        return null;
    }
    #endregion
}