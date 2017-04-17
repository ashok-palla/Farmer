<%@ WebHandler Language="C#" Class="FileUploadHandler" %>    
using System;
using System.IO;
using System.Web;

public class FileUploadHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState 
{
    public void ProcessRequest(HttpContext context)
    { 
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            string Docfilename = string.Empty;
            string DoccontentType = string.Empty;
            byte[] bytesDoc = null;
            if (context.Request.Files.Count > 0) //When Upload Two files
            {
                HttpPostedFile file = files[0];
                string FileExt = Path.GetExtension(file.FileName);
                if (FileExt == ".doc" || FileExt == ".docx" || FileExt == ".pdf" || FileExt == ".zip" || FileExt == ".rar")
                {                    
                    HttpPostedFile fileDoc = files[0];
                    string nameDoc = Path.GetFileName(fileDoc.FileName);
                    Docfilename = nameDoc.Split('.')[0];
                    DoccontentType = fileDoc.ContentType;
                    using (Stream fs = fileDoc.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(fs))
                        {
                            bytesDoc = br.ReadBytes((Int32)fs.Length);
                        }
                    }
                }     
            }
            string[] Array = context.Request["value"].Split('^');
            if (Array.Length > 0 && Array[0] == "NPA")
            {
                string NPADetailsID = Convert.ToString(Array[1]);
                string ExecutiveID = Convert.ToString(Array[2]); 
                string ACNo = Convert.ToString(Array[3]);
                string BankName = Convert.ToString(Array[4]);
                string BorrowerName = Convert.ToString(Array[5]); 
                string BorrowerAddress = Convert.ToString(Array[6]); 
                string PHNumber = Convert.ToString(Array[7]); 
                string CoAppicant = Convert.ToString(Array[8]);  
                string Guaranty = Convert.ToString(Array[9]);  
                string GuarantyAddress = Convert.ToString(Array[10]);  
                string GuarantyPHNumber = Convert.ToString(Array[11]);  
                string DateOfSanction = Convert.ToString(Array[12]);  
                string TypeOfLoan = Convert.ToString(Array[13]);  
                string Purposeofloan = Convert.ToString(Array[14]);  
                string SecurityDetails = Convert.ToString(Array[15]);  
                string OutstandingBalance = Convert.ToString(Array[16]);  
                string DemandNoticeIssued = Convert.ToString(Array[17]);  
                string NPADate = Convert.ToString(Array[18]);  
                string City = Convert.ToString(Array[19]);  
                string Location = Convert.ToString(Array[20]);  
                string SymbolicPosition = Convert.ToString(Array[21]);  
                string Date = Convert.ToString(Array[22]);  
                string CMMOrderApplied = Convert.ToString(Array[23]);  
                string AdvocateName = Convert.ToString(Array[24]);  
                string ADVTContactNo = Convert.ToString(Array[25]);  
                string PhysicalPosition = Convert.ToString(Array[26]);  
                string PhyPoDate = Convert.ToString(Array[27]);
                string IdtofProperty = Convert.ToString(Array[28]); 
                string Active = Convert.ToString(Array[29]);
                CRBusinessLogicLayer.NPADETAILS_INSERT_UPDATE(NPADetailsID, ACNo, ExecutiveID, BankName, BorrowerName, BorrowerAddress, PHNumber, CoAppicant, Guaranty, GuarantyAddress, GuarantyPHNumber, DateOfSanction, TypeOfLoan, Purposeofloan, SecurityDetails, OutstandingBalance, DemandNoticeIssued, Active, NPADate, City, Location, SymbolicPosition, Date, CMMOrderApplied, AdvocateName, ADVTContactNo, PhysicalPosition, PhyPoDate, IdtofProperty, Docfilename, DoccontentType, bytesDoc);
            }
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }
     
    public bool IsReusable  
    {    
        get   
        {    
            return false;    
        }    
    }    
     
} 