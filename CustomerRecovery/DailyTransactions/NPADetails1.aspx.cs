using System;
using System.Data;
using System.Linq;
using System.Web.Services;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace DailyTransactions
{
    public partial class DailyTransactions_NPADetails1 : BasePage
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
        #region  NPADETAILS_GET
        [WebMethod(EnableSession = true)]
        public static string NPADETAILS_GET(int? ID, int? EXID, string BankID, string Branch, int? CityID, string FDATE, string TDATE)
        {
            try
            {
                string JSONString = JsonConvert.SerializeObject(CRBusinessLogicLayer.NPADETAILS_GET1(ID, EXID, BankID, Branch, CityID, FDATE, TDATE).Tables[0]);
                return JSONString;
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  ACCOUNT_NUMBER_EXIST_OR_NOT
        [WebMethod(EnableSession = true)]
        public static AccountNumbers[] ACCOUNT_NUMBER_EXIST_OR_NOT(int? BankID, string AccountNumberHidden)
        {

            List<AccountNumbers> details = new List<AccountNumbers>();
            try
            {
                var DT = CRBusinessLogicLayer.ACCOUNT_NUMBER_EXIST_OR_NOT(BankID, AccountNumberHidden);
                if (DT.Rows.Count > 0)
                {
                    details.AddRange(from DataRow dtrow in DT.Rows select new AccountNumbers { LOANACCOUNTNO = dtrow["LOANACCOUNTNO"].ToString() });
                }
            }
            catch (Exception ex)
            {
                logfile.ErrorFormat(ex.Message);
                return null;
            }
            return details.ToArray();
        }
        public class AccountNumbers
        {
            public string LOANACCOUNTNO { get; set; }
        }
        #endregion
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
    }
}