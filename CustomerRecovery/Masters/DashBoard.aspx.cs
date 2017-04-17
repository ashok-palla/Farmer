using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Masters_DashBoard : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoginRequired = true;
    }
    #region  BANK_AND_BRANCH_WISE_NPA_RECOVERY_STATUS
    [WebMethod(EnableSession = true)]
    public static List<NPA> Bank_and_Branch_Wise_NPA_Recovery_Status(int? EXID, int? Bank, int? CityID, string FDATE, string TDATE)
    {
        try
        {
            DataSet Dt = CRBusinessLogicLayer.Bank_and_Branch_Wise_NPA_Recovery_Status(EXID, Bank, CityID, FDATE, TDATE);
            List<NPA> NPAList = new List<NPA>();
            foreach (DataRow DR in Dt.Tables[0].Rows) {
                NPA NPA = new NPA();
                NPA.BANKNAME = DR["BANKNAME"].ToString();
                NPA.OPEN = Convert.ToInt32(DR["OPEN"].ToString());
                NPA.CLOSE = Convert.ToInt32(DR["CLOSE"].ToString());
                NPA.RECOVERY_AMOUNT = Convert.ToDecimal(DR["RECOVERY_AMOUNT"].ToString());
                NPA.UNRECOVERY_AMOUNT = Convert.ToDecimal(DR["UNRECOVERY_AMOUNT"].ToString());
                NPAList.Add(NPA);
            }
            return NPAList;
        }
        catch (Exception)
        {
            return null;
            // ignored
        }
    }
    public class NPA {
        public string BANKNAME { get; set; }
        public int OPEN { get; set; }
        public int CLOSE { get; set; }
        public decimal RECOVERY_AMOUNT { get; set; }
        public decimal UNRECOVERY_AMOUNT { get; set; }
    }
    #endregion

    #region  NPA_DETAILS_STATUS
    [WebMethod(EnableSession = true)]
    public static List<NPAStatus> NPA_Details_Status(int? EXID, int? Bank, int? CityID, string FDATE, string TDATE)
    {
        try
        {
            DataSet Dt = CRBusinessLogicLayer.NPA_Details_Status(EXID, Bank, CityID, FDATE, TDATE);
            List<NPAStatus> NPAList = new List<NPAStatus>();
            foreach (DataRow DR in Dt.Tables[0].Rows)
            {
                NPAStatus NPA = new NPAStatus();
                NPA.TOTAL = Convert.ToInt32(DR["TOTAL"].ToString());
                NPA.OPEN = Convert.ToInt32(DR["OPEN"].ToString());
                NPA.CLOSE = Convert.ToInt32(DR["CLOSE"].ToString());
                NPAList.Add(NPA);
            }
            return NPAList;
        }
        catch (Exception)
        {
            return null;
            // ignored
        }
    }
    public class NPAStatus
    {
        public int TOTAL { get; set; }
        public int OPEN { get; set; }
        public int CLOSE { get; set; }
    }
    #endregion

    #region  BANK_AND_BRANCH_WISE_BILLING
    [WebMethod(EnableSession = true)]
    public static List<BANK_AND_BRANCH_WISE_BILLING_MODEL> BANK_AND_BRANCH_WISE_BILLING(int? EXID, int? Bank, int? CityID, string FDATE, string TDATE)
    {
        try
        {
            DataSet Dt = CRBusinessLogicLayer.BANK_AND_BRANCH_WISE_BILLING(EXID, Bank, CityID, FDATE, TDATE);
            List<BANK_AND_BRANCH_WISE_BILLING_MODEL> NPAList = new List<BANK_AND_BRANCH_WISE_BILLING_MODEL>();
            foreach (DataRow DR in Dt.Tables[0].Rows)
            {
                BANK_AND_BRANCH_WISE_BILLING_MODEL NPA = new BANK_AND_BRANCH_WISE_BILLING_MODEL();
                NPA.BANKNAME = DR["BANKNAME"].ToString();
                NPA.TOTALCOMMISSION = Convert.ToDecimal(DR["TOTALCOMMISSION"].ToString());
                NPA.BILL_AMOUNT_RECOVERED = Convert.ToDecimal(DR["BILL_AMOUNT_RECOVERED"].ToString());
                NPAList.Add(NPA);
            }
            return NPAList;
        }
        catch (Exception)
        {
            return null;
            // ignored
        }
    }
    public class BANK_AND_BRANCH_WISE_BILLING_MODEL
    {
        public string BANKNAME { get; set; }
        public decimal TOTALCOMMISSION { get; set; }
        public decimal BILL_AMOUNT_RECOVERED { get; set; }
    }
    #endregion

    #region  BANK_DROPDOWN_GET
    [WebMethod(EnableSession = true)]
    public static string BANK_DROPDOWN_GET(int? City)
    {
        try
        {
            return CRBusinessLogicLayer.DASH_BOARD_BANK_DROPDOWN_GET(City).GetXml();
        }
        catch (Exception)
        {
        }
        return null;
    }
    #endregion

    #region  EXECUTIVE_DROPDOEN_GET
    [WebMethod(EnableSession = true)]
    public static string EXECUTIVE_DROPDOEN_GET(int? City)
    {
        try
        {
            return CRBusinessLogicLayer.DASHBOARD_EXECUTIVE_DROPDOEN_GET(City).GetXml();
        }
        catch (Exception)
        {
        }
        return null;
    }
    #endregion
}