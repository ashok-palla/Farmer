<%@ WebHandler Language="C#" Class="FileUploadHandler" %>    
     
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Data;
using System.IO;
using System.Web;


public class FileUploadHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState 
{
    readonly DataTable table = new DataTable("SubscribersDetails");
    public void ProcessRequest (HttpContext context)
    {
        try
        {
            if (context.Request.Files.Count > 0)
            {
                if (!Directory.Exists(HttpContext.Current.Server.MapPath("~/uploads")))
                {
                    Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/uploads"));
                }
                HttpFileCollection files = context.Request.Files;
                for (int z = 0; z < files.Count; z++)
                {
                    HttpPostedFile file = files[z];
                    string FileExtension = Path.GetExtension(file.FileName);
                    if (FileExtension == ".xls")
                    {
                        
                        string FileNAME = DateTime.Now.ToString("ddMMyyyyHHmmss") + Path.GetFileName(file.FileName);
                        string fname = HttpContext.Current.Server.MapPath("~/uploads/" + FileNAME);
                        file.SaveAs(fname);
                        HSSFWorkbook workbook = new HSSFWorkbook(new FileStream(fname, FileMode.Open, FileAccess.Read));
                        ISheet sheet = workbook.GetSheetAt(0);
                        IRow headerRow = sheet.GetRow(0);
                        int cellCount = headerRow.LastCellNum;
                        for (int j = headerRow.FirstCellNum; j < cellCount; j++)
                        {
                            if (headerRow.GetCell(j).StringCellValue.Trim() == "DATE_OF_ALLOTMENT" || headerRow.GetCell(j).StringCellValue.Trim() == "DATE_OF_NPA")
                            {
                                table.Columns.Add(new DataColumn(headerRow.GetCell(j).StringCellValue.Trim(), typeof(string)));
                            }
                            else if (headerRow.GetCell(j).StringCellValue.Trim() == "ACCOUNT_CATEGORY" || headerRow.GetCell(j).StringCellValue.Trim() == "EXECUTIVE_NAME" || headerRow.GetCell(j).StringCellValue.Trim() == "ADDRESS" || headerRow.GetCell(j).StringCellValue.Trim() == "LOCATION" || headerRow.GetCell(j).StringCellValue.Trim() == "BANK" || headerRow.GetCell(j).StringCellValue.Trim() == "BRANCH" || headerRow.GetCell(j).StringCellValue.Trim() == "ACCOUNT_NO" || headerRow.GetCell(j).StringCellValue.Trim() == "BORROWER_NAME" || headerRow.GetCell(j).StringCellValue.Trim() == "ACCOUNT_TYPE")
                            {
                                table.Columns.Add(new DataColumn(headerRow.GetCell(j).StringCellValue.Trim(), typeof(string)));
                            }
                            else if (headerRow.GetCell(j).StringCellValue.Trim() == "AMT_OS")
                            {
                                table.Columns.Add(new DataColumn(headerRow.GetCell(j).StringCellValue.Trim(), typeof(string)));
                            }
                        }
                        DataView View = new DataView(table);
                        View.ToTable(true, "DATE_OF_ALLOTMENT", "BANK", "BRANCH", "ACCOUNT_NO", "BORROWER_NAME", "ACCOUNT_CATEGORY", "ACCOUNT_TYPE", "DATE_OF_NPA", "AMT_OS", "EXECUTIVE_NAME", "LOCATION", "ADDRESS");
                        for (int k = (sheet.FirstRowNum); k <= sheet.LastRowNum; k++)
                        {
                            if (k > 0)
                            {
                                IRow row = sheet.GetRow(k);
                                //if (row.Cells[0].ToString() != "" && row.Cells[4].ToString() != "")
                                {
                                    DataRow dataRow = table.NewRow();
                                    for (int j = row.FirstCellNum; j < cellCount; j++)
                                    {
                                        if (row.GetCell(j) != null)
                                        {
                                            if (sheet.GetRow(0).GetCell(j).ToString() == "DATE_OF_ALLOTMENT")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["DATE_OF_ALLOTMENT"] = row.GetCell(j).ToString();
                                                }
                                            }
                                            else if (sheet.GetRow(0).GetCell(j).ToString() == "BANK")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["BANK"] = row.GetCell(j).ToString();
                                                }
                                            }
                                            else if (sheet.GetRow(0).GetCell(j).ToString() == "BRANCH")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["BRANCH"] = row.GetCell(j).ToString();
                                                }
                                            }
                                            else if (sheet.GetRow(0).GetCell(j).ToString() == "ACCOUNT_NO")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["ACCOUNT_NO"] = row.GetCell(j).ToString();
                                                }
                                            }
                                            else if (sheet.GetRow(0).GetCell(j).ToString() == "BORROWER_NAME")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["BORROWER_NAME"] = row.GetCell(j).ToString();
                                                }
                                            }
                                            else if (sheet.GetRow(0).GetCell(j).ToString() == "ACCOUNT_TYPE")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["ACCOUNT_TYPE"] = row.GetCell(j).ToString();
                                                }
                                                //else
                                                //{
                                                //    dataRow["ACCOUNT_TYPE"] = "NO A/C TYPE";
                                                //}
                                            }
                                            else if (sheet.GetRow(0).GetCell(j).ToString() == "DATE_OF_NPA")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["DATE_OF_NPA"] = row.GetCell(j).ToString();
                                                }
                                            }
                                            else if (sheet.GetRow(0).GetCell(j).ToString() == "AMT_OS")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["AMT_OS"] = row.GetCell(j).ToString();
                                                }
                                            }
                                            else if (sheet.GetRow(0).GetCell(j).ToString() == "LOCATION")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["LOCATION"] = row.GetCell(j).ToString();
                                                }
                                            }
                                            else if (sheet.GetRow(0).GetCell(j).ToString() == "ADDRESS")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null,  StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["ADDRESS"] = row.GetCell(j).ToString();
                                                }
                                            }
                                            else if (sheet.GetRow(0).GetCell(j).ToString() == "EXECUTIVE_NAME")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["EXECUTIVE_NAME"] = row.GetCell(j).ToString();
                                                }
                                            }
                                            else if (sheet.GetRow(0).GetCell(j).ToString() == "ACCOUNT_CATEGORY")
                                            {
                                                if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                                {
                                                    dataRow["ACCOUNT_CATEGORY"] = row.GetCell(j).ToString();
                                                }
                                            }
                                        }
                                    }
                                    table.Rows.Add(dataRow);
                                }
                            }
                        }
                        context.Session["EXCELUPLOAD"] = null;
                        context.Session["EXCELUPLOAD"] = table;
                    }
                    else if (FileExtension == ".xlsx")
                    {
                        string FileNAME = DateTime.Now.ToString("ddMMyyyyHHmmss") + Path.GetFileName(file.FileName);
                        string fname = HttpContext.Current.Server.MapPath("~/uploads/" + FileNAME);
                        file.SaveAs(fname);
                        XSSFWorkbook workbook = new XSSFWorkbook(new FileStream(HttpContext.Current.Server.MapPath("~/uploads/" + FileNAME), FileMode.Open, FileAccess.Read));
                        ISheet sheet = workbook.GetSheetAt(0);
                        IRow headerRow = sheet.GetRow(0);
                        int cellCount = headerRow.LastCellNum;

                        for (int j = headerRow.FirstCellNum; j < cellCount; j++)
                        {
                            if (headerRow.GetCell(j).StringCellValue.Trim() == "DATE_OF_ALLOTMENT" || headerRow.GetCell(j).StringCellValue.Trim() == "DATE_OF_NPA")
                            {
                                table.Columns.Add(new DataColumn(headerRow.GetCell(j).StringCellValue.Trim(), typeof(string)));
                            }
                            else if (headerRow.GetCell(j).StringCellValue.Trim() == "ACCOUNT_CATEGORY" || headerRow.GetCell(j).StringCellValue.Trim() == "EXECUTIVE_NAME" || headerRow.GetCell(j).StringCellValue.Trim() == "ADDRESS" || headerRow.GetCell(j).StringCellValue.Trim() == "LOCATION" || headerRow.GetCell(j).StringCellValue.Trim() == "BANK" || headerRow.GetCell(j).StringCellValue.Trim() == "BRANCH" || headerRow.GetCell(j).StringCellValue.Trim() == "ACCOUNT_NO" || headerRow.GetCell(j).StringCellValue.Trim() == "BORROWER_NAME" || headerRow.GetCell(j).StringCellValue.Trim() == "ACCOUNT_TYPE")
                            {
                                table.Columns.Add(new DataColumn(headerRow.GetCell(j).StringCellValue.Trim(), typeof(string)));
                            }
                            else if (headerRow.GetCell(j).StringCellValue.Trim() == "AMT_OS")
                            {
                                table.Columns.Add(new DataColumn(headerRow.GetCell(j).StringCellValue.Trim(), typeof(string)));
                            }
                        }
                        DataView View = new DataView(table);
                        View.ToTable(true, "DATE_OF_ALLOTMENT", "BANK", "BRANCH", "ACCOUNT_NO", "BORROWER_NAME", "ACCOUNT_CATEGORY", "ACCOUNT_TYPE", "DATE_OF_NPA", "AMT_OS", "EXECUTIVE_NAME", "LOCATION", "ADDRESS");
                        for (int i = (sheet.FirstRowNum); i <= sheet.LastRowNum; i++)
                        {
                            if (i > 0)
                            {
                                IRow row = sheet.GetRow(i);
                                DataRow dataRow = table.NewRow();
                                for (int j = row.FirstCellNum; j < cellCount; j++)
                                {
                                    if (row.GetCell(j) != null)
                                    {
                                        if (sheet.GetRow(0).GetCell(j).ToString() == "DATE_OF_ALLOTMENT")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["DATE_OF_ALLOTMENT"] = row.GetCell(j).ToString();
                                            }
                                        }
                                        else if (sheet.GetRow(0).GetCell(j).ToString() == "BANK")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["BANK"] = row.GetCell(j).ToString();
                                            }
                                        }
                                        else if (sheet.GetRow(0).GetCell(j).ToString() == "BRANCH")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["BRANCH"] = row.GetCell(j).ToString();
                                            }
                                        }
                                        else if (sheet.GetRow(0).GetCell(j).ToString() == "ACCOUNT_NO")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["ACCOUNT_NO"] = row.GetCell(j).ToString();
                                            }
                                        }
                                        else if (sheet.GetRow(0).GetCell(j).ToString() == "BORROWER_NAME")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["BORROWER_NAME"] = row.GetCell(j).ToString();
                                            }
                                        }
                                        else if (sheet.GetRow(0).GetCell(j).ToString() == "ACCOUNT_TYPE")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["ACCOUNT_TYPE"] = row.GetCell(j).ToString();
                                            }
                                        }
                                        else if (sheet.GetRow(0).GetCell(j).ToString() == "DATE_OF_NPA")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["DATE_OF_NPA"] = row.GetCell(j).ToString();
                                            }
                                        }
                                        else if (sheet.GetRow(0).GetCell(j).ToString() == "AMT_OS")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["AMT_OS"] = row.GetCell(j).ToString();
                                            }
                                        }
                                        else if (sheet.GetRow(0).GetCell(j).ToString() == "LOCATION")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["LOCATION"] = row.GetCell(j).ToString();
                                            }
                                        }
                                        else if (sheet.GetRow(0).GetCell(j).ToString() == "ADDRESS")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["ADDRESS"] = row.GetCell(j).ToString();
                                            }
                                        }
                                        else if (sheet.GetRow(0).GetCell(j).ToString() == "EXECUTIVE_NAME")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["EXECUTIVE_NAME"] = row.GetCell(j).ToString();
                                            }
                                        }
                                        else if (sheet.GetRow(0).GetCell(j).ToString() == "ACCOUNT_CATEGORY")
                                        {
                                            if (!String.Equals(row.GetCell(j).ToString(), null, StringComparison.OrdinalIgnoreCase) && row.GetCell(j).ToString() != string.Empty && row.GetCell(j).ToString() != "")
                                            {
                                                dataRow["ACCOUNT_CATEGORY"] = row.GetCell(j).ToString();
                                            }
                                        }
                                    }
                                }
                                table.Rows.Add(dataRow);
                            }
                        }
                        context.Session["EXCELUPLOAD"] = null;
                        context.Session["EXCELUPLOAD"] = table;
                    }
                }
                context.Response.ContentType = "text/plain";
                context.Response.Write("File Uploaded Successfully!");
            }
        }
        catch (Exception)
        {
            // ignored
        }
    }    
     
    public bool IsReusable  
    {    
        get   
        {    
            return false;    
        }    
    }    
     
} 