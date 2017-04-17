using System;
using System.Data;
using System.Linq;
using System.Web.Services;

namespace Masters
{
    public partial class Masters_Target : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.AllKeys.Contains("ReportType"))
            {
                CRBusinessLogicLayer.GENERATEREPORT(CRBusinessLogicLayer.TARGET_GET_REPORT(), "TARGET DETAILS", Convert.ToInt32(Request.QueryString["ReportType"]));
            }
            LoginRequired = true;
        }

        #region  TARGET_GET
        [WebMethod(EnableSession = true)]
        public static string TARGET_GET()
        {
            try
            {
                return CRBusinessLogicLayer.TARGET_GET().GetXml();
            }
            catch (Exception)
            {
                // ignored
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
                // ignored
            }
            return null;
        }
        #endregion

        #region  TARGET_INSERT_UPDATRE
        [WebMethod(EnableSession = true)]
        public static string TARGET_INSERT_UPDATRE(string TargetID, string ExecutiveName, string Target, string FromDate, string ToDate, string Active)
        {
            try
            {
                DataSet DT = CRBusinessLogicLayer.TARGET_INSERT_UPDATRE(TargetID, ExecutiveName, Target, FromDate, ToDate, Active);
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

        #region  TARGET_LIST_GET
        [WebMethod(EnableSession = true)]
        public static string TARGET_LIST_GET(int EXID)
        {
            try
            {
                return CRBusinessLogicLayer.TARGET_LIST_GET(EXID).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  TARGET_GET_EDIT
        [WebMethod(EnableSession = true)]
        public static string TARGET_GET_EDIT(int TargetID)
        {
            try
            {
                return CRBusinessLogicLayer.TARGET_GET_EDIT(TargetID).GetXml();
            }
            catch (Exception)
            {
                // ignored
            }
            return null;
        }
        #endregion

        #region  DELETE_TARGET
        [WebMethod(EnableSession = true)]
        public static string DELETE_TARGET(string ID)
        {
            try
            {
                return CRBusinessLogicLayer.DELETE_TARGET(Convert.ToInt32(ID));
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