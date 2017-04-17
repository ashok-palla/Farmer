using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DailyTransactions_BankVisitDetails : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.AllKeys.Contains("ReportType"))
        {
            DataTable ExportDT = CRBusinessLogicLayer.BANK_VISIT_DETAILS(Convert.ToInt32(Request.QueryString["EXID"]), Convert.ToInt32(Request.QueryString["BankID"]), Request.QueryString["FDATE"].ToString(), Request.QueryString["TDATE"].ToString());
            if (ExportDT.Rows.Count > 0)
            {
                CRBusinessLogicLayer.GENERATEREPORT(ExportDT, "BANK VISIT DETAILS", Convert.ToInt32(Request.QueryString["ReportType"]));
            }
            else
            {
                Response.Redirect("~/DailyTransactions/BankVisitDetails.aspx", false);
            }
        }
        LoginRequired = true;
    }

    #region  GET_BANK_RELATED_DATA
    [WebMethod(EnableSession = true)]
    public static string GET_BANK_VISIT_RELATED_DATA(int? EXID, int? BankID, string FDATE, string TDATE)
    {
        try
        {
            return CRBusinessLogicLayer.GET_BANK_VISIT_RELATED_DATA(EXID, BankID, FDATE, TDATE).GetXml();
        }
        catch (Exception)
        {
        }
        return null;
    }
    #endregion

    #region  EXECUTIVE_DROPDOEN_GET
    [WebMethod(EnableSession = true)]
    public static string EXECUTIVE_DROPDOEN_GET()
    {
        try
        {
            return CRBusinessLogicLayer.EXECUTIVE_DROPDOEN_GET().GetXml();
        }
        catch (Exception)
        {
        }
        return null;
    }
    #endregion

    #region  BANK_DROPDOWN_GET
    [WebMethod(EnableSession = true)]
    public static string BANK_DROPDOWN_GET()
    {
        try
        {
            return CRBusinessLogicLayer.BANK_DROPDOWN_GET().GetXml();
        }
        catch (Exception)
        {
        }
        return null;
    }
    #endregion

    #region  BRANCH_DROPDOWN_GET
    [WebMethod(EnableSession = true)]
    public static string BRANCH_DROPDOWN_GET(string BANK)
    {
        try
        {
            return CRBusinessLogicLayer.BRANCH_DROPDOWN_GET(BANK).GetXml();
        }
        catch (Exception)
        {
        }
        return null;
    }
    #endregion

    #region  BANKVISIT_GET_BY_BANKVISITID
    [WebMethod(EnableSession = true)]
    public static string BANKVISIT_GET_BY_BANKVISITID(string BankVisitID)
    {
        try
        {
            return CRBusinessLogicLayer.BANKVISIT_GET_BY_BANKVISITID(Convert.ToInt32(BankVisitID)).GetXml();
        }
        catch (Exception)
        {
        }
        return null;
    }
    #endregion

    #region BANK_VISIT_INSERT_UPDATE
    [WebMethod(EnableSession = true)]
    public static void BANK_VISIT_INSERT_UPDATE(string BankVisitID, string ExecutiveName, string BankName , string PurposeOfVisit, string Active,string Date)
    {
        try
        {
            CRBusinessLogicLayer.BANK_VISIT_INSERT_UPDATE(BankVisitID, ExecutiveName, BankName, PurposeOfVisit, Active, Date);
        }
        catch (Exception)
        {
        }

    }
    #endregion

    #region  BANKVISIT_DELETE
    [WebMethod(EnableSession = true)]
    public static string BANKVISIT_DELETE(string BankVisitID)
    {
        try
        {
            return CRBusinessLogicLayer.BANKVISIT_DELETE(Convert.ToInt32(BankVisitID)).GetXml();
        }
        catch (Exception)
        {
        }
        return null;
    }
    #endregion
}