using System;
using System.Data;
using System.Linq;
using System.Web.Services;

namespace Masters
{
    public partial class Masters_BankDetails : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.AllKeys.Contains("ReportType"))
            {
                CRBusinessLogicLayer.GENERATEREPORT(CRBusinessLogicLayer.BANK_DETAILS_REPORT(), "BANK DETAILS", Convert.ToInt32(Request.QueryString["ReportType"]));
            }
            LoginRequired = true;
        }

        #region  GET_BANK_RELATED_DATA
        [WebMethod(EnableSession = true)]
        public static string GET_BANK_RELATED_DATA()
        {
            try
            {
                return CRBusinessLogicLayer.GET_BANK_RELATED_DATA(null).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  BANK_GET_EDIT
        [WebMethod(EnableSession = true)]
        public static string BANK_GET_EDIT(string BankID)
        {
            try
            {
                return CRBusinessLogicLayer.GET_BANK_RELATED_DATA(Convert.ToInt32(BankID)).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region SAVE BANK
        [WebMethod(EnableSession = true)]
        public static string INSERTANDUPDATEBANKDETAILS(string BankID, string BankName, string ZoneName, string BranchName, string City, string Empanelmentdate, string Validupto, string ContactPerson, string CPHNumber, string BankEmailAddress, string BPHNumber, string Address, string Active, string Ranges, string OTSRanges)
        {
            try
            {
                string[] NormalRange = Ranges.Split(';');
                string[] OTSRange = OTSRanges.Split(';');

                DataTable NORMALDT = new DataTable();
                NORMALDT.Columns.Add("ID", typeof(int));
                NORMALDT.Columns.Add("RANGE_START", typeof(decimal));
                NORMALDT.Columns.Add("RANGE_END", typeof(decimal));
                NORMALDT.Columns.Add("PERCENTAGE", typeof(decimal));
                foreach (string STR in NormalRange) {
                    DataRow NORMALDT_NEWROW = NORMALDT.NewRow();
                    if (STR.Split(',')[0] != string.Empty){
                        NORMALDT_NEWROW["ID"] = STR.Split(',')[0];
                    }
                    else {
                        return "Please Enter Valid Normal Range.";
                    }

                    if (STR.Split(',')[1] != string.Empty)
                    {
                        NORMALDT_NEWROW["RANGE_START"] = STR.Split(',')[1];
                    }
                    else{
                        return "Please Enter Valid Normal Range Of Start Range.";
                    }

                    if (STR.Split(',')[2] != string.Empty)
                    {
                        NORMALDT_NEWROW["RANGE_END"] = STR.Split(',')[2];
                    }
                    else
                    {
                        return "Please Enter Valid Normal Range Of End Range.";
                    }

                    if (STR.Split(',')[3] != string.Empty)
                    {
                        NORMALDT_NEWROW["PERCENTAGE"] = STR.Split(',')[3];
                    }
                    else
                    {
                        return "Please Enter Valid Normal Range Of Percentage.";
                    }
                    NORMALDT.Rows.Add(NORMALDT_NEWROW);
                }

                DataTable OTSDT = new DataTable();
                OTSDT.Columns.Add("ID", typeof(int));
                OTSDT.Columns.Add("RANGE_START", typeof(decimal));
                OTSDT.Columns.Add("RANGE_END", typeof(decimal));
                OTSDT.Columns.Add("PERCENTAGE", typeof(decimal));


                foreach (string STR in OTSRange)
                {
                    DataRow OTSDT_NEWROW = OTSDT.NewRow();
                    if (STR.Split(',')[0] != string.Empty)
                    {
                        OTSDT_NEWROW["ID"] = STR.Split(',')[0];
                    }
                    else
                    {
                        return "Please Enter Valid OTS Range.";
                    }

                    if (STR.Split(',')[1] != string.Empty)
                    {
                        OTSDT_NEWROW["RANGE_START"] = STR.Split(',')[1];
                    }
                    else
                    {
                        return "Please Enter Valid OTS Range Of Start Range.";
                    }

                    if (STR.Split(',')[2] != string.Empty)
                    {
                        OTSDT_NEWROW["RANGE_END"] = STR.Split(',')[2];
                    }
                    else
                    {
                        return "Please Enter Valid OTS Range End Range.";
                    }

                    if (STR.Split(',')[3] != string.Empty)
                    {
                        OTSDT_NEWROW["PERCENTAGE"] = STR.Split(',')[3];
                    }
                    else
                    {
                        return "Please Enter Valid OTS Range Of Percentage.";
                    }
                    OTSDT.Rows.Add(OTSDT_NEWROW);
                }

                //Ranges = Ranges.Replace(',', '/');
                //Ranges = Ranges.Replace('.', '?');

                //OTSRanges = OTSRanges.Replace(',', '/');
                //OTSRanges = OTSRanges.Replace('.', '?');
                DataSet DT = CRBusinessLogicLayer.BANK_DETAILS_INSERT_UPDATE(BankID, BankName, ZoneName, BranchName, City, Empanelmentdate, Validupto, ContactPerson, CPHNumber, BankEmailAddress, BPHNumber, Address, Active, NORMALDT, OTSDT);
                if (DT.Tables.Count > 0)
                {
                    return DT.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
        #endregion

        #region  DELETE_BANK
        [WebMethod(EnableSession = true)]
        public static string DELETE_BANK(string BankID)
        {
            try
            {
                return CRBusinessLogicLayer.DELETE_BANK_RELATED_DATA(Convert.ToInt32(BankID));
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  RANGE_DELETE
        [WebMethod(EnableSession = true)]
        public static string RANGE_DELETE(string RID)
        {
            try
            {
                return CRBusinessLogicLayer.RANGE_DELETE(Convert.ToInt32(RID)).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  OTS_RANGE_DELETE
        [WebMethod(EnableSession = true)]
        public static string OTS_RANGE_DELETE(string OTSRID)
        {
            try
            {
                return CRBusinessLogicLayer.OTS_RANGE_DELETE(Convert.ToInt32(OTSRID)).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  BANK_COMISSION_RANGES_GET
        [WebMethod(EnableSession = true)]
        public static string BANK_COMISSION_RANGES_GET(string BankID)
        {
            try
            {
                return CRBusinessLogicLayer.BANK_COMISSION_RANGES_GET(Convert.ToInt32(BankID)).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  BANK_OTS_COMISSION_RANGES_GET
        [WebMethod(EnableSession = true)]
        public static string BANK_OTS_COMISSION_RANGES_GET(string BankID)
        {
            try
            {
                return CRBusinessLogicLayer.BANK_OTS_COMISSION_RANGES_GET(Convert.ToInt32(BankID)).GetXml();
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