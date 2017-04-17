using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using NPOI.HSSF.UserModel;

namespace Reports
{
    public partial class Reports_UploadData : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.AllKeys.Contains("DTemp"))
            {
                if (Convert.ToInt32(Request.QueryString["DTemp"]) == 1)
                {
                    DownloadTemplate();
                }
                else {
                    DownloadSampleTemplate();
                }
            }
            if (Request.QueryString.AllKeys.Contains("City"))
            {
                var ExportDT = CRBusinessLogicLayer.EXCEL_UPLOAD_DATA_XML_CHECK((DataTable)HttpContext.Current.Session["EXCELUPLOAD"], Convert.ToInt32(Request.QueryString["City"])).Tables[2]; 
                if (ExportDT.Rows.Count > 0)
                {
                    CRBusinessLogicLayer.GENERATEREPORT(ExportDT, "UPLOAD EXCEL", 1);
                }
            }
            LoginRequired = true;
        }

        #region  EXCELGET
        [WebMethod(EnableSession = true)]
        public static string EXCELGET(int CITYID)
        {
            try
            {
                return CRBusinessLogicLayer.EXCEL_UPLOAD_DATA_XML_CHECK((DataTable)HttpContext.Current.Session["EXCELUPLOAD"], CITYID).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  EXCELUPLOAD
        [WebMethod(EnableSession = true)]
        public static string EXCELUPLOAD(int CITYID)
        {
            try
            {
                MemoryStream str = new MemoryStream();
                ((DataTable)HttpContext.Current.Session["EXCELUPLOAD"]).WriteXml(str, true);
                str.Seek(0, SeekOrigin.Begin);
                StreamReader sr = new StreamReader(str);
                sr.ReadToEnd();
                CRBusinessLogicLayer.EXCEL_UPLOAD_DATA_XML1((DataTable)HttpContext.Current.Session["EXCELUPLOAD"], CITYID);
                return "Successfully uploaded data";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        #endregion

        #region DOWNLOAD TEMPLATE
        public void DownloadTemplate()
        {
            try
            {
                var workbook = new HSSFWorkbook();
                var sheet = workbook.CreateSheet("UploadData");

                var font = workbook.CreateFont();
                font.FontHeightInPoints = 11;
                font.FontName = "Calibri";
                font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;

                var headerRow = sheet.CreateRow(0);
                sheet.SetColumnWidth(0, 20 * 256);
                sheet.SetColumnWidth(1, 20 * 256);
                sheet.SetColumnWidth(2, 20 * 256);
                sheet.SetColumnWidth(3, 20 * 256);
                sheet.SetColumnWidth(4, 20 * 256);
                sheet.SetColumnWidth(5, 20 * 256);
                sheet.SetColumnWidth(6, 20 * 256);
                sheet.SetColumnWidth(7, 20 * 256);
                sheet.SetColumnWidth(8, 20 * 256);
                sheet.SetColumnWidth(9, 20 * 256);
                sheet.SetColumnWidth(10, 20 * 256);
                sheet.SetColumnWidth(11, 20 * 256);

                headerRow.CreateCell(0).SetCellValue("DATE_OF_ALLOTMENT");
                sheet.GetRow(0).GetCell(0).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(1).SetCellValue("BANK");
                sheet.GetRow(0).GetCell(1).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(2).SetCellValue("BRANCH");
                sheet.GetRow(0).GetCell(2).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(3).SetCellValue("ACCOUNT_NO");
                sheet.GetRow(0).GetCell(3).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(4).SetCellValue("BORROWER_NAME");
                sheet.GetRow(0).GetCell(4).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(5).SetCellValue("ACCOUNT_TYPE");
                sheet.GetRow(0).GetCell(5).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(6).SetCellValue("ACCOUNT_CATEGORY");
                sheet.GetRow(0).GetCell(6).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(7).SetCellValue("DATE_OF_NPA");
                sheet.GetRow(0).GetCell(7).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(8).SetCellValue("AMT_OS");
                sheet.GetRow(0).GetCell(8).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(9).SetCellValue("EXECUTIVE_NAME");
                sheet.GetRow(0).GetCell(9).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(10).SetCellValue("LOCATION");
                sheet.GetRow(0).GetCell(10).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(11).SetCellValue("ADDRESS");
                sheet.GetRow(0).GetCell(11).RichStringCellValue.ApplyFont(font);

                MemoryStream output = new MemoryStream();
                workbook.Write(output);
                string filename = "UploadData.xls";
                HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
                HttpContext.Current.Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.BinaryWrite(output.GetBuffer());
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
            catch (Exception)
            {
                // ignored
            }
        }
        #endregion

        #region DOWNLOAD TEMPLATE
        public void DownloadSampleTemplate()
        {
            try
            {
                var workbook = new HSSFWorkbook();
                var sheet = workbook.CreateSheet("UploadData");
                var headerRow = sheet.CreateRow(0);

                var font = workbook.CreateFont();
                font.FontHeightInPoints = 11;
                font.FontName = "Calibri";
                font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;

                sheet.SetColumnWidth(0, 20 * 256);
                sheet.SetColumnWidth(1, 20 * 256);
                sheet.SetColumnWidth(2, 20 * 256);
                sheet.SetColumnWidth(3, 20 * 256);
                sheet.SetColumnWidth(4, 20 * 256);
                sheet.SetColumnWidth(5, 20 * 256);
                sheet.SetColumnWidth(6, 20 * 256);
                sheet.SetColumnWidth(7, 20 * 256);
                sheet.SetColumnWidth(8, 20 * 256);
                sheet.SetColumnWidth(9, 20 * 256);
                sheet.SetColumnWidth(10, 20 * 256);
                sheet.SetColumnWidth(11, 20 * 256);

                headerRow.CreateCell(0).SetCellValue("DATE_OF_ALLOTMENT");
                sheet.GetRow(0).GetCell(0).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(1).SetCellValue("BANK");
                sheet.GetRow(0).GetCell(1).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(2).SetCellValue("BRANCH");
                sheet.GetRow(0).GetCell(2).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(3).SetCellValue("ACCOUNT_NO");
                sheet.GetRow(0).GetCell(3).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(4).SetCellValue("BORROWER_NAME");
                sheet.GetRow(0).GetCell(4).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(5).SetCellValue("ACCOUNT_TYPE");
                sheet.GetRow(0).GetCell(5).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(6).SetCellValue("ACCOUNT_CATEGORY");
                sheet.GetRow(0).GetCell(6).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(7).SetCellValue("DATE_OF_NPA");
                sheet.GetRow(0).GetCell(7).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(8).SetCellValue("AMT_OS");
                sheet.GetRow(0).GetCell(8).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(9).SetCellValue("EXECUTIVE_NAME");
                sheet.GetRow(0).GetCell(9).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(10).SetCellValue("LOCATION");
                sheet.GetRow(0).GetCell(10).RichStringCellValue.ApplyFont(font);
                headerRow.CreateCell(11).SetCellValue("ADDRESS");
                sheet.GetRow(0).GetCell(11).RichStringCellValue.ApplyFont(font);


                var DataRow = sheet.CreateRow(1);
                DataRow.CreateCell(0).SetCellValue("2015-01-31");
                DataRow.CreateCell(1).SetCellValue("ANDHRA BANK");
                DataRow.CreateCell(2).SetCellValue("ECIL");
                DataRow.CreateCell(3).SetCellValue("059710023070412");
                DataRow.CreateCell(4).SetCellValue("SAMPLE BORROWER NAME");
                DataRow.CreateCell(5).SetCellValue("HOME LOAN");
                DataRow.CreateCell(6).SetCellValue("SECURED/UNSECURED");
                DataRow.CreateCell(7).SetCellValue("2007-01-31");
                DataRow.CreateCell(8).SetCellValue("1000000.00");
                DataRow.CreateCell(9).SetCellValue("SAMPLE EXECUTIVE NAME");
                DataRow.CreateCell(10).SetCellValue("KAPRA");
                DataRow.CreateCell(11).SetCellValue("Atharvana Infotech Pvt. Ltd., Plot No.131, Ground Floor, Srinivas Nagar Colony, Kapra, Hyderabad - 500 062, INDIA.");

                MemoryStream output = new MemoryStream();
                workbook.Write(output);
                string filename = "SAMPLE EXCELL UPLOAD.xls";
                HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
                HttpContext.Current.Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.BinaryWrite(output.GetBuffer());
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
            catch (Exception)
            {
                // ignored
            }
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
                // ignored
            }
            return null;
        }
        #endregion
    }
}