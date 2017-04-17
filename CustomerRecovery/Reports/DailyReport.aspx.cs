using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Services;

namespace Reports
{
    public partial class Reports_DailyReport : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.AllKeys.Contains("ReportType"))
            {
                DataTable ExportDT = CRBusinessLogicLayer.DAILY_REPORT(Convert.ToInt32(Request.QueryString["EXECUTIVE"]), Request.QueryString["BANK"], Request.QueryString["BRANCH"], Convert.ToInt32(Request.QueryString["CityID"]), Request.QueryString["FDATE"], Convert.ToInt32(Request.QueryString["STATUS"]));
                if (ExportDT.Rows.Count > 0)
                {
                    CRBusinessLogicLayer.GENERATEREPORT_FOR_DAILYREPORT(ExportDT, "Daily recovery progress Report", Convert.ToInt32(Request.QueryString["ReportType"]));
                }
                else
                {
                    Response.Redirect("~/Reports/DailyReport.aspx", false);
                    Response.Write("<script>alert('No data to export');</script>");
                }
            }
            LoginRequired = true;
        }
        #region  GET_DAILY_REPORT_RELATED_DATA
        [WebMethod(EnableSession = true)]
        public static DailyReportData[] GET_DAILY_REPORT_RELATED_DATA(int? EXID, string BankID, string Branch, int? CityID, string DATE, int? STATUS)
        {
            try
            {
                List<DailyReportData> details = new List<DailyReportData>();
                DataTable dt = CRBusinessLogicLayer.GET_DAILY_REPORT_RELATED_DATA(EXID, BankID, Branch, CityID, DATE, STATUS).Tables[0];

                foreach (DataRow dtrow in dt.Rows)
                {
                    DailyReportData DailyR = new DailyReportData();
                    DailyR.NAMEOFTHEEXECUTIVE = dtrow["NAME OF THE EXECUTIVE"].ToString();
                    DailyR.TARGET = dtrow["TARGET"].ToString();
                    DailyR.NOOFACSALLOTED = dtrow["NO. OF A/C'S ALLOTED"].ToString();
                    DailyR.NOOFNEWALLOTED = dtrow["NO. OF NEW ALLOTED"].ToString();
                    DailyR.NOOFACSATTEMPTEDTODAY = dtrow["NO. OF A/CS ATTEMPTED TODAY"].ToString();
                    DailyR.NOOFACSATTEMPTEDTILLDATE = dtrow["NO.OF A/CS ATTEMPTED TILL DATE"].ToString();
                    DailyR.TODAY = dtrow["TODAY"].ToString();
                    DailyR.TILLDATE = dtrow["TILL DATE"].ToString();
                    DailyR.BANK = dtrow["BANK"].ToString();
                    DailyR.BRANCH = dtrow["BRANCH"].ToString();
                    DailyR.ACCOUNTNO = dtrow["ACCOUNT NO."].ToString();
                    DailyR.CUSTOMERNAME = dtrow["CUSTOMER NAME"].ToString();
                    DailyR.AGEOFNPA = dtrow["AGE OF NPA(DAYS)"].ToString();
                    DailyR.BILLNO = dtrow["BILL NO"].ToString();
                    DailyR.BILLCLAIMED = dtrow["BILL CLAIMED"].ToString();
                    DailyR.BILLCOLLECTED = dtrow["BILL COLLECTED"].ToString();
                    DailyR.PERFORMANCEPERCENTAGE = dtrow["PERFORMANCE PERCENTAGE"].ToString();
                    DailyR.STATUS = dtrow["A/C STATUS"].ToString();
                    details.Add(DailyR);
                }
                return details.ToArray();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }

        public class DailyReportData
        {
            public string NAMEOFTHEEXECUTIVE { get; set; }
            public string TARGET { get; set; }
            public string NOOFACSALLOTED { get; set; }  
            public string NOOFNEWALLOTED { get; set; }
            public string NOOFACSATTEMPTEDTODAY { get; set; }
            public string NOOFACSATTEMPTEDTILLDATE { get; set; }
            public string TODAY { get; set; }
            public string TILLDATE { get; set; }
            public string BANK { get; set; }
            public string BRANCH { get; set; }
            public string ACCOUNTNO { get; set; }
            public string CUSTOMERNAME { get; set; }
            public string AGEOFNPA { get; set; }
            public string BILLNO { get; set; }
            public string BILLCLAIMED { get; set; }
            public string BILLCOLLECTED { get; set; }
            public string PERFORMANCEPERCENTAGE { get; set; }
            public string STATUS { get; set; }

        }
        #endregion
    }
}