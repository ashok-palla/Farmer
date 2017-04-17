using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace DailyTransactions
{
    public partial class DailyTransactions_NPADetails : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.AllKeys.Contains("ReportType"))
            {
                DataTable ExportDT = CRBusinessLogicLayer.NPA_DETAILS_REPORT(Convert.ToInt32(Request.QueryString["EXID"]), Request.QueryString["BankID"], Request.QueryString["Branch"], Convert.ToInt32(Request.QueryString["CityID"]), Request.QueryString["FDATE"], Request.QueryString["TDATE"]);
                if (ExportDT.Rows.Count > 0)
                {
                    CRBusinessLogicLayer.GENERATEREPORT(ExportDT, "NPA DETAILS", Convert.ToInt32(Request.QueryString["ReportType"]));
                }
                else
                {
                    Response.Redirect("~/DailyTransactions/NPADetails1.aspx?Error='No data to display'", false);
                }
            }
            if (Request.QueryString.AllKeys.Contains("NPAID"))
            {
                CRBusinessLogicLayer.NPA_DETAILS_RECOVERY_REPORT(Request.QueryString["NPAID"]);
            }
            if (Request.QueryString.AllKeys.Contains("docurl"))
            {
                string name = Request.QueryString["docurl"];

                var dt = (DataTable)Session["DtDocbytes"];

                DataTable dtssss = (from m in dt.AsEnumerable() where m.Field<Int32>("ID") == Convert.ToInt32(name) select m).CopyToDataTable();

                DownloadDOCFile(((byte[])dtssss.Rows[0]["UFILE_BYTES"]), dtssss.Rows[0]["UFILE_NAME"].ToString(), dtssss.Rows[0]["UFILE_TYPE"].ToString());

                Response.End();
            }
            LoginRequired = true;
        }


        private void DownloadDOCFile(byte[] FileBytes, string FileName, string FileType)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            if (FileType == "application/msword")
            {
                Response.AppendHeader("Content-Disposition", string.Format("attachment;filename={0}", FileName + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".Doc"));
            }
            else if (FileType == "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
            {
                Response.AppendHeader("Content-Disposition", string.Format("attachment;filename={0}", FileName + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".Docx"));
            }
            else if (FileType == "application/x-zip-compressed")
            {
                Response.AppendHeader("Content-Disposition", string.Format("attachment;filename={0}", FileName + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".zip"));
            }
            else if (FileType == "application/octet-stream")
            {
                Response.AppendHeader("Content-Disposition", string.Format("attachment;filename={0}", FileName + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".rar"));
            }
            else if (FileType == "application/pdf")
            {
                Response.AppendHeader("Content-Disposition", string.Format("attachment;filename={0}", FileName + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf"));
            }
            Response.ContentType = FileType;
            Response.BinaryWrite(FileBytes);
            Response.End();
        }

        #region  NPADETAILS_GET
        [WebMethod(EnableSession = true)]
        public static string NPADETAILS_GET(int? ID, int? EXID, string BankID, string Branch, int? CityID, string FDATE, string TDATE)
        {
            try
            {
                DataSet Dt = CRBusinessLogicLayer.NPADETAILS_GET(ID, EXID, BankID, Branch, CityID, FDATE, TDATE);
                if (ID != null)
                    HttpContext.Current.Session["DtDocbytes"] = Dt.Tables[0];

                return Dt.GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  NPADETAILS_PURPOSEOFLOAN_GET
        [WebMethod(EnableSession = true)]
        public static string NPADETAILS_PURPOSEOFLOAN_GET(int Type)
        {
            try
            {
                return CRBusinessLogicLayer.NPADETAILS_PURPOSEOFLOAN_GET(Convert.ToBoolean(Type)).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  NPADETAILS_INSERT_UPDATE
        [WebMethod(EnableSession = true)]
        public static string NPADETAILS_INSERT_UPDATE(string NPADetailsID, string ACNo, string ExecutiveID, string BankName, string BorrowerName, string BorrowerAddress, string PHNumber, string CoAppicant, string Guaranty, string GuarantyAddress, string GuarantyPHNumber, string DateOfSanction, string TypeOfLoan, string Purposeofloan, string SecurityDetails, string OutstandingBalance, string DemandNoticeIssued, string Active, string NPADate, string City, string Location, string SymbolicPosition, string Date, string CMMOrderApplied, string AdvocateName, string ADVTContactNo, string PhysicalPosition, string PhyPoDate, string IdtofProperty)
        {
            try
            {
                return CRBusinessLogicLayer.NPADETAILS_INSERT_UPDATE(NPADetailsID, ACNo, ExecutiveID, BankName, BorrowerName, BorrowerAddress, PHNumber, CoAppicant, Guaranty, GuarantyAddress, GuarantyPHNumber, DateOfSanction, TypeOfLoan, Purposeofloan, SecurityDetails, OutstandingBalance, DemandNoticeIssued, Active, NPADate, City, Location, SymbolicPosition, Date, CMMOrderApplied, AdvocateName, ADVTContactNo, PhysicalPosition, PhyPoDate, IdtofProperty, "", "", null).ToString();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  DELETENPADetails
        [WebMethod(EnableSession = true)]
        public static string DELETENPADetails(string NPAID)
        {
            try
            {
                return CRBusinessLogicLayer.DELETENPADetails(Convert.ToInt32(NPAID)).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  BANK_DROPDOWN_FOR_REPORT
        [WebMethod(EnableSession = true)]
        public static string BANK_DROPDOWN_FOR_REPORT()
        {
            try
            {
                return CRBusinessLogicLayer.BANK_DROPDOWN_FOR_REPORT().GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  DROP_DOWN_BRANCH_FOR_REPORT
        [WebMethod(EnableSession = true)]
        public static string DROP_DOWN_BRANCH_FOR_REPORT(string BANK)
        {
            try
            {
                return CRBusinessLogicLayer.BRANCH_DROPDOWN_GET(BANK).GetXml();
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