using System;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web;
using NPOI.HSSF.UserModel;
using System.IO;
using NPOI.XSSF.UserModel;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Threading;
using System.Diagnostics;

public class CRBusinessLogicLayer : BasePage
{
    #region DASH BOARD

    #region NPADETAILS

    public static DataSet Bank_and_Branch_Wise_NPA_Recovery_Status(int? EXID, int? Bank, int? CityID, string FDATE, string TDATE)
    {
        try
        {
            const string storedprocedure = "[DASHBOARD].[BANK_WISE_NPA_STATUS]";
            var parameters = new SqlParameter[6];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            parameters[1] = new SqlParameter("@EXECUTIVE", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            parameters[2] = new SqlParameter("@CITY", SqlDbType.Int) { Value = CityID == -1 ? null : CityID };
            parameters[3] = new SqlParameter("@BANK", SqlDbType.Int) { Value = Bank == -1 ? null : Bank };
            parameters[4] = FDATE == "" ? new SqlParameter("@FROM_DATE", DBNull.Value) : new SqlParameter("@FROM_DATE", SqlDbType.Date) { Value = FDATE };
            parameters[5] = TDATE == "" ? new SqlParameter("@TO_DATE", DBNull.Value) : new SqlParameter("@TO_DATE", SqlDbType.Date) { Value = TDATE };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region NPA_DETAILS_STATUS

    public static DataSet NPA_Details_Status(int? EXID, int? Bank, int? CityID, string FDATE, string TDATE)
    {
        try
        {
            const string storedprocedure = "[DashBoard].[NPA_STATUS]";
            var parameters = new SqlParameter[6];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            parameters[1] = new SqlParameter("@EXECUTIVE", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            parameters[2] = new SqlParameter("@CITY", SqlDbType.Int) { Value = CityID == -1 ? null : CityID };
            parameters[3] = new SqlParameter("@BANK", SqlDbType.Int) { Value = Bank == -1 ? null : Bank };
            parameters[4] = FDATE == "" ? new SqlParameter("@FROM_DATE", DBNull.Value) : new SqlParameter("@FROM_DATE", SqlDbType.Date) { Value = FDATE };
            parameters[5] = TDATE == "" ? new SqlParameter("@TO_DATE", DBNull.Value) : new SqlParameter("@TO_DATE", SqlDbType.Date) { Value = TDATE };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region BANK_AND_BRANCH_WISE_BILLING

    public static DataSet BANK_AND_BRANCH_WISE_BILLING(int? EXID, int? Bank, int? CityID, string FDATE, string TDATE)
    {
        try
        {
            const string storedprocedure = "[DASHBOARD].[BANK_AND_BRANCH_WISE_BILLING]";
            var parameters = new SqlParameter[6];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            parameters[1] = new SqlParameter("@EXECUTIVE", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            parameters[2] = new SqlParameter("@CITY", SqlDbType.Int) { Value = CityID == -1 ? null : CityID };
            parameters[3] = new SqlParameter("@BANK", SqlDbType.Int) { Value = Bank == -1 ? null : Bank };
            parameters[4] = FDATE == "" ? new SqlParameter("@FROM_DATE", DBNull.Value) : new SqlParameter("@FROM_DATE", SqlDbType.Date) { Value = FDATE };
            parameters[5] = TDATE == "" ? new SqlParameter("@TO_DATE", DBNull.Value) : new SqlParameter("@TO_DATE", SqlDbType.Date) { Value = TDATE };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #endregion

    #region FARMER PAGE

    #region GET_FARMER_RELATED_DATA

    public static DataSet GET_FARMER_RELATED_DATA(int? FarmerID)
    {
        try
        {
            const string storedprocedure = "[MASTER].[FARMERDETAILS]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@FARMERID", SqlDbType.Int) { Value = FarmerID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region FARMER_DETAILS_INSERT_UPDATE

    public static DataSet FARMER_DETAILS_INSERT_UPDATE(int farmerID, string name, string location, string contactNo, string panNo, string bankAccountNo,string Active)
    {
        try
        {
            const string storedprocedure = "[MASTER].[INSERTUPDATEFARMERDETAILS]";
            var parameters = new SqlParameter[8];
            parameters[0] = farmerID == 0 ? new SqlParameter("@FarmerID", DBNull.Value) : new SqlParameter("@FarmerID", DBNull.Value) { Value = Convert.ToInt32(farmerID) };
            parameters[1] = new SqlParameter("@Name", SqlDbType.VarChar) { Value = name };
            parameters[2] = new SqlParameter("@ContactNo", SqlDbType.VarChar) { Value = contactNo };
            parameters[3] = new SqlParameter("@Location", SqlDbType.VarChar) { Value = location };
            parameters[4] = new SqlParameter("@PanNo", SqlDbType.VarChar) { Value = panNo };
            parameters[5] = new SqlParameter("@BankAccountNo", SqlDbType.VarChar) { Value = bankAccountNo };
            parameters[6] = new SqlParameter("@CreatedBy", SqlDbType.VarChar) { Value = 1 };
            parameters[7] = new SqlParameter("@Active", SqlDbType.Bit) { Value = Active };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return null;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #endregion

    #region USER PAGE

    #region FORGOT_PASSWORD
    public static DataTable ForgorPasswordSendCode(string UserName, string Email)
    {
        try
        {
            const string storedprocedure = "[ADMIN].[ForGotPassword]";
            var parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@UserName", SqlDbType.VarChar) { Value = UserName };
            parameters[1] = new SqlParameter("@EmailID", SqlDbType.VarChar) { Value = Email };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }
    #endregion

    #region GET_SEQUERITY_QUESTION
    public static DataSet GetSequerityQuestion(int UserID)
    {
        try
        {
            const string storedProcedure = "[Admin].[GetSequrityQuestion]";
            var parameters = new SqlParameter[1];

            parameters[0] = new SqlParameter("@UserID", UserID);
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedProcedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }

    }
    #endregion

    #region GET_USER_ACCESS_URL
    public static DataSet GetUserAccessURL(int UserID)
    {
        try
        {
            const string storedprocedure = "Admin.GetUserAccessURL";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@UserID", UserID);
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            //ds.Tables[0].Rows[0]["ScreenURL"] = (ds.Tables[0].Rows[0]["ScreenURL"]).ToString().Split('?')[0] + '?' + Encrypt((ds.Tables[0].Rows[0]["ScreenURL"]).ToString().Split('?')[1], "ScreenID");
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }
    #endregion

    #region IS VALID USER

    public static void IsValidUser(string userName, string password, out int? userId)
    {
        userId = null;
        try
        {
            var sqlParameters = new[]
                                {
                                    new SqlParameter("@Login", SqlDbType.VarChar, 50),
                                    new SqlParameter("@Password", SqlDbType.VarChar, 50),
                                    new SqlParameter("@IsAValidUser", SqlDbType.Bit),
                                    new SqlParameter("@UserID", SqlDbType.Int)
                                };

            System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
            Byte[] bytes = encoding.GetBytes(password);


            string pwd = PassEncrypt(bytes);

            sqlParameters[0].Value = userName;
            sqlParameters[1].Value = pwd;
            sqlParameters[2].Direction =
            sqlParameters[3].Direction = ParameterDirection.Output;


            SQLHelper.GetInstance().ExecuteStoredProcedure("Admin.IsValidUser", sqlParameters);
            userId = sqlParameters[3].Value as int?;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
        }
    }
    #endregion

    #region ISVALID USER FOR PAGE

    public static void IsValidUserForPage(string userName, string password, out int? userId)
    {
        userId = null;
        try
        {
            var sqlParameters = new[]
                                {
                                    new SqlParameter("@Login", SqlDbType.VarChar, 50),
                                    new SqlParameter("@Password", SqlDbType.VarChar, 50),
                                    new SqlParameter("@IsAValidUser", SqlDbType.Bit),
                                    new SqlParameter("@UserID", SqlDbType.Int)
                                };
            sqlParameters[0].Value = userName;
            sqlParameters[1].Value = password;
            sqlParameters[2].Direction =
            sqlParameters[3].Direction = ParameterDirection.Output;
            SQLHelper.GetInstance().ExecuteStoredProcedure("Admin.IsValidUser", sqlParameters);
            userId = sqlParameters[3].Value as int?;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
        }
    }
    #endregion

    #region UPDATE PASSWORD
    public static void UpdatePassword(string LoginName, string password)
    {
        try
        {
            System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
            Byte[] bytes = encoding.GetBytes(password);
            string pwd = PassEncrypt(bytes);
            const string storedProcedure = "[Admin].[UpdatePasswordWithLoginName]";
            var parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@loginName", SqlDbType.VarChar) { Value = LoginName };
            parameters[1] = new SqlParameter("@Password", SqlDbType.VarChar) { Value = pwd };
            SQLHelper.GetInstance().ExecuteStoredProcedure(storedProcedure, parameters);
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
        }
    }
    #endregion

    #region GET_USER_NAME_EXIST_OR_NOT
    public static DataTable GET_USER_NAME_EXIST_OR_NOT()
    {
        try
        {
            DataTable DT = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet("[ADMIN].[GET_USER_NAMES]", null).Tables[0];
            return DT;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }
    #endregion

    #region GET_USER_RELATED_DATA

    public static DataSet GET_USER_RELATED_DATA()
    {
        try
        {
            const string storedprocedure = "[ADMIN].[USERS_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@USERID", GetUserIDFromCookie());
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region USER_DETAILS_INSERT_UPDATE

    public static DataSet USER_DETAILS_INSERT_UPDATE(string UserID, string UserName, string FirstName, string LastName, string PHNumber, string EmailAddress, string Password, string Address, string City, string YearsofExperience, string DateofJoining, string UserRole, int? Manager, string Active, string IsAdmin)
    {
        try
        {
            if (Password != string.Empty)
            {
                System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                Byte[] bytes = encoding.GetBytes(Password);
                Password = PassEncrypt(bytes);
            }

            const string storedprocedure = "[ADMIN].[INSERTUPDATEUSERDETAILS]";
            var parameters = new SqlParameter[16];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(UserID) };
            parameters[1] = new SqlParameter("@Login", SqlDbType.VarChar) { Value = UserName };
            parameters[2] = new SqlParameter("@Password", SqlDbType.VarChar) { Value = Password == "" ? null : Password };
            parameters[3] = new SqlParameter("@FirstName", SqlDbType.VarChar) { Value = FirstName };
            parameters[4] = new SqlParameter("@LastName", SqlDbType.VarChar) { Value = LastName };
            parameters[5] = new SqlParameter("@EmailID", SqlDbType.VarChar) { Value = EmailAddress };
            parameters[6] = new SqlParameter("@PhoneNumber", SqlDbType.VarChar) { Value = PHNumber };
            parameters[7] = new SqlParameter("@Address", SqlDbType.VarChar) { Value = Address };
            parameters[8] = new SqlParameter("@City", SqlDbType.VarChar) { Value = City };
            parameters[9] = new SqlParameter("@UserRole", SqlDbType.Int) { Value = Convert.ToInt32(UserRole) };
            parameters[10] = new SqlParameter("@Image", SqlDbType.Image) { Value = null };
            parameters[11] = Manager == null ? new SqlParameter("@CreatedBy", DBNull.Value) : new SqlParameter("@CreatedBy", SqlDbType.Int) { Value = Convert.ToInt32(Manager) };
            parameters[12] = new SqlParameter("@Active", SqlDbType.Bit) { Value = Active };
            //parameters[13] = new SqlParameter("@Empanelmentdate", SqlDbType.Date) { Value = Convert.ToDateTime(Empanelmentdate) };
            //parameters[14] = new SqlParameter("@Validupto", SqlDbType.Date) { Value = Convert.ToDateTime(Validupto) };
            parameters[13] = new SqlParameter("@YearsofExperience", SqlDbType.Float) { Value = Convert.ToDecimal(YearsofExperience) };
            parameters[14] = new SqlParameter("@DateofJoining", SqlDbType.Date) { Value = DateofJoining };
            parameters[15] = new SqlParameter("@IsAdmin", SqlDbType.Bit) { Value = IsAdmin };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region USERS_GET_EDIT

    public static DataSet USERS_GET_EDIT(int EditUserID)
    {
        try
        {
            const string storedprocedure = "[ADMIN].[USERS_GET_EDIT]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(EditUserID) };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region MANAGER_DROPDOEN_GET

    public static DataSet MANAGER_DROPDOEN_GET()
    {
        try
        {
            const string storedprocedure = "ADMIN.[MANAGER_DROPDOEN_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #endregion

    #region BANK PAGE

    #region GET_BANK_RELATED_DATA

    public static DataSet GET_BANK_RELATED_DATA(int? BankID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[BANK_GET]";
            var parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@BANKID", SqlDbType.Int) { Value = BankID };
            parameters[1] = new SqlParameter("@USERID", GetUserIDFromCookie());
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region USER_DETAILS_INSERT_UPDATE

    public static DataSet BANK_DETAILS_INSERT_UPDATE(string BankID, string BankName, string ZoneName, string BranchName, string City, string Empanelmentdate, string Validupto, string ContactPerson, string CPHNumber, string BankEmailAddress, string BPHNumber, string Address, string Active, DataTable Ranges, DataTable OTSRanges)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[BANK_INSERT_UPDATE]";
            var parameters = new SqlParameter[16];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = Convert.ToInt32(BankID) };
            parameters[1] = new SqlParameter("@Name", SqlDbType.VarChar) { Value = BankName };
            parameters[2] = new SqlParameter("@Zone", SqlDbType.VarChar) { Value = ZoneName };
            parameters[3] = new SqlParameter("@Branch", SqlDbType.VarChar) { Value = BranchName };
            parameters[4] = new SqlParameter("@City", SqlDbType.VarChar) { Value = City };
            parameters[5] = new SqlParameter("@ContactPerson1", SqlDbType.VarChar) { Value = ContactPerson };
            parameters[6] = new SqlParameter("@ContactNo", SqlDbType.VarChar) { Value = CPHNumber };
            parameters[7] = new SqlParameter("@BankMailID", SqlDbType.VarChar) { Value = BankEmailAddress };
            parameters[8] = new SqlParameter("@BankContactNo", SqlDbType.VarChar) { Value = BPHNumber };
            parameters[9] = new SqlParameter("@Address", SqlDbType.VarChar) { Value = Address };
            parameters[10] = new SqlParameter("@UserID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            parameters[11] = new SqlParameter("@Active", SqlDbType.Bit) { Value = Active };
            parameters[12] = new SqlParameter("@Empanelmentdate", SqlDbType.Date) { Value = Empanelmentdate == "" ? null : Empanelmentdate };
            parameters[13] = new SqlParameter("@Validupto", SqlDbType.Date) { Value = Validupto == "" ? null : Validupto };
            parameters[14] = new SqlParameter("@Ranges", SqlDbType.Structured) { Value = Ranges };
            parameters[15] = new SqlParameter("@OTSRanges", SqlDbType.Structured) { Value = OTSRanges };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region DELETE_BANK_RELATED_DATA

    public static string DELETE_BANK_RELATED_DATA(int? BankID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[DELETEBANKDETAILS]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = BankID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            if (ds.Tables.Count > 0)
            {
                return ds.Tables[0].Rows[0][0].ToString();
            }
            return "";
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region BANK_COMISSION_RANGES_GET

    public static DataSet BANK_COMISSION_RANGES_GET(int? BankID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[BANK_COMISSION_RANGES_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@BANKID", SqlDbType.Int) { Value = BankID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RANGE_DELETE

    public static DataSet RANGE_DELETE(int RID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[RANGE_DELETE]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = RID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region OTS_RANGE_DELETE

    public static DataSet OTS_RANGE_DELETE(int RID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[OTS_RANGE_DELETE]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = RID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region BANK_OTS_COMISSION_RANGES_GET

    public static DataSet BANK_OTS_COMISSION_RANGES_GET(int? BankID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[BANK_OTS_COMISSION_RANGES_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@BANKID", SqlDbType.Int) { Value = BankID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #endregion

    #region LOAN ACCOUNT DETAILS PAGE

    #region GET_LOAN_ACCOUNT_RELATED_DATA

    public static DataSet GET_LOAN_ACCOUNT_RELATED_DATA(int? LOANACCOUNTID)
    {
        try
        {
            const string storedprocedure = "CONFIG.[LOANACCOUNT_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@LOANACCOUNTID", SqlDbType.Int) { Value = LOANACCOUNTID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region USER_DETAILS_INSERT_UPDATE

    public static DataSet LOAN_ACCOUNT_DETAILS_INSERT_UPDATE(string LoanAccountID, string LoanAccountDetails, string PurposeOfLoan, string Description, string Active)
    {
        try
        {
            const string storedprocedure = "[CONFIG].[LOANDETAILS]";
            var parameters = new SqlParameter[6];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = Convert.ToInt32(LoanAccountID) };
            parameters[1] = new SqlParameter("@LoanAccountDetails", SqlDbType.VarChar) { Value = LoanAccountDetails };
            parameters[2] = new SqlParameter("@PurposeOfLoan", SqlDbType.VarChar) { Value = PurposeOfLoan };
            parameters[3] = new SqlParameter("@Description", SqlDbType.VarChar) { Value = Description };
            parameters[4] = new SqlParameter("@Active", SqlDbType.Bit) { Value = Active };
            parameters[5] = new SqlParameter("@UserID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region DELETE_LOAN_ACCOUNT_RELATED_DATA

    public static string DELETE_LOAN_ACCOUNT_RELATED_DATA(int? BankID)
    {
        try
        {
            const string storedprocedure = "CONFIG.[DELETELOANACCOUNTDETAILS]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = BankID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            if (ds.Rows.Count > 0)
            {
                return ds.Rows[0][0].ToString();
            }
            else
            {
                return "";
            }
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return Ex.Message;
        }
    }

    #endregion

    #endregion

    #region TARGET PAGE

    #region TARGET_GET
    public static DataSet TARGET_GET()
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[TARGET_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }
    #endregion

    #region RECOVERYBILLDETAILS_INSERT_UPDATE

    public static DataSet TARGET_INSERT_UPDATRE(string TargetID, string ExecutiveName, string Target, string FromDate, string ToDate, string Active)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[TARGET_INSERT_UPDATE]";
            var parameters = new SqlParameter[6];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = Convert.ToInt32(TargetID) };
            parameters[1] = new SqlParameter("@EXECUTIVEID", SqlDbType.Int) { Value = ExecutiveName };
            parameters[2] = new SqlParameter("@TARGET", SqlDbType.Decimal) { Value = Target == "" ? null : Target };
            parameters[3] = new SqlParameter("@FROM_DATE", SqlDbType.Date) { Value = FromDate };
            parameters[4] = new SqlParameter("@TO_DATE", SqlDbType.Date) { Value = ToDate };
            parameters[5] = new SqlParameter("@ACTIVE", SqlDbType.Bit) { Value = Active };
            var DRDT = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return DRDT;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region TARGET_LIST_GET
    public static DataSet TARGET_LIST_GET(int EXID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[TARGET_LIST_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@EXID", SqlDbType.Int) { Value = EXID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }
    #endregion

    #region TARGET_GET_EDIT
    public static DataSet TARGET_GET_EDIT(int TargetID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[TARGET_GET_EDIT]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = TargetID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }
    #endregion

    #region DELETE_TARGET

    public static string DELETE_TARGET(int? ID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[DELETE_TARGET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = ID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            if (ds.Tables.Count > 0)
            {
                return ds.Tables[0].Rows[0][0].ToString();
            }
            else
            {
                return "";
            }
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #endregion

    #region BANK VISIT PAGE

    #region GET_BANK_RELATED_DATA

    public static DataSet GET_BANK_VISIT_RELATED_DATA(int? EXID, int? BankID, string FDATE, string TDATE)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[BANKVISIT_GET]";
            var parameters = new SqlParameter[5];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[1] = new SqlParameter("@EXECUTIVE_ID", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            parameters[2] = new SqlParameter("@BANK_ID", SqlDbType.Int) { Value = BankID == -1 ? null : BankID };
            parameters[3] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            parameters[4] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region DASHBOARD_EXECUTIVE_DROPDOEN_GET

    public static DataSet DASHBOARD_EXECUTIVE_DROPDOEN_GET(int? City)
    {
        try
        {
            const string storedprocedure = "DASHBOARD.[EXECUTIVE_DROPDOEN_GET]";
            var parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[1] = City == -1 ? new SqlParameter("@CITY", DBNull.Value) : new SqlParameter("@CITY", SqlDbType.Int) { Value = City };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region EXECUTIVE_DROPDOEN_GET

    public static DataSet EXECUTIVE_DROPDOEN_GET()
    {
        try
        {
            const string storedprocedure = "ADMIN.[EXECUTIVE_DROPDOEN_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region DASH_BOARD_BANK_DROPDOWN_GET

    public static DataSet DASH_BOARD_BANK_DROPDOWN_GET(int? City)
    {
        try
        {
            var parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[1] = City == -1 ? new SqlParameter("@CITY", DBNull.Value) : new SqlParameter("@CITY", SqlDbType.Int) { Value = City };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet("DashBoard.[BANK_DROPDOWN_GET]", parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region BANK_DROPDOWN_GET

    public static DataSet BANK_DROPDOWN_GET()
    {
        try
        {
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet("RECOVERY.[BANK_DROPDOWN_GET]", parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region BRANCH_DROPDOWN_GET

    public static DataSet BRANCH_DROPDOWN_GET(string BANK)
    {
        try
        {
            var parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = BANK == "-1" ? null : BANK };
            parameters[1] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet("RECOVERY.[BRANCH_DROPDOWN_GET]", parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region BANKVISIT_GET_BY_BANKVISITID

    public static DataSet BANKVISIT_GET_BY_BANKVISITID(int BankVisitID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[BANKVISIT_GET_BY_BANKVISITID]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@BANKVISITID", SqlDbType.Int) { Value = BankVisitID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region BANK_VISIT_INSERT_UPDATE

    public static DataSet BANK_VISIT_INSERT_UPDATE(string BankVisitID, string ExecutiveName, string BankName, string PurposeOfVisit, string Active, string DATET)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[BANK_VISIT_INSERT_UPDATE]";
            var parameters = new SqlParameter[7];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = Convert.ToInt32(BankVisitID) };
            parameters[1] = new SqlParameter("@EXCUTIVEID", SqlDbType.VarChar) { Value = ExecutiveName };
            parameters[2] = new SqlParameter("@BANK", SqlDbType.Int) { Value = Convert.ToInt32(BankName) };
            parameters[3] = new SqlParameter("@PURPOSE", SqlDbType.VarChar) { Value = PurposeOfVisit };
            parameters[4] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            parameters[5] = new SqlParameter("@ACTIVE", SqlDbType.Bit) { Value = Active };
            parameters[6] = new SqlParameter("@DATE", SqlDbType.DateTime) { Value = Convert.ToDateTime(DATET) };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region BANKVISIT_DELETE

    public static DataSet BANKVISIT_DELETE(int BankVsitID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[BANKVISIT_DELETE]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@BANKVISITID", SqlDbType.Int) { Value = BankVsitID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region BANK_DROPDOWN_FOR_REPORT

    public static DataSet BANK_DROPDOWN_FOR_REPORT()
    {
        try
        {
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet("RECOVERY.[BANK_DROPDOWN_FOR_REPORT]", parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #endregion

    #region NPA DETAILS PAGE

    #region NPADETAILS_GET

    public static DataSet NPADETAILS_GET(int? ID, int? EXID, string Bank, string Branch, int? CityID, string FDATE, string TDATE)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[NPADETAILS_GET]";
            var parameters = new SqlParameter[8];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = ID };
            parameters[1] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            parameters[2] = new SqlParameter("@EXECUTIVE_ID", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            parameters[3] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = Bank == "-1" ? null : Bank };
            parameters[4] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = Branch == "-1" ? null : Branch };
            parameters[5] = new SqlParameter("@CITY_ID", SqlDbType.Int) { Value = CityID == -1 ? null : CityID };
            parameters[6] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            parameters[7] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region NPADETAILS_GET1

    public static DataSet NPADETAILS_GET1(int? ID, int? EXID, string Bank, string Branch, int? CityID, string FDATE, string TDATE)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[NPADETAILS_GET_1]";
            var parameters = new SqlParameter[8];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = ID };
            parameters[1] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            parameters[2] = new SqlParameter("@EXECUTIVE_ID", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            parameters[3] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = Bank == "-1" ? null : Bank };
            parameters[4] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = Branch == "-1" ? null : Branch };
            parameters[5] = new SqlParameter("@CITY_ID", SqlDbType.Int) { Value = CityID == -1 ? null : CityID };
            parameters[6] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            parameters[7] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region NPADETAILS_PURPOSEOFLOAN_GET

    public static DataSet NPADETAILS_PURPOSEOFLOAN_GET(bool Type)
    {
        try
        {
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@TYPE", SqlDbType.Bit) { Value = Type };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet("RECOVERY.[NPADETAILS_PURPOSEOFLOAN_GET]", parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region NPADETAILS_INSERT_UPDATE

    public static DataTable NPADETAILS_INSERT_UPDATE(string NPADetailsID, string ACNo, string ExecutiveID, string BankName, string BorrowerName, string BorrowerAddress, string PHNumber, string CoAppicant, string Guaranty, string GuarantyAddress, string GuarantyPHNumber, string DateOfSanction, string TypeOfLoan, string Purposeofloan, string SecurityDetails, string OutstandingBalance, string DemandNoticeIssued, string Active, string NPADate, string City, string Location, string SymbolicPosition, string Date, string CMMOrderApplied, string AdvocateName, string ADVTContactNo, string PhysicalPosition, string PhyPoDate, string IdtofProperty, string Docfilename, string DoccontentType, byte[] Docbytes)
    {
        try
        {
            var parameters = new SqlParameter[34];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = Convert.ToInt32(NPADetailsID) };
            parameters[1] = new SqlParameter("@BankID", SqlDbType.VarChar) { Value = BankName };
            parameters[2] = new SqlParameter("@LoanAccountNo", SqlDbType.VarChar) { Value = ACNo };
            parameters[3] = new SqlParameter("@BorrowerName", SqlDbType.VarChar) { Value = BorrowerName };
            parameters[4] = new SqlParameter("@BorrowerAddress", SqlDbType.VarChar) { Value = BorrowerAddress };
            parameters[5] = new SqlParameter("@ContactNo", SqlDbType.VarChar) { Value = PHNumber };
            parameters[6] = new SqlParameter("@CoApplicant", SqlDbType.VarChar) { Value = CoAppicant };
            parameters[7] = new SqlParameter("@Guaranty", SqlDbType.VarChar) { Value = Guaranty };
            parameters[8] = new SqlParameter("@GuarantyCellNo", SqlDbType.VarChar) { Value = GuarantyPHNumber };
            parameters[9] = new SqlParameter("@GaurantyAddress", SqlDbType.VarChar) { Value = GuarantyAddress };
            parameters[10] = new SqlParameter("@DateOfSanction", SqlDbType.DateTime) { Value = Convert.ToDateTime(DateOfSanction) };
            parameters[11] = new SqlParameter("@TypeOfLoan", SqlDbType.VarChar) { Value = TypeOfLoan };
            parameters[12] = new SqlParameter("@PurposeOfLoan", SqlDbType.Int) { Value = Purposeofloan == "-1" ? null : Purposeofloan };
            parameters[13] = new SqlParameter("@SecurityDetails", SqlDbType.VarChar) { Value = SecurityDetails };
            parameters[14] = new SqlParameter("@OutstandingBalance", SqlDbType.Decimal) { Value = OutstandingBalance };
            parameters[15] = new SqlParameter("@DemandNotice", SqlDbType.Bit) { Value = DemandNoticeIssued == "0" ? false : true };
            parameters[16] = new SqlParameter("@UploadDocs", SqlDbType.VarChar) { Value = null };
            parameters[17] = new SqlParameter("@UserID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[18] = new SqlParameter("@Active", SqlDbType.Bit) { Value = Active };
            parameters[19] = new SqlParameter("@ExecutiveID", SqlDbType.Int) { Value = Convert.ToInt32(ExecutiveID) };
            parameters[20] = new SqlParameter("@SymbolicPosition", SqlDbType.Int) { Value = SymbolicPosition == "-1" ? null : SymbolicPosition };
            parameters[21] = new SqlParameter("@Date1", SqlDbType.DateTime) { Value = Date == "" ? null : Date };
            parameters[22] = new SqlParameter("@CMMOrderApplied", SqlDbType.Int) { Value = CMMOrderApplied == "-1" ? null : CMMOrderApplied };
            parameters[23] = new SqlParameter("@AdvocateName", SqlDbType.VarChar) { Value = AdvocateName };
            parameters[24] = new SqlParameter("@AdvContactNo", SqlDbType.VarChar) { Value = ADVTContactNo };
            parameters[25] = new SqlParameter("@PhysicalPosition", SqlDbType.Int) { Value = Convert.ToInt32(PhysicalPosition) };
            parameters[26] = new SqlParameter("@Date2", SqlDbType.DateTime) { Value = PhyPoDate == "" ? null : PhyPoDate };
            parameters[27] = new SqlParameter("@Investigation", SqlDbType.VarChar) { Value = IdtofProperty };
            parameters[28] = new SqlParameter("@City", SqlDbType.Int) { Value = Convert.ToInt32(City) };
            parameters[29] = new SqlParameter("@Location", SqlDbType.VarChar) { Value = Location };
            parameters[30] = new SqlParameter("@NPADate", SqlDbType.DateTime) { Value = NPADate == "" ? null : NPADate };
            parameters[31] = new SqlParameter("@FileName", SqlDbType.VarChar) { Value = Docfilename };
            parameters[32] = new SqlParameter("@DocumentType", SqlDbType.VarChar) { Value = DoccontentType };
            parameters[33] = new SqlParameter("@DocBytes", SqlDbType.VarBinary) { Value = Docbytes == null ? (object)DBNull.Value : Docbytes };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedure("[Recovery].[NPADETAILS_INSERT_UPDATE]", parameters);
            if (ds.Rows.Count > 0 && Convert.ToInt32(NPADetailsID) == 0)
            {
                Thread NPA_MAIL = new Thread(() => SEND_NPA_MAIL(Convert.ToInt32(ds.Rows[0][0]), "NEW"));
                NPA_MAIL.Start();
            }
            else
            {
                Thread NPA_MAIL = new Thread(() => SEND_NPA_MAIL(Convert.ToInt32(NPADetailsID), "UPDATE"));
                NPA_MAIL.Start();
            }
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region DELETENPADetails

    public static DataSet DELETENPADetails(int NPAID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[DELETENPADetails]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = NPAID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region NPADETAILS_EX_GET

    public static DataSet NPADETAILS_EX_GET(int? ID, int REF_ID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[NPADETAILS_GET_BY_EXECUTIVE]";
            var parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = ID };
            parameters[1] = new SqlParameter("@REF_ID", SqlDbType.Int) { Value = REF_ID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region NPADETAILS_GET_EXID

    public static DataSet NPADETAILS_GET_EXID(int ID, int REF_ID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[NPADETAILS_GET_EXID]";
            var parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@EXID", SqlDbType.Int) { Value = ID };
            parameters[1] = new SqlParameter("@REF_ID", SqlDbType.Int) { Value = REF_ID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region ACCOUNT_NUMBER_EXIST_OR_NOT

    public static DataTable ACCOUNT_NUMBER_EXIST_OR_NOT(int? BankID, string AccountNumberHidden)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[ACCOUNT_NUMBER_EXIST_OR_NOT]";
            var parameters = new SqlParameter[3];
            parameters[0] = BankID == -1 ? new SqlParameter("@BANKID", DBNull.Value) : new SqlParameter("@BANKID", SqlDbType.Int) { Value = BankID };
            parameters[1] = AccountNumberHidden == "0" ? new SqlParameter("@ACCOUNTNUMBERHIDDEN", DBNull.Value) : new SqlParameter("@ACCOUNTNUMBERHIDDEN", SqlDbType.VarChar) { Value = AccountNumberHidden };
            parameters[2] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #endregion

    #region EXCUTIVE WISE VISIT PAGE

    #region EXECUTIVEWISEVISITDETAILS_GET

    public static DataSet EXECUTIVEWISEVISITDETAILS_GET(int? ID, int? EXID, string BANK, string BRANCH, string FDATE, string TDATE, int? CITYID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[EXECUTEWISEDETAILS_GET]";
            var parameters = new SqlParameter[8];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = ID };
            parameters[1] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            parameters[2] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            parameters[3] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            parameters[4] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = BANK == "-1" ? null : BANK };
            parameters[5] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = BRANCH == "-1" ? null : BRANCH };
            parameters[6] = new SqlParameter("@EXCUTIVE_ID", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            parameters[7] = new SqlParameter("@CITYID", SqlDbType.Int) { Value = CITYID == -1 ? null : CITYID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region PRE_RECOVERED_AMOUNT_ON_EXECUTIVE_VISIT

    public static DataSet PRE_RECOVERED_AMOUNT_ON_EXECUTIVE_VISIT(int? ID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[PRE_RECOVERED_AMOUNT_ON_EXECUTIVE_VISIT]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@NPAID", SqlDbType.Int) { Value = ID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region EXECUTEWISEDETAILS_INSERT_UPDATE

    public static void EXECUTEWISEDETAILS_INSERT_UPDATE(string EWVID, string ExecutiveName, string NPADetails, string Date, string LoanAmount, string AmountRecovered, string BalanceAmount, string Comments, string NextDateForVisit, string Active, string BankRangetype)// string PlaceVisited,
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[EXECUTEWISEDETAILS_INSERT_UPDATE]";
            var parameters = new SqlParameter[12];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = EWVID };
            parameters[1] = new SqlParameter("@ExecuteID", SqlDbType.Int) { Value = ExecutiveName };
            parameters[2] = new SqlParameter("@NPAID", SqlDbType.Int) { Value = NPADetails };
            parameters[3] = new SqlParameter("@Date", SqlDbType.Date) { Value = Date };
            parameters[4] = new SqlParameter("@LoanAmount", SqlDbType.Decimal) { Value = LoanAmount };
            //parameters[5] = new SqlParameter("@PlaceVisited", SqlDbType.VarChar) { Value = PlaceVisited };
            parameters[5] = new SqlParameter("@AmountRecoverd", SqlDbType.Decimal) { Value = AmountRecovered };
            parameters[6] = new SqlParameter("@BalanceAmount", SqlDbType.Decimal) { Value = BalanceAmount };
            parameters[7] = new SqlParameter("@Comments", SqlDbType.Text) { Value = Comments };
            parameters[8] = NextDateForVisit == "" ? new SqlParameter("@NextDateForVisit", DBNull.Value) : new SqlParameter("@NextDateForVisit", SqlDbType.Date) { Value = NextDateForVisit };
            parameters[9] = new SqlParameter("@UserID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[10] = new SqlParameter("@Active", SqlDbType.Bit) { Value = Active };
            parameters[11] = new SqlParameter("@BankRangetype", SqlDbType.Int) { Value = BankRangetype };
            DataTable DT = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            if (Convert.ToInt32(EWVID) == 0 && DT.Rows.Count > 0)
            {
                Thread RECORDS_OF_VISIT_MAIL = new Thread(() => SEND_RECORDS_OF_VISIT_MAIL(Convert.ToInt32(DT.Rows[0][0]), "NEW"));
                RECORDS_OF_VISIT_MAIL.Start();
            }
            else
            {
                Thread RECORDS_OF_VISIT_MAIL = new Thread(() => SEND_RECORDS_OF_VISIT_MAIL(Convert.ToInt32(EWVID), "UPDATE"));
                RECORDS_OF_VISIT_MAIL.Start();
            }
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
        }
    }

    #endregion

    #region EXECUTEWISEDETAILS_DELETE

    public static DataSet EXECUTEWISEDETAILS_DELETE(int EWVID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[EXECUTEWISEDETAILS_DELETE]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = EWVID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #endregion

    #region RECOVERY BILL DETAILS PAGE

    #region PREVIOUS_RECOVERED_AMOUNT

    public static DataSet PREVIOUS_RECOVERED_AMOUNT(int? ID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[PREVIOUS_RECOVERED_AMOUNT]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@NPAID", SqlDbType.Int) { Value = ID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RECOVERYBILLDETAILS_GET

    public static DataSet RECOVERYBILLDETAILS_GET(int? ID, int? EXECUTIVE, string BANK, string BRANCH, int? NPAID, string FDATE, string TDATE)
    {
        try
        {
            //const string storedprocedure = "[RECOVERY].[RECOVERYBILLDETAILS_GET]";
            const string storedprocedure = "[RECOVERY].[RECOVERYBILL_GET]";
            var parameters = new SqlParameter[7];
            //parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = ID };
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[1] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = BANK == "-1" ? null : BANK };
            parameters[2] = new SqlParameter("@NPA_ID", SqlDbType.Int) { Value = NPAID == -1 ? null : NPAID };
            parameters[3] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            parameters[4] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            parameters[5] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = BRANCH == "-1" ? null : BRANCH };
            parameters[6] = new SqlParameter("@EXECUTIVE_ID", SqlDbType.Int) { Value = EXECUTIVE == -1 ? null : EXECUTIVE };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region EDIT_RECOVERYBILLDETAILS_GET

    public static DataSet EDIT_RECOVERYBILLDETAILS_GET(int? ID, string BANK, string BRANCH, int? NPAID, string FDATE, string TDATE)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[RECOVERYBILLDETAILS_GET]";
            var parameters = new SqlParameter[7];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = ID };
            parameters[1] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[2] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = BANK == "-1" ? null : BANK };
            parameters[3] = new SqlParameter("@NPA_ID", SqlDbType.Int) { Value = NPAID == -1 ? null : NPAID };
            parameters[4] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            parameters[5] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            parameters[6] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = BRANCH == "-1" ? null : BRANCH };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RECOVERYBILLDETAILS_INSERT_UPDATE

    public static void RECOVERYBILLDETAILS_INSERT_UPDATE(string RecoveryBillID, string ExecutiveName, string NPADetails, string RecoveredAmount, string BalanceAmount, string RecoveredDate, string RecoveredAmountCommission, string ServiceTax, string TotalCommission, string BoardCharges, string TransportCharges, string ValuationCharges, string Surveyorcharges, string PropertyIdentificationcharges, string InvestigationCharges, string MiscellaneousCharges, string Active, string BankRangeType)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[RECOVERYBILLDETAILS_INSERT_UPDATE]";
            var parameters = new SqlParameter[19];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = Convert.ToInt32(RecoveryBillID) };
            parameters[1] = new SqlParameter("@ExecutiveID", SqlDbType.Int) { Value = ExecutiveName };
            parameters[2] = new SqlParameter("@NPAID", SqlDbType.Int) { Value = NPADetails };
            parameters[3] = new SqlParameter("@BalanceAmount", SqlDbType.Decimal) { Value = BalanceAmount == "" ? null : BalanceAmount };
            parameters[4] = new SqlParameter("@RecoveryAmount", SqlDbType.Decimal) { Value = RecoveredAmount };
            parameters[5] = new SqlParameter("@ServiceTaxPer", SqlDbType.Decimal) { Value = ServiceTax == "" ? null : ServiceTax };
            parameters[6] = new SqlParameter("@RecoverDate", SqlDbType.Date) { Value = RecoveredDate };
            parameters[7] = new SqlParameter("@RecoveryAmountCommission", SqlDbType.Decimal) { Value = RecoveredAmountCommission };
            parameters[8] = new SqlParameter("@TotalCommission", SqlDbType.Decimal) { Value = TotalCommission };
            parameters[9] = new SqlParameter("@UserID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[10] = new SqlParameter("@Active", SqlDbType.Bit) { Value = Active };
            parameters[11] = new SqlParameter("@BoardCharges", SqlDbType.Int) { Value = BoardCharges == "" ? 0 : Convert.ToDecimal(BoardCharges) };
            parameters[12] = new SqlParameter("@TransportCharges", SqlDbType.Int) { Value = TransportCharges == "" ? 0 : Convert.ToDecimal(TransportCharges) };
            parameters[13] = new SqlParameter("@ValuationCharges", SqlDbType.Int) { Value = ValuationCharges == "" ? 0 : Convert.ToDecimal(ValuationCharges) };
            parameters[14] = new SqlParameter("@Surveyorcharges", SqlDbType.Int) { Value = Surveyorcharges == "" ? 0 : Convert.ToDecimal(Surveyorcharges) };
            parameters[15] = new SqlParameter("@PropertyIdentificationcharges", SqlDbType.Int) { Value = PropertyIdentificationcharges == "" ? 0 : Convert.ToDecimal(PropertyIdentificationcharges) };
            parameters[16] = new SqlParameter("@InvestigationCharges", SqlDbType.Int) { Value = InvestigationCharges == "" ? 0 : Convert.ToDecimal(InvestigationCharges) };
            parameters[17] = new SqlParameter("@MiscellaneousCharges", SqlDbType.Int) { Value = MiscellaneousCharges == "" ? 0 : Convert.ToDecimal(MiscellaneousCharges) };
            parameters[18] = new SqlParameter("@BankRangeType", SqlDbType.Int) { Value = BankRangeType };
            DataTable DRDT = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            if (DRDT.Rows.Count > 0 && Convert.ToInt32(RecoveryBillID) == 0)
            {
                Thread RECOVEY_BILL_DETAILS_MAIL = new Thread(() => SEND_RECOVEY_BILL_DETAILS_MAIL(Convert.ToInt32(DRDT.Rows[0][0]), "NEW"));
                RECOVEY_BILL_DETAILS_MAIL.Start();
            }
            else
            {
                Thread RECOVEY_BILL_DETAILS_MAIL = new Thread(() => SEND_RECOVEY_BILL_DETAILS_MAIL(Convert.ToInt32(RecoveryBillID), "UPDATE"));
                RECOVEY_BILL_DETAILS_MAIL.Start();
            }
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
        }
    }

    #endregion

    #region BANK_RANGE_PERCENTAGE

    public static DataSet BANK_RANGE_PERCENTAGE(int NPAID, int RANGETYPE, string AMOUNT)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[BANK_RANGE_PERCENTAGE]";
            var parameters = new SqlParameter[3];
            parameters[0] = new SqlParameter("@NPAID", SqlDbType.Int) { Value = NPAID };
            parameters[1] = new SqlParameter("@RANGETYPE", SqlDbType.Int) { Value = RANGETYPE };
            parameters[2] = new SqlParameter("@AMOUNT", SqlDbType.Decimal) { Value = AMOUNT };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RECOVERYBILLS_LIST_GET

    public static DataSet RECOVERYBILLS_LIST_GET(int NPAID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[RECOVERYBILLS_LIST_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@NPAID", SqlDbType.Int) { Value = NPAID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region NPADETAILS_FOR_BILL

    public static DataSet NPADETAILS_FOR_SN(int? BANKID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[NPADETAILS_FOR_SN]";
            var parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@BANKID", SqlDbType.Int) { Value = BANKID ?? 0 };
            parameters[1] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RECOVERY_BILLS_FOR_SN

    public static DataSet RECOVERY_BILLS_FOR_SN(string IDS)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[RECOVERY_BILLS_FOR_SN]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@NPAIDS", SqlDbType.Text) { Value = IDS };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region SERIALNUMBER_INSERT

    public static DataTable SERIALNUMBER_INSERT(string IDS)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[SERIALNUMBER_INSERT]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@RBIDS", SqlDbType.Text) { Value = IDS };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #endregion

    #region RECOVERY_STATEMENT

    #region RECOVERY_STATEMENT_GET

    public static DataSet RECOVERY_STATEMENT_GET(int? ID, string BANK, string BRANCH, int? NPAID, int? STATUS, string FDATE, string TDATE)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[RECOVERY_STATEMENT_GET]";
            var parameters = new SqlParameter[8];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = ID };
            parameters[1] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[2] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = BANK == "-1" ? null : BANK };
            parameters[3] = new SqlParameter("@NPA_ID", SqlDbType.Int) { Value = NPAID == -1 ? null : NPAID };
            parameters[4] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            parameters[5] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            parameters[6] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = BRANCH == "-1" ? null : BRANCH };
            parameters[7] = new SqlParameter("@STATUS", SqlDbType.Int) { Value = STATUS == -1 ? null : STATUS };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RECOVERY_STATEMENT_BILLS_GET

    public static DataSet RECOVERY_STATEMENT_BILLS_GET(int NPA_ID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[RECOVERY_STATEMENT_BILLS_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@NPAID", SqlDbType.Int) { Value = NPA_ID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RECOVERY_STATEMENT_INSERT_UPDATE

    public static void RECOVERY_STATEMENT_INSERT_UPDATE(string RecoveryStatementID, string BankName, string NPADetails, string BillAmountRecovered, string Date, string Amountlesspaid, string TDS, string Active)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[RECOVERY_STATEMENT_INSERT_UPDATE]";
            var parameters = new SqlParameter[9];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = Convert.ToInt32(RecoveryStatementID) };
            parameters[1] = new SqlParameter("@BANK_ID", SqlDbType.Int) { Value = Convert.ToInt32(BankName) };
            parameters[2] = new SqlParameter("@NPA_ID", SqlDbType.Int) { Value = Convert.ToInt32(NPADetails) };
            parameters[3] = new SqlParameter("@BILL_AMOUNT_RECOVERED", SqlDbType.Decimal) { Value = BillAmountRecovered };
            parameters[4] = new SqlParameter("@BILL_DATE", SqlDbType.DateTime) { Value = Date };
            parameters[5] = new SqlParameter("@CREATED_BY", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[6] = new SqlParameter("@ACTIVE", SqlDbType.Bit) { Value = Active };
            parameters[7] = new SqlParameter("@AMOUNTLESSPAID", SqlDbType.Decimal) { Value = Amountlesspaid };
            parameters[8] = new SqlParameter("@TDS", SqlDbType.Decimal) { Value = TDS };
            DataTable DRDT = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            if (DRDT.Rows.Count > 0 && Convert.ToInt32(RecoveryStatementID) == 0)
            {
                Thread RECOVEY_STATEMENT_MAIL = new Thread(() => SEND_RECOVEY_STATEMENT_MAIL(Convert.ToInt32(DRDT.Rows[0][0]), "NEW"));
                RECOVEY_STATEMENT_MAIL.Start();
            }
            else
            {
                Thread RECOVEY_STATEMENT_MAIL = new Thread(() => SEND_RECOVEY_STATEMENT_MAIL(Convert.ToInt32(RecoveryStatementID), "UPDATE"));
                RECOVEY_STATEMENT_MAIL.Start();
            }
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
        }
    }

    #endregion

    #region RECOVERY_STATEMENT_DELETE

    public static DataSet RECOVERY_STATEMENT_DELETE(int ID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[RECOVERY_STATEMENT_DELETE]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = ID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region NPADETAILS_GET_BY_BANKID

    public static DataSet NPADETAILS_GET_BY_BANKID(int? BANKID, int REF_ID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[NPADETAILS_GET_BY_BANKID]";
            var parameters = new SqlParameter[3];
            parameters[0] = new SqlParameter("@BANKID", SqlDbType.Int) { Value = BANKID ?? 0 };
            parameters[1] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[2] = new SqlParameter("@REF_ID", SqlDbType.Int) { Value = REF_ID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RECOVERED_AMOUNT_GET

    public static DataSet RECOVERED_AMOUNT_GET(int NPAID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[RECOVERED_AMOUNT_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@NPAID", SqlDbType.Int) { Value = NPAID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region NPADETAILS_BY_BANK_BRANCH

    public static DataSet NPADETAILS_BY_BANK_BRANCH(string BANK, string Branch)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[NPADETAILS_BY_BANK_BRANCH]";
            var parameters = new SqlParameter[3];
            parameters[0] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = BANK == "-1" ? null : BANK };
            parameters[1] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[2] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = Branch == "-1" ? null : Branch };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #endregion

    #region DAILY REPORT
    #region GET_DAILY_REPORT_RELATED_DATA

    public static DataSet GET_DAILY_REPORT_RELATED_DATA(int? EXID, string Bank, string Branch, int? CityID, string DATE, int? STATUS)
    {
        try
        {
            const string storedprocedure = "[Recovery].[RECOVERYBILLDETAILS_NPA_BANK_DETAILS_1]";
            var parameters = new SqlParameter[7];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            parameters[1] = new SqlParameter("@EXECUTIVE_ID", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            parameters[2] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = Bank == "-1" ? null : Bank };
            parameters[3] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = Branch == "-1" ? null : Branch };
            parameters[4] = new SqlParameter("@CITY_ID", SqlDbType.Int) { Value = CityID == -1 ? null : CityID };
            parameters[5] = DATE == "" ? new SqlParameter("@DATE", DBNull.Value) : new SqlParameter("@DATE", SqlDbType.Date) { Value = DATE };
            parameters[6] = new SqlParameter("@STATUS", SqlDbType.Bit) { Value = STATUS == -1 ? null : STATUS };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion
    #endregion

    #region REPORTS

    #region USER_DETAILS_REPORT

    public static DataTable USER_DETAILS_REPORT()
    {
        try
        {
            var Parameters = new SqlParameter[1];
            Parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("REPORT.[USERDETAILS]", Parameters);
            return dt;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region BANK_DETAILS_REPORT

    public static DataTable BANK_DETAILS_REPORT()
    {
        try
        {
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("REPORT.[BANKDETAILS]", parameters);
            return dt;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RECOVERY_BILL

    public static DataTable RECOVERY_BILL(int BILLID)
    {
        try
        {
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = BILLID };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("REPORT.[RECOVERY_BILL]", parameters);
            return dt;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RECOVERY_BILL_SN

    public static DataTable RECOVERY_BILL_SN(string SN)
    {
        try
        {
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@SERIAL_NUMBER", SqlDbType.VarChar) { Value = SN };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("REPORT.[RECOVERY_BILL_1]", parameters);
            return dt;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RECOVERY_BILL_DETAILS

    public static DataTable RECOVERY_BILL_DETAILS(int? EXECUTIVE, string BANK, string BRANCH, int? NPAID, string FDATE, string TDATE)
    {
        try
        {
            var Parameters = new SqlParameter[7];
            Parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            Parameters[1] = new SqlParameter("@NPA_ID", SqlDbType.Int) { Value = NPAID == -1 ? null : NPAID };
            Parameters[2] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            Parameters[3] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            Parameters[4] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = BANK == "-1" ? null : BANK };
            Parameters[5] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = BRANCH == "-1" ? null : BRANCH };
            Parameters[6] = new SqlParameter("@EXECUTIVE_ID", SqlDbType.Int) { Value = EXECUTIVE == -1 ? null : EXECUTIVE };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("REPORT.[RECOVERY_BILL_DETAILS]", Parameters);
            return dt;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region EXECUTIVE_VISIT_DETAILS

    public static DataTable EXECUTIVE_VISIT_DETAILS(int? EXID, string FDATE, string TDATE, string BANK, string BRANCH, int CITYID)
    {
        try
        {
            var Parameters = new SqlParameter[7];
            Parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            Parameters[1] = new SqlParameter("@EXECUTIVE_ID", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            Parameters[2] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            Parameters[3] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            Parameters[4] = BANK == "-1" ? new SqlParameter("@BANK", DBNull.Value) : new SqlParameter("@BANK", SqlDbType.VarChar) { Value = BANK };
            Parameters[5] = BRANCH == "-1" ? new SqlParameter("@BRANCH", DBNull.Value) : new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = BRANCH };
            Parameters[6] = new SqlParameter("@CITYID", SqlDbType.Int) { Value = CITYID.ToString() == "-1" ? null : CITYID.ToString() };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("REPORT.[EXECUTIVE_VISIT_DETAILS]", Parameters);
            return dt;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region LOAN_ACCOUNT_DETAILS

    public static DataSet LOAN_ACCOUNT_DETAILS()
    {
        try
        {
            return SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet("REPORT.[LOAN_ACCOUNT_DETAILS]", null);
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region BANK_VISIT_DETAILS

    public static DataTable BANK_VISIT_DETAILS(int? EXID, int? BankID, string FDATE, string TDATE)
    {
        try
        {
            var Parameters = new SqlParameter[5];
            Parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            Parameters[1] = new SqlParameter("@EXECUTIVE_ID", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            Parameters[2] = new SqlParameter("@BANK_ID", SqlDbType.Int) { Value = BankID == -1 ? null : BankID };
            Parameters[3] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            Parameters[4] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("REPORT.[BANK_VISIT_DETAILS]", Parameters);
            return dt;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region NPA_DETAILS_REPORT

    public static DataTable NPA_DETAILS_REPORT(int? EXID, string Bank, string Branch, int? CityID, string FDATE, string TDATE)
    {
        try
        {
            var Parameters = new SqlParameter[7];
            Parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            Parameters[1] = new SqlParameter("@EXECUTIVE_ID", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            Parameters[2] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = Bank == "-1" ? null : Bank };
            Parameters[3] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = Branch == "-1" ? null : Branch };
            Parameters[4] = new SqlParameter("@CITY_ID", SqlDbType.Int) { Value = CityID == -1 ? null : CityID };
            Parameters[5] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            Parameters[6] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("REPORT.[NPA_DETAILS_REPORT]", Parameters);
            return dt;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region NPA_RECOVERY_REPORT

    public static DataTable NPA_RECOVERY_REPORT(string ID)
    {
        try
        {
            var Parameters = new SqlParameter[1];
            Parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = Convert.ToInt32(ID) };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("REPORT.[NPA_RECOVERY_REPORT]", Parameters);
            return dt;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region EXCEL_UPLOAD_DATA_XML

    public static DataTable EXCEL_UPLOAD_DATA_XML(int EXID, string XML, int CITYID)
    {
        try
        {
            var Parameters = new SqlParameter[3];
            Parameters[0] = new SqlParameter("@EXID", SqlDbType.Int) { Value = EXID };
            Parameters[1] = new SqlParameter("@XML", SqlDbType.Xml) { Value = XML };
            Parameters[2] = new SqlParameter("@CITYID", SqlDbType.Int) { Value = CITYID };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("REPORT.[EXCEL_UPLOAD_DATA_XML]", Parameters);
            return dt;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region EXCEL_UPLOAD_DATA_XML1

    public static DataSet EXCEL_UPLOAD_DATA_XML1(DataTable EXCEL_DT, int CITYID)
    {
        try
        {
            EXCEL_DT.Columns["DATE_OF_ALLOTMENT"].SetOrdinal(0);
            EXCEL_DT.Columns["BANK"].SetOrdinal(1);
            EXCEL_DT.Columns["BRANCH"].SetOrdinal(2);
            EXCEL_DT.Columns["ACCOUNT_NO"].SetOrdinal(3);
            EXCEL_DT.Columns["BORROWER_NAME"].SetOrdinal(4);
            EXCEL_DT.Columns["ACCOUNT_CATEGORY"].SetOrdinal(5);
            EXCEL_DT.Columns["ACCOUNT_TYPE"].SetOrdinal(6);
            EXCEL_DT.Columns["DATE_OF_NPA"].SetOrdinal(7);
            EXCEL_DT.Columns["AMT_OS"].SetOrdinal(8);
            EXCEL_DT.Columns["LOCATION"].SetOrdinal(9);
            EXCEL_DT.Columns["ADDRESS"].SetOrdinal(10);
            EXCEL_DT.Columns["EXECUTIVE_NAME"].SetOrdinal(11);

            var Parameters = new SqlParameter[2];
            //Parameters[0] = new SqlParameter("@EXID", SqlDbType.Int) { Value = EXID };
            Parameters[0] = new SqlParameter("@EXCELDATA", SqlDbType.Structured) { Value = EXCEL_DT };
            Parameters[1] = new SqlParameter("@CITYID", SqlDbType.Int) { Value = CITYID };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet("REPORT.[EXCEL_UPLOAD_DATA_XML_1]", Parameters);
            return dt;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region EXCEL_UPLOAD_DATA_XML_CHECK

    public static DataSet EXCEL_UPLOAD_DATA_XML_CHECK(DataTable EXCEL_DT, int CITYID)
    {
        try
        {
            EXCEL_DT.Columns["DATE_OF_ALLOTMENT"].SetOrdinal(0);
            EXCEL_DT.Columns["BANK"].SetOrdinal(1);
            EXCEL_DT.Columns["BRANCH"].SetOrdinal(2);
            EXCEL_DT.Columns["ACCOUNT_NO"].SetOrdinal(3);
            EXCEL_DT.Columns["BORROWER_NAME"].SetOrdinal(4);
            EXCEL_DT.Columns["ACCOUNT_CATEGORY"].SetOrdinal(5);
            EXCEL_DT.Columns["ACCOUNT_TYPE"].SetOrdinal(6);
            EXCEL_DT.Columns["DATE_OF_NPA"].SetOrdinal(7);
            EXCEL_DT.Columns["AMT_OS"].SetOrdinal(8);
            EXCEL_DT.Columns["LOCATION"].SetOrdinal(9);
            EXCEL_DT.Columns["ADDRESS"].SetOrdinal(10);
            EXCEL_DT.Columns["EXECUTIVE_NAME"].SetOrdinal(11);

            var Parameters = new SqlParameter[2];
            //Parameters[0] = new SqlParameter("@EXID", SqlDbType.Int) { Value = EXID };
            Parameters[0] = new SqlParameter("@EXCELDATA", SqlDbType.Structured) { Value = EXCEL_DT };
            Parameters[1] = new SqlParameter("@CITYID", SqlDbType.Int) { Value = CITYID };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet("REPORT.[EXCEL_UPLOAD_DATA_XML_CHECK]", Parameters);
            return dt;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region RECOVERY_STATEMENT_REPORT

    public static DataTable RECOVERY_STATEMENT_REPORT(int? ID, string BANK, string BRANCH, int? NPAID, int? STATUS, string FDATE, string TDATE)
    {
        try
        {
            const string storedprocedure = "[REPORT].[RECOVERY_STATEMENT_REPORT]";
            var parameters = new SqlParameter[8];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[1] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = BANK == "-1" ? null : BANK };
            parameters[2] = new SqlParameter("@NPA_ID", SqlDbType.Int) { Value = NPAID == -1 ? null : NPAID };
            parameters[3] = FDATE == "" ? new SqlParameter("@FROMDATE", DBNull.Value) : new SqlParameter("@FROMDATE", SqlDbType.Date) { Value = FDATE };
            parameters[4] = TDATE == "" ? new SqlParameter("@TODATE", DBNull.Value) : new SqlParameter("@TODATE", SqlDbType.Date) { Value = TDATE };
            parameters[5] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = BRANCH == "-1" ? null : BRANCH };
            parameters[6] = new SqlParameter("@STATUS", SqlDbType.Int) { Value = STATUS == -1 ? null : STATUS };
            parameters[7] = new SqlParameter("@ID", SqlDbType.Int) { Value = ID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region DAILY_REPORT

    public static DataTable DAILY_REPORT(int? EXID, string Bank, string Branch, int? CityID, string DATE, int? STATUS)
    {
        try
        {
            var Parameters = new SqlParameter[7];
            Parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            Parameters[1] = new SqlParameter("@EXECUTIVE_ID", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            Parameters[2] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = Bank == "-1" ? null : Bank };
            Parameters[3] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = Branch == "-1" ? null : Branch };
            Parameters[4] = new SqlParameter("@CITY_ID", SqlDbType.Int) { Value = CityID == -1 ? null : CityID };
            Parameters[5] = DATE == "" ? new SqlParameter("@DATE", DBNull.Value) : new SqlParameter("@DATE", SqlDbType.Date) { Value = DATE };
            Parameters[6] = new SqlParameter("@STATUS", SqlDbType.Bit) { Value = STATUS == -1 ? null : STATUS };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("[Recovery].[RECOVERYBILLDETAILS_NPA_BANK_DETAILS_1]", Parameters);
            return dt;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region TARGET_GET
    public static DataTable TARGET_GET_REPORT()
    {
        try
        {
            const string storedprocedure = "[REPORT].[TARGET_GET]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }
    #endregion

    #region Executive Report

    public static DataSet EXECUTIVE_REPORT(int? EXID, string Bank, string Branch, int? NPAID)
    {
        try
        {
            const string storedprocedure = "[REPORT].[EXECUTIVE_RECOVERY_REPORT]";
            var parameters = new SqlParameter[5];
            parameters[0] = new SqlParameter("@USERID", SqlDbType.Int) { Value = Convert.ToInt32(GetUserIDFromCookie()) };
            parameters[1] = new SqlParameter("@EXECUTIVE_ID", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            parameters[2] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = Bank == "-1" ? null : Bank };
            parameters[3] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = Branch == "-1" ? null : Branch };
            parameters[4] = new SqlParameter("@NPAID", SqlDbType.Int) { Value = NPAID == -1 ? null : NPAID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #region EXECUTIVE_REPORT_BY_BANK_BRANCH

    public static DataSet EXECUTIVE_REPORT_BY_BANK_BRANCH(int? EXID, string BANK, string Branch)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[EXECUTIVE_REPORT_BY_BANK_BRANCH]";
            var parameters = new SqlParameter[4];
            parameters[0] = new SqlParameter("@BANK", SqlDbType.VarChar) { Value = BANK == "-1" ? null : BANK };
            parameters[1] = new SqlParameter("@USERID", SqlDbType.Int) { Value = GetUserIDFromCookie() };
            parameters[2] = new SqlParameter("@BRANCH", SqlDbType.VarChar) { Value = Branch == "-1" ? null : Branch };
            parameters[3] = new SqlParameter("@EXID", SqlDbType.Int) { Value = EXID == -1 ? null : EXID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet(storedprocedure, parameters);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #endregion

    #endregion

    #region CITY
    public static string AddCity(string CityID, string CityName)
    {
        try
        {
            const string storedprocedure = "[ADMIN].[CITY_INSERT]";
            var parameters = new SqlParameter[2];
            parameters[0] = new SqlParameter("@CityID", SqlDbType.Int) { Value = Convert.ToInt32(CityID) };
            parameters[1] = new SqlParameter("@CityName", SqlDbType.VarChar) { Value = CityName };
            DataTable DT = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            if (DT.Rows.Count > 0)
            {
                return DT.Rows[0][0].ToString();
            }
            else
            {
                return "";
            }
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return EX.Message;
        }
    }
    public static DataSet CITY_GET()
    {
        try
        {
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedureReturnDataSet("[ADMIN].[CITY_GET]", null);
            return ds;
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region GET_USERID_FROM_COOKIE
    public static int GetUserIDFromCookie()
    {
        string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["CustomerRecoveryConnectionString"].ConnectionString;
        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(connectionString);
        int UserID = Convert.ToInt32(HttpContext.Current.Request.Cookies[builder.InitialCatalog + "_" + "userid"].Value);
        return UserID;
    }
    #endregion

    #region GET_USERROLE_FROM_COOKIE
    public static int GetUserRoleFromCookie()
    {
        int UserRole = Convert.ToInt32(HttpContext.Current.Request.Cookies["UserRole"].Value);
        return UserRole;
    }
    #endregion

    #region PASSWORD MD5
    public static string PassEncrypt(byte[] password)
    {
        MD5 md5 = MD5.Create();
        byte[] b = md5.ComputeHash(password);
        string hash = Convert.ToBase64String(b);
        return hash;
    }
    #endregion

    #region REPORTS EXPORT

    public static void GENERATEREPORT(DataTable ExportTable, string ReportName, int ReportType)
    {
        try
        {
            if (ExportTable.Rows.Count > 0)
            {
                //XLS =1 ; XLSX = 2 ; PDF = 3 
                if (ReportType == 1)
                {
                    var workbook = new HSSFWorkbook();
                    var sheet = workbook.CreateSheet();
                    var headerRow = sheet.CreateRow(0);
                    for (int i = 0; i < ExportTable.Columns.Count; i++)
                    {
                        var font = workbook.CreateFont();
                        font.FontHeightInPoints = 11;
                        font.FontName = "Calibri";
                        font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;
                        sheet.SetColumnWidth(i, (ExportTable.Columns[i].Caption.ToUpper().Length + 6) * 256);
                        headerRow.CreateCell(i).SetCellValue(ExportTable.Columns[i].Caption.ToUpper());
                        sheet.GetRow(0).GetCell(i).RichStringCellValue.ApplyFont(font);
                    }
                    sheet.CreateFreezePane(0, 1, 0, 1);
                    DataRow DR = ExportTable.Rows[ExportTable.Rows.Count - 1];
                    bool ISBOLD = false;
                    for (int k = 0; k < ExportTable.Columns.Count; k++)
                    {
                        if (DR[k].ToString() == "TOTAL")
                        {
                            ISBOLD = true;
                            //for (int L = 0; L < ExportTable.Columns.Count; L++)
                            //{
                            //    var font = workbook.CreateFont();
                            //    font.FontHeightInPoints = 11;
                            //    font.FontName = "Calibri";
                            //    font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;
                            //    sheet.GetRow(ExportTable.Rows.Count).GetCell(L).RichStringCellValue.ApplyFont(font);
                            //}
                        }
                    }
                    for (int i = 0; i < ExportTable.Rows.Count; i++)
                    {
                        var row = sheet.CreateRow(i + 1);
                        for (int j = 0; j < ExportTable.Columns.Count; j++)
                        {
                            if (ExportTable.Rows.Count - 1 == i)
                            {
                                if (ISBOLD)
                                {
                                    var font = workbook.CreateFont();
                                    font.FontHeightInPoints = 11;
                                    font.FontName = "Calibri";
                                    font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;
                                    sheet.SetColumnWidth(j, (ExportTable.Rows[i][j].ToString().Length + 6) * 256);
                                    row.CreateCell(j).SetCellValue(ExportTable.Rows[i][j].ToString());
                                    sheet.GetRow(i + 1).GetCell(j).RichStringCellValue.ApplyFont(font);
                                }
                                else
                                {
                                    sheet.SetColumnWidth(j, (ExportTable.Rows[i][j].ToString().Length + 6) * 256);
                                    row.CreateCell(j).SetCellValue(ExportTable.Rows[i][j].ToString());
                                }
                            }
                            else
                            {
                                sheet.SetColumnWidth(j, (ExportTable.Rows[i][j].ToString().Length + 6) * 256);
                                row.CreateCell(j).SetCellValue(ExportTable.Rows[i][j].ToString());
                            }
                        }
                    }
                    MemoryStream output = new MemoryStream();
                    workbook.Write(output);
                    string filename = "" + ReportName.Trim() + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".xls";
                    HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
                    HttpContext.Current.Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.BinaryWrite(output.GetBuffer());
                    //HttpContext.Current.Response.End();
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                }
                else if (ReportType == 2)
                {
                    var workbook = new XSSFWorkbook();
                    var sheet = workbook.CreateSheet();
                    var headerRow = sheet.CreateRow(0);
                    for (int i = 0; i < ExportTable.Columns.Count; i++)
                    {
                        var font = workbook.CreateFont();
                        font.FontHeightInPoints = 11;
                        font.FontName = "Calibri";
                        font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;
                        sheet.SetColumnWidth(i, (ExportTable.Columns[i].Caption.ToUpper().Length + 6) * 256);
                        headerRow.CreateCell(i).SetCellValue(ExportTable.Columns[i].Caption.ToUpper());
                        sheet.GetRow(0).GetCell(i).RichStringCellValue.ApplyFont(font);
                    }
                    DataRow DR = ExportTable.Rows[ExportTable.Rows.Count - 1];
                    bool ISBOLD = false;
                    for (int k = 0; k < ExportTable.Columns.Count; k++)
                    {
                        if (DR[k].ToString() == "TOTAL")
                        {
                            ISBOLD = true;
                            //for (int L = 0; L < ExportTable.Columns.Count; L++)
                            //{
                            //    var font = workbook.CreateFont();
                            //    font.FontHeightInPoints = 11;
                            //    font.FontName = "Calibri";
                            //    font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;
                            //    sheet.GetRow(ExportTable.Rows.Count).GetCell(L).RichStringCellValue.ApplyFont(font);
                            //}
                        }
                    }
                    sheet.CreateFreezePane(0, 1, 0, 1);
                    for (int i = 0; i < ExportTable.Rows.Count; i++)
                    {
                        var row = sheet.CreateRow(i + 1);
                        for (int j = 0; j < ExportTable.Columns.Count; j++)
                        {
                            if (ExportTable.Rows.Count - 1 == i)
                            {
                                if (ISBOLD)
                                {
                                    var font = workbook.CreateFont();
                                    font.FontHeightInPoints = 11;
                                    font.FontName = "Calibri";
                                    font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;
                                    sheet.SetColumnWidth(j, (ExportTable.Rows[i][j].ToString().Length + 6) * 256);
                                    row.CreateCell(j).SetCellValue(ExportTable.Rows[i][j].ToString());
                                    sheet.GetRow(i + 1).GetCell(j).RichStringCellValue.ApplyFont(font);
                                }
                                else
                                {
                                    sheet.SetColumnWidth(j, (ExportTable.Rows[i][j].ToString().Length + 6) * 256);
                                    row.CreateCell(j).SetCellValue(ExportTable.Rows[i][j].ToString());
                                }
                            }
                            else
                            {
                                sheet.SetColumnWidth(j, (ExportTable.Rows[i][j].ToString().Length + 6) * 256);
                                row.CreateCell(j).SetCellValue(ExportTable.Rows[i][j].ToString());
                            }
                        }
                    }
                    MemoryStream output = new MemoryStream();
                    workbook.Write(output);
                    string filename = "" + ReportName.Trim() + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".xlsx";
                    HttpContext.Current.Response.ContentType = "application/application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    HttpContext.Current.Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.BinaryWrite(output.GetBuffer());
                    //HttpContext.Current.Response.End();
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                }
                else if (ReportType == 3)
                {
                    try
                    {
                        Document document;
                        if (ExportTable.Columns.Count > 15)
                            document = new Document(PageSize.A3.Rotate(), 0f, 0f, 0f, 0f);
                        else if (ExportTable.Columns.Count > 9)
                            document = new Document(PageSize.A3, 0f, 0f, 0f, 0f);
                        else
                            document = new Document(PageSize.A4, 0f, 0f, 0f, 0f);


                        using (MemoryStream memoryStream = new MemoryStream())
                        {
                            PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
                            document.Open();

                            #region Header

                            var HeaderTable = new PdfPTable(ExportTable.Columns.Count)
                            {
                                WidthPercentage = 100,
                                HeaderRows = -1
                            };

                            //Company Logo
                            Image image = Image.GetInstance(HttpContext.Current.Server.MapPath("~/APPRequires/Images/CR.png"));
                            image.ScalePercent(30f);
                            PdfPCell ImageCel = new PdfPCell(image)
                            {
                                BorderColor = Color.WHITE,
                                VerticalAlignment = Element.ALIGN_CENTER,
                                HorizontalAlignment = Element.ALIGN_LEFT,
                                PaddingTop = 7f,
                                PaddingBottom = 1f
                            };
                            HeaderTable.AddCell(ImageCel);

                            //Report Name
                            var phrase = new Phrase
                            {
                                new Chunk(ReportName.ToUpper() + "\n\n",
                                    FontFactory.GetFont("Arial", 12, Font.BOLD, new Color(76, 174, 76)))
                            };
                            PdfPCell cell1 = new PdfPCell(phrase);
                            cell1.BorderColor = Color.WHITE;
                            cell1.VerticalAlignment = Element.ALIGN_CENTER;
                            cell1.HorizontalAlignment = Element.ALIGN_CENTER;
                            cell1.PaddingBottom = 1f;
                            cell1.PaddingTop = 3f;
                            cell1.BackgroundColor = Color.WHITE;
                            cell1.Colspan = ExportTable.Columns.Count - 2;
                            cell1.VerticalAlignment = Element.ALIGN_TOP;
                            HeaderTable.AddCell(cell1);

                            //Date 
                            var Phrase1 = new Phrase
                            {
                                new Chunk(DateTime.Now.ToString("ddd dd MMMM yyyy HH:mm").ToUpper(),
                                    FontFactory.GetFont("Arial", 5, Font.BOLD, new Color(51, 102, 153)))
                            };
                            PdfPCell DateCell = new PdfPCell(Phrase1)
                            {
                                BorderColor = Color.WHITE,
                                VerticalAlignment = Element.ALIGN_CENTER,
                                HorizontalAlignment = Element.ALIGN_CENTER,
                                PaddingBottom = 1f,
                                PaddingTop = 9f,
                                BackgroundColor = Color.WHITE,
                                Colspan = 1
                            };
                            DateCell.VerticalAlignment = Element.ALIGN_TOP;
                            HeaderTable.AddCell(DateCell);
                            document.Add(HeaderTable);

                            #endregion

                            PdfContentByte contentByte = writer.DirectContent;
                            contentByte.SetLineWidth(0.3f);
                            contentByte.MoveTo(0, document.Top - 25f);
                            contentByte.LineTo(document.PageSize.Width, document.Top - 25f);
                            contentByte.Stroke();

                            #region Body

                            var BodyTable = new PdfPTable(ExportTable.Columns.Count)
                            {
                                WidthPercentage = 99,
                                HeaderRows = 1
                            };

                            for (int i = 0; i < ExportTable.Columns.Count; i++)
                            {
                                string ColumnName = ExportTable.Columns[i].Caption.ToUpper();
                                BodyTable.AddCell(HPhraseCell(new Phrase(ColumnName, FontFactory.GetFont("Arial", 5, Font.BOLD, Color.BLACK)), Element.ALIGN_CENTER));
                            }
                            DataRow DR = ExportTable.Rows[ExportTable.Rows.Count - 1];
                            bool ISBOLD = false;
                            for (int k = 0; k < ExportTable.Columns.Count; k++)
                            {
                                if (DR[k].ToString() == "TOTAL")
                                {
                                    ISBOLD = true;
                                    //for (int L = 0; L < ExportTable.Columns.Count; L++)
                                    //{
                                    //    var font = workbook.CreateFont();
                                    //    font.FontHeightInPoints = 11;
                                    //    font.FontName = "Calibri";
                                    //    font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;
                                    //    sheet.GetRow(ExportTable.Rows.Count).GetCell(L).RichStringCellValue.ApplyFont(font);
                                    //}
                                }
                            }
                            for (int j = 0; j < ExportTable.Rows.Count; j++)
                            {
                                for (int i = 0; i < ExportTable.Columns.Count; i++)
                                {

                                    if (ExportTable.Rows.Count - 1 == j)
                                    {
                                        if (ISBOLD)
                                        {
                                            string ColumnName = ExportTable.Columns[i].Caption.ToUpper();
                                            decimal Num;
                                            bool isNumeric = decimal.TryParse(ExportTable.Rows[j][ColumnName].ToString(), out Num);
                                            if (ColumnName.ToLower() == "status")
                                            {
                                                BodyTable.AddCell(ExportTable.Rows[j]["status"].ToString().ToLower() ==
                                                                  "inactive"
                                                    ? APhraseCell(
                                                        new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                            FontFactory.GetFont("Arial", 5, Font.BOLD,
                                                                new Color(213, 133, 18))), Element.ALIGN_CENTER)
                                                    : PhraseCell(
                                                        new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                            FontFactory.GetFont("Arial", 5, Font.BOLD,
                                                                new Color(76, 174, 76))), Element.ALIGN_CENTER));
                                            }
                                            else if (isNumeric)
                                            {
                                                BodyTable.AddCell(ExportTable.Rows[j][ColumnName].ToString().Length >=
                                                                  14
                                                    ? PhraseCell(
                                                        new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                            FontFactory.GetFont("Arial", 5, Font.BOLD, Color.BLACK)),
                                                        Element.ALIGN_CENTER)
                                                    : PhraseCell(
                                                        new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                            FontFactory.GetFont("Arial", 5, Font.BOLD, Color.BLACK)),
                                                        Element.ALIGN_RIGHT));
                                            }
                                            else if ((ExportTable.Rows[j][ColumnName].ToString().Contains("-") || ExportTable.Rows[j][ColumnName].ToString().Contains("/")) & ExportTable.Rows[j][ColumnName].ToString().Length == 10)
                                            {
                                                BodyTable.AddCell(PhraseCell(new Phrase(ExportTable.Rows[j][ColumnName].ToString(), FontFactory.GetFont("Arial", 5, Font.BOLD, Color.BLACK)), Element.ALIGN_CENTER));
                                            }
                                            else
                                            {
                                                BodyTable.AddCell(PhraseCell(new Phrase(ExportTable.Rows[j][ColumnName].ToString(), FontFactory.GetFont("Arial", 5, Font.BOLD, Color.BLACK)), Element.ALIGN_LEFT));
                                            }
                                        }
                                        else
                                        {
                                            string ColumnName = ExportTable.Columns[i].Caption.ToUpper();
                                            decimal Num;
                                            bool isNumeric = decimal.TryParse(ExportTable.Rows[j][ColumnName].ToString(), out Num);
                                            if (ColumnName.ToLower() == "status")
                                            {
                                                BodyTable.AddCell(ExportTable.Rows[j]["status"].ToString().ToLower() ==
                                                                  "inactive"
                                                    ? APhraseCell(
                                                        new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                            FontFactory.GetFont("Arial", 5, Font.NORMAL,
                                                                new Color(213, 133, 18))), Element.ALIGN_CENTER)
                                                    : PhraseCell(
                                                        new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                            FontFactory.GetFont("Arial", 5, Font.NORMAL,
                                                                new Color(76, 174, 76))), Element.ALIGN_CENTER));
                                            }
                                            else if (isNumeric)
                                            {
                                                BodyTable.AddCell(ExportTable.Rows[j][ColumnName].ToString().Length >=
                                                                  14
                                                    ? PhraseCell(
                                                        new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                            FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)),
                                                        Element.ALIGN_CENTER)
                                                    : PhraseCell(
                                                        new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                            FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)),
                                                        Element.ALIGN_RIGHT));
                                            }
                                            else if ((ExportTable.Rows[j][ColumnName].ToString().Contains("-") || ExportTable.Rows[j][ColumnName].ToString().Contains("/")) & ExportTable.Rows[j][ColumnName].ToString().Length == 10)
                                            {
                                                BodyTable.AddCell(PhraseCell(new Phrase(ExportTable.Rows[j][ColumnName].ToString(), FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)), Element.ALIGN_CENTER));
                                            }
                                            else
                                            {
                                                BodyTable.AddCell(PhraseCell(new Phrase(ExportTable.Rows[j][ColumnName].ToString(), FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)), Element.ALIGN_LEFT));
                                            }
                                        }
                                    }
                                    else
                                    {
                                        string ColumnName = ExportTable.Columns[i].Caption.ToUpper();
                                        decimal Num;
                                        bool isNumeric = decimal.TryParse(ExportTable.Rows[j][ColumnName].ToString(), out Num);
                                        if (ColumnName.ToLower() == "status")
                                        {
                                            BodyTable.AddCell(ExportTable.Rows[j]["status"].ToString().ToLower() ==
                                                              "inactive"
                                                ? APhraseCell(
                                                    new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                        FontFactory.GetFont("Arial", 5, Font.NORMAL,
                                                            new Color(213, 133, 18))), Element.ALIGN_CENTER)
                                                : PhraseCell(
                                                    new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                        FontFactory.GetFont("Arial", 5, Font.NORMAL,
                                                            new Color(76, 174, 76))), Element.ALIGN_CENTER));
                                        }
                                        else if (isNumeric)
                                        {
                                            BodyTable.AddCell(ExportTable.Rows[j][ColumnName].ToString().Length >= 14
                                                ? PhraseCell(
                                                    new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                        FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)),
                                                    Element.ALIGN_CENTER)
                                                : PhraseCell(
                                                    new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                        FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)),
                                                    Element.ALIGN_RIGHT));
                                        }
                                        else if ((ExportTable.Rows[j][ColumnName].ToString().Contains("-") || ExportTable.Rows[j][ColumnName].ToString().Contains("/")) & ExportTable.Rows[j][ColumnName].ToString().Length == 10)
                                        {
                                            BodyTable.AddCell(PhraseCell(new Phrase(ExportTable.Rows[j][ColumnName].ToString(), FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)), Element.ALIGN_CENTER));
                                        }
                                        else
                                        {
                                            BodyTable.AddCell(PhraseCell(new Phrase(ExportTable.Rows[j][ColumnName].ToString(), FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)), Element.ALIGN_LEFT));
                                        }
                                    }
                                }
                            }
                            document.Add(BodyTable);

                            #endregion

                            document.Close();
                            byte[] bytes = memoryStream.ToArray();
                            memoryStream.Close();
                            HttpContext.Current.Response.ContentType = "application/pdf";
                            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + ReportName + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf");
                            HttpContext.Current.Response.Clear();
                            //HttpContext.Current.Response.ContentType = "application/pdf";
                            HttpContext.Current.Response.Buffer = true;
                            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                            HttpContext.Current.Response.BinaryWrite(bytes);
                            HttpContext.Current.ApplicationInstance.CompleteRequest();
                            //HttpContext.Current.Response.End();
                            //HttpContext.Current.Response.Close();
                        }
                    }
                    catch (Exception EX)
                    {
                        Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
                        Error_Mail_Thread.Start();
                    }
                }
            }
        }
        catch (Exception EX)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(EX));
            Error_Mail_Thread.Start();
        }
    }

    private static PdfPCell HPhraseCell(Phrase phrase, int align)
    {
        PdfPCell cell = new PdfPCell(phrase);
        cell.BorderColor = Color.BLACK;
        cell.VerticalAlignment = Element.ALIGN_CENTER;
        cell.HorizontalAlignment = align;
        cell.PaddingBottom = 4f;
        cell.PaddingTop = 4f;
        cell.BorderWidth = 0.1f;
        cell.BackgroundColor = new Color(0, 194, 212);
        return cell;
    }

    private static PdfPCell PhraseCell(Phrase phrase, int align)
    {
        PdfPCell cell = new PdfPCell(phrase);
        cell.BorderColor = Color.BLACK;
        cell.VerticalAlignment = Element.ALIGN_CENTER;
        cell.HorizontalAlignment = align;
        cell.PaddingBottom = 3f;
        cell.PaddingTop = 3f;
        cell.BorderWidth = 0.1f;
        //cell.BackgroundColor = new Color(238, 238, 238);
        return cell;
    }

    private static PdfPCell APhraseCell(Phrase phrase, int align)
    {
        PdfPCell cell = new PdfPCell(phrase);
        cell.BorderColor = Color.BLACK;
        cell.VerticalAlignment = Element.ALIGN_CENTER;
        cell.HorizontalAlignment = align;
        cell.PaddingBottom = 3f;
        cell.PaddingTop = 3f;
        cell.BorderWidth = 0.1f;
        //cell.BackgroundColor = new Color(252, 251, 227);
        return cell;
    }

    #endregion

    #region GENERATEREPORT_FOR_DAILYREPORT

    public static void GENERATEREPORT_FOR_DAILYREPORT(DataTable ExportTable, string ReportName, int ReportType)
    {
        try
        {
            if (ExportTable.Rows.Count > 0)
            {
                //XLS =1 ; XLSX = 2 ; PDF = 3 
                if (ReportType == 1)
                {
                    var workbook = new HSSFWorkbook();
                    var sheet = workbook.CreateSheet();
                    var headerRow = sheet.CreateRow(0);
                    for (int i = 0; i < ExportTable.Columns.Count; i++)
                    {
                        var font = workbook.CreateFont();
                        font.FontHeightInPoints = 11;
                        font.FontName = "Calibri";
                        font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;
                        sheet.SetColumnWidth(i, (ExportTable.Columns[i].Caption.ToUpper().Length + 6) * 256);
                        if (ExportTable.Columns[i].Caption.ToUpper() != "TODAY" && ExportTable.Columns[i].Caption.ToUpper() != "TILL DATE")
                        {
                            headerRow.CreateCell(i).SetCellValue(ExportTable.Columns[i].Caption.ToUpper());
                        }
                        else
                        {
                            headerRow.CreateCell(i).SetCellValue("AMOUNT RECOVEED");
                            var ROW1 = new NPOI.SS.Util.CellRangeAddress(0, 0, 6, 7);
                            sheet.AddMergedRegion(ROW1);
                        }
                        sheet.GetRow(0).GetCell(i).RichStringCellValue.ApplyFont(font);
                    }
                    sheet.CreateFreezePane(0, 2, 0, 2);
                    var MerzeRow = sheet.CreateRow(1);
                    for (int j = 0; j < ExportTable.Columns.Count; j++)
                    {
                        sheet.SetColumnWidth(j, (ExportTable.Rows[1][j].ToString().Length + 6) * 256);
                        MerzeRow.CreateCell(j).SetCellValue("");
                        MerzeRow.CreateCell(j).CellStyle.VerticalAlignment = NPOI.SS.UserModel.VerticalAlignment.Center;
                        MerzeRow.CreateCell(j).CellStyle.FillBackgroundColor = NPOI.HSSF.Util.HSSFColor.Red.Index;
                        MerzeRow.CreateCell(j).CellStyle.WrapText = false;
                        if (ExportTable.Columns[j].Caption.ToUpper() != "TODAY" && ExportTable.Columns[j].Caption.ToUpper() != "TILL DATE")
                        {
                            var ROW1 = new NPOI.SS.Util.CellRangeAddress(0, 1, j, j);
                            sheet.AddMergedRegion(ROW1);
                        }
                        else
                        {
                            var font = workbook.CreateFont();
                            font.FontHeightInPoints = 11;
                            font.FontName = "Calibri";
                            font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;
                            if (ExportTable.Columns[j].Caption.ToUpper() == "TODAY")
                            {
                                MerzeRow.CreateCell(j).SetCellValue("TODAY");
                            }
                            else
                            {
                                MerzeRow.CreateCell(j).SetCellValue("TILL DATE");
                            }
                            sheet.GetRow(1).GetCell(j).RichStringCellValue.ApplyFont(font);
                        }
                    }
                    int ROWSCOUNT = 2;
                    for (int i = 0; i < ExportTable.Rows.Count; i++)
                    {
                        var row = sheet.CreateRow(ROWSCOUNT);
                        for (int j = 0; j < ExportTable.Columns.Count; j++)
                        {
                            sheet.SetColumnWidth(j, (ExportTable.Rows[i][j].ToString().Length + 6) * 256);
                            row.CreateCell(j).SetCellValue(ExportTable.Rows[i][j].ToString());

                        }
                        ROWSCOUNT++;
                    }
                    MemoryStream output = new MemoryStream();
                    workbook.Write(output);
                    string filename = "" + ReportName.Trim() + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".xls";
                    HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
                    HttpContext.Current.Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.BinaryWrite(output.GetBuffer());
                    //HttpContext.Current.Response.End();
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                }
                else if (ReportType == 2)
                {
                    var workbook = new XSSFWorkbook();
                    var sheet = workbook.CreateSheet();
                    var headerRow = sheet.CreateRow(0);
                    for (int i = 0; i < ExportTable.Columns.Count; i++)
                    {
                        var font = workbook.CreateFont();
                        font.FontHeightInPoints = 11;
                        font.FontName = "Calibri";
                        font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;
                        sheet.SetColumnWidth(i, (ExportTable.Columns[i].Caption.ToUpper().Length + 6) * 256);
                        if (ExportTable.Columns[i].Caption.ToUpper() != "TODAY" && ExportTable.Columns[i].Caption.ToUpper() != "TILL DATE")
                        {
                            headerRow.CreateCell(i).SetCellValue(ExportTable.Columns[i].Caption.ToUpper());
                        }
                        else
                        {
                            headerRow.CreateCell(i).SetCellValue("AMOUNT RECOVEED");
                            var ROW1 = new NPOI.SS.Util.CellRangeAddress(0, 0, 6, 7);
                            sheet.AddMergedRegion(ROW1);
                        }
                        sheet.GetRow(0).GetCell(i).RichStringCellValue.ApplyFont(font);
                    }
                    sheet.CreateFreezePane(0, 2, 0, 2);
                    var MerzeRow = sheet.CreateRow(1);
                    for (int j = 0; j < ExportTable.Columns.Count; j++)
                    {
                        sheet.SetColumnWidth(j, (ExportTable.Rows[1][j].ToString().Length + 6) * 256);
                        MerzeRow.CreateCell(j).SetCellValue("");
                        MerzeRow.CreateCell(j).CellStyle.VerticalAlignment = NPOI.SS.UserModel.VerticalAlignment.Center;
                        MerzeRow.CreateCell(j).CellStyle.FillBackgroundColor = NPOI.HSSF.Util.HSSFColor.Red.Index;
                        MerzeRow.CreateCell(j).CellStyle.WrapText = false;
                    }
                    for (int i = 0; i < ExportTable.Rows.Count; i++)
                    {
                        var row = sheet.CreateRow(i + 1);
                        for (int j = 0; j < ExportTable.Columns.Count; j++)
                        {
                            sheet.SetColumnWidth(j, (ExportTable.Rows[i][j].ToString().Length + 6) * 256);
                            if (i == 0)
                            {
                                if (ExportTable.Columns[j].Caption.ToUpper() != "TODAY" && ExportTable.Columns[j].Caption.ToUpper() != "TILL DATE")
                                {
                                    var ROW1 = new NPOI.SS.Util.CellRangeAddress(0, 1, j, j);
                                    sheet.AddMergedRegion(ROW1);
                                }
                                else
                                {
                                    var font = workbook.CreateFont();
                                    font.FontHeightInPoints = 11;
                                    font.FontName = "Calibri";
                                    font.Boldweight = (short)NPOI.SS.UserModel.FontBoldWeight.Bold;
                                    if (ExportTable.Columns[j].Caption.ToUpper() == "TODAY")
                                    {
                                        row.CreateCell(j).SetCellValue("TODAY");
                                    }
                                    else
                                    {
                                        row.CreateCell(j).SetCellValue("TILL DATE");
                                    }
                                    sheet.GetRow(1).GetCell(j).RichStringCellValue.ApplyFont(font);
                                }
                            }
                            else
                            {
                                if (ExportTable.Columns[j].Caption.ToUpper() == "TODAY" && ExportTable.Columns[j].Caption.ToUpper() == "TILL DATE")
                                {
                                    row.CreateCell(j).SetCellValue(Convert.ToDecimal(ExportTable.Rows[i][j].ToString()).ToString(CultureInfo.InvariantCulture));
                                }
                                else
                                {
                                    row.CreateCell(j).SetCellValue(ExportTable.Rows[i][j].ToString());
                                }
                            }
                        }
                    }
                    MemoryStream output = new MemoryStream();
                    workbook.Write(output);
                    string filename = "" + ReportName.Trim() + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".xlsx";
                    HttpContext.Current.Response.ContentType = "application/application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    HttpContext.Current.Response.AddHeader("Content-Disposition", string.Format("attachment;filename={0}", filename));
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.BinaryWrite(output.GetBuffer());
                    //HttpContext.Current.Response.End();
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                }
                else if (ReportType == 3)
                {
                    try
                    {
                        Document document;
                        if (ExportTable.Columns.Count > 15)
                            document = new Document(PageSize.A3.Rotate(), 0f, 0f, 0f, 0f);
                        else if (ExportTable.Columns.Count > 9)
                            document = new Document(PageSize.A3, 0f, 0f, 0f, 0f);
                        else
                            document = new Document(PageSize.A4, 0f, 0f, 0f, 0f);


                        using (MemoryStream memoryStream = new MemoryStream())
                        {
                            PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
                            document.Open();

                            #region Header

                            var HeaderTable = new PdfPTable(ExportTable.Columns.Count)
                            {
                                WidthPercentage = 100,
                                HeaderRows = -1
                            };

                            //Company Logo
                            Image image = Image.GetInstance(HttpContext.Current.Server.MapPath("~/APPRequires/Images/CR.png"));
                            image.ScalePercent(30f);
                            PdfPCell ImageCel = new PdfPCell(image);
                            ImageCel.BorderColor = Color.WHITE;
                            ImageCel.VerticalAlignment = Element.ALIGN_CENTER;
                            ImageCel.HorizontalAlignment = Element.ALIGN_LEFT;
                            ImageCel.PaddingTop = 7f;
                            ImageCel.PaddingBottom = 1f;
                            HeaderTable.AddCell(ImageCel);

                            //Report Name
                            var phrase = new Phrase
                            {
                                new Chunk(ReportName.ToUpper() + "\n\n",
                                    FontFactory.GetFont("Arial", 12, Font.BOLD, new Color(76, 174, 76)))
                            };
                            PdfPCell cell1 = new PdfPCell(phrase)
                            {
                                BorderColor = Color.WHITE,
                                VerticalAlignment = Element.ALIGN_CENTER,
                                HorizontalAlignment = Element.ALIGN_CENTER,
                                PaddingBottom = 1f,
                                PaddingTop = 3f,
                                BackgroundColor = Color.WHITE,
                                Colspan = ExportTable.Columns.Count - 2
                            };
                            cell1.VerticalAlignment = Element.ALIGN_TOP;
                            HeaderTable.AddCell(cell1);

                            //Date 
                            var Phrase1 = new Phrase
                            {
                                new Chunk(DateTime.Now.ToString("ddd dd MMMM yyyy HH:mm").ToUpper(),
                                    FontFactory.GetFont("Arial", 5, Font.BOLD, new Color(51, 102, 153)))
                            };
                            PdfPCell DateCell = new PdfPCell(Phrase1)
                            {
                                BorderColor = Color.WHITE,
                                VerticalAlignment = Element.ALIGN_CENTER,
                                HorizontalAlignment = Element.ALIGN_CENTER,
                                PaddingBottom = 1f,
                                PaddingTop = 9f,
                                BackgroundColor = Color.WHITE,
                                Colspan = 1
                            };
                            DateCell.VerticalAlignment = Element.ALIGN_TOP;
                            HeaderTable.AddCell(DateCell);
                            document.Add(HeaderTable);

                            #endregion

                            PdfContentByte contentByte = writer.DirectContent;
                            contentByte.SetLineWidth(0.3f);
                            contentByte.MoveTo(0, document.Top - 25f);
                            contentByte.LineTo(document.PageSize.Width, document.Top - 25f);
                            contentByte.Stroke();

                            #region Body

                            var BodyTable = new PdfPTable(ExportTable.Columns.Count)
                            {
                                WidthPercentage = 99,
                                HeaderRows = 1
                            };

                            for (int i = 0; i < ExportTable.Columns.Count; i++)
                            {
                                string ColumnName = ExportTable.Columns[i].Caption.ToUpper();
                                BodyTable.AddCell(HPhraseCell(new Phrase(ColumnName, FontFactory.GetFont("Arial", 5, Font.BOLD, Color.BLACK)), Element.ALIGN_CENTER));
                            }
                            for (int j = 0; j < ExportTable.Rows.Count; j++)
                            {
                                for (int i = 0; i < ExportTable.Columns.Count; i++)
                                {
                                    string ColumnName = ExportTable.Columns[i].Caption.ToUpper();
                                    decimal Num;
                                    bool isNumeric = decimal.TryParse(ExportTable.Rows[j][ColumnName].ToString(), out Num);
                                    if (ColumnName.ToLower() == "status")
                                    {
                                        BodyTable.AddCell(ExportTable.Rows[j]["status"].ToString().ToLower() ==
                                                          "inactive"
                                            ? APhraseCell(
                                                new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                    FontFactory.GetFont("Arial", 5, Font.NORMAL, new Color(213, 133, 18))),
                                                Element.ALIGN_CENTER)
                                            : PhraseCell(
                                                new Phrase(ExportTable.Rows[j][ColumnName].ToString(),
                                                    FontFactory.GetFont("Arial", 5, Font.NORMAL, new Color(76, 174, 76))),
                                                Element.ALIGN_CENTER));
                                    }
                                    else if (isNumeric)
                                    {
                                        if (ExportTable.Rows[j][ColumnName].ToString().Length >= 14)
                                        {
                                            BodyTable.AddCell(PhraseCell(new Phrase(ExportTable.Rows[j][ColumnName].ToString(), FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)), Element.ALIGN_CENTER));
                                        }
                                        else
                                        {
                                            BodyTable.AddCell(PhraseCell(new Phrase(ExportTable.Rows[j][ColumnName].ToString(), FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)), Element.ALIGN_RIGHT));
                                        }
                                    }
                                    else if ((ExportTable.Rows[j][ColumnName].ToString().Contains("-") || ExportTable.Rows[j][ColumnName].ToString().Contains("/")) & ExportTable.Rows[j][ColumnName].ToString().Length == 10)
                                    {
                                        BodyTable.AddCell(PhraseCell(new Phrase(ExportTable.Rows[j][ColumnName].ToString(), FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)), Element.ALIGN_CENTER));
                                    }
                                    else
                                    {
                                        BodyTable.AddCell(PhraseCell(new Phrase(ExportTable.Rows[j][ColumnName].ToString(), FontFactory.GetFont("Arial", 5, Font.NORMAL, Color.BLACK)), Element.ALIGN_LEFT));
                                    }
                                }
                            }
                            document.Add(BodyTable);

                            #endregion

                            document.Close();
                            byte[] bytes = memoryStream.ToArray();
                            memoryStream.Close();
                            HttpContext.Current.Response.ContentType = "application/pdf";
                            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + ReportName + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf");
                            HttpContext.Current.Response.Clear();
                            //HttpContext.Current.Response.ContentType = "application/pdf";
                            HttpContext.Current.Response.Buffer = true;
                            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                            HttpContext.Current.Response.BinaryWrite(bytes);
                            HttpContext.Current.ApplicationInstance.CompleteRequest();
                            //HttpContext.Current.Response.End();
                            //HttpContext.Current.Response.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(ex));
                        Error_Mail_Thread.Start();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(ex));
            Error_Mail_Thread.Start();
        }
    }

    #endregion

    #region NPA DETAILS RECOVERY REPORT
    public static void NPA_DETAILS_RECOVERY_REPORT(string ID)
    {
        try
        {
            int FontSize = 11;
            Document NPARecoveryReport = new Document(PageSize.A4, 5f, 5f, 10f, 5f);
            using (MemoryStream MStream = new MemoryStream())
            {
                PdfWriter PDFWriter = PdfWriter.GetInstance(NPARecoveryReport, MStream);
                NPARecoveryReport.Open();

                PdfContentByte contentByte0 = PDFWriter.DirectContent;
                contentByte0.SetLineWidth(1f);
                contentByte0.MoveTo(0, 767);
                contentByte0.LineTo(PDFWriter.PageSize.Width, 767);
                contentByte0.Stroke();

                PdfContentByte contentByte = PDFWriter.DirectContent;
                contentByte.SetLineWidth(1f);
                contentByte.MoveTo(0, 82);
                contentByte.LineTo(PDFWriter.PageSize.Width, 82);
                contentByte.Stroke();

                PdfPTable HeaderTable = new PdfPTable(6);
                HeaderTable.WidthPercentage = 100;
                HeaderTable.SpacingAfter = 0;

                var Company = new Phrase();
                Company.Add(new Chunk("Kommineni Consultants Pvt. Ltd.", FontFactory.GetFont("Times", 20, Font.BOLDITALIC, new Color(44, 156, 48))));
                PdfPCell ComName = new PdfPCell(Company);
                ComName.BorderColor = Color.WHITE;
                ComName.VerticalAlignment = Element.ALIGN_TOP;
                ComName.HorizontalAlignment = Element.ALIGN_LEFT;
                ComName.Colspan = 6;
                HeaderTable.AddCell(ComName);

                Company = new Phrase();
                Company.Add(new Chunk("H.No.: 8-3-1-21, Plot No.: 24, Krishna Vihar HDFC Bank Lane,\nSrinagar Colony, Hyderabad Ph : 65886859, 23744980, Fax : 23744981\nE-mail : reach@kommineni.co.in, www.kommineni.co.in", FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(51, 102, 153))));
                PdfPCell CompanyAddressCell = new PdfPCell(Company);
                CompanyAddressCell.BorderColor = Color.WHITE;
                CompanyAddressCell.VerticalAlignment = Element.ALIGN_TOP;
                CompanyAddressCell.HorizontalAlignment = Element.ALIGN_LEFT;
                CompanyAddressCell.PaddingBottom = 10f;
                CompanyAddressCell.Colspan = 6;
                HeaderTable.AddCell(CompanyAddressCell);

                //Report Name
                PdfPCell CELL11 =
                    new PdfPCell(new Phrase("(RECOVERY DEPARTMENT)\n",
                        FontFactory.GetFont("Arial", 12, Font.BOLD, new Color(0, 0, 0))))
                    {
                        BorderColor = Color.WHITE,
                        VerticalAlignment = Element.ALIGN_CENTER,
                        HorizontalAlignment = Element.ALIGN_CENTER,
                        PaddingBottom = 0f,
                        PaddingTop = 0f,
                        Colspan = 6,
                        BackgroundColor = Color.WHITE
                    };
                CELL11.VerticalAlignment = Element.ALIGN_TOP;
                HeaderTable.AddCell(CELL11);

                NPARecoveryReport.Add(HeaderTable);

                PdfPTable PDFDataTable = new PdfPTable(3);
                PDFDataTable.WidthPercentage = 100;
                PDFDataTable.SpacingBefore = 5f;
                PDFDataTable.TotalWidth = 580f;
                PDFDataTable.LockedWidth = true;
                float[] widths = { 40f, 265f, 265f };
                PDFDataTable.SetWidths(widths);

                PdfPCell PDFDTCELL00 =
                    new PdfPCell(new Phrase("S.No.", FontFactory.GetFont("Arial", 12, Font.BOLD, new Color(0, 0, 0))))
                    {
                        BackgroundColor = Color.WHITE,
                        VerticalAlignment = Element.ALIGN_MIDDLE,
                        HorizontalAlignment = Element.ALIGN_CENTER,
                        PaddingTop = 0f,
                        PaddingBottom = 0f,
                        BorderColor = Color.WHITE
                    };
                PDFDataTable.AddCell(PDFDTCELL00);

                PdfPCell PDFDTCELL01 = new PdfPCell(new Phrase("NPA DETAILS", FontFactory.GetFont("Arial", 12, Font.BOLD, new Color(0, 0, 0))));
                PDFDTCELL01.BackgroundColor = Color.WHITE;
                PDFDTCELL01.VerticalAlignment = Element.ALIGN_MIDDLE;
                PDFDTCELL01.HorizontalAlignment = Element.ALIGN_LEFT;
                PDFDTCELL01.PaddingTop = 0f;
                PDFDTCELL01.PaddingBottom = 0f;
                PDFDTCELL01.BorderColor = Color.WHITE;
                PDFDataTable.AddCell(PDFDTCELL01);

                PdfPCell PDFDTCELL02 =
                    new PdfPCell(new Phrase("DATE : " + DateTime.Now.ToString("dd/MM/yyyy"),
                        FontFactory.GetFont("Arial", 12, Font.BOLD, new Color(0, 0, 0))))
                    {
                        BackgroundColor = Color.WHITE,
                        VerticalAlignment = Element.ALIGN_MIDDLE,
                        HorizontalAlignment = Element.ALIGN_CENTER,
                        PaddingTop = 0f,
                        PaddingBottom = 0f,
                        BorderColor = Color.WHITE
                    };
                PDFDataTable.AddCell(PDFDTCELL02);
                foreach (DataRow DR in NPA_RECOVERY_REPORT(ID).Rows)
                {
                    PdfPCell REPEATCELL = new PdfPCell(new Phrase(DR[0].ToString(), FontFactory.GetFont("Arial", 11, Font.BOLD, Color.BLACK)));
                    REPEATCELL.BackgroundColor = Color.WHITE;
                    REPEATCELL.VerticalAlignment = Element.ALIGN_TOP;
                    REPEATCELL.HorizontalAlignment = Element.ALIGN_CENTER;
                    REPEATCELL.PaddingTop = 10f;
                    REPEATCELL.PaddingBottom = 10f;
                    REPEATCELL.BorderColor = Color.WHITE;
                    PDFDataTable.AddCell(REPEATCELL);

                    PdfPCell REPEATCELL1 = new PdfPCell(new Phrase(DR[1].ToString(), FontFactory.GetFont("Arial", 11, Font.BOLD, Color.BLACK)));
                    REPEATCELL1.BackgroundColor = Color.WHITE;
                    REPEATCELL1.VerticalAlignment = Element.ALIGN_TOP;
                    REPEATCELL1.HorizontalAlignment = Element.ALIGN_LEFT;
                    REPEATCELL1.PaddingTop = 10f;
                    REPEATCELL1.PaddingBottom = 10f;
                    REPEATCELL1.BorderColor = Color.WHITE;
                    PDFDataTable.AddCell(REPEATCELL1);

                    PdfPCell REPEATCELL2 = new PdfPCell(new Phrase(DR[2].ToString().Replace(',', '\n'), FontFactory.GetFont("Arial", 11, Font.BOLD, Color.BLACK)));
                    REPEATCELL2.BackgroundColor = Color.WHITE;
                    REPEATCELL2.VerticalAlignment = Element.ALIGN_TOP;
                    REPEATCELL2.HorizontalAlignment = Element.ALIGN_LEFT;
                    REPEATCELL2.PaddingTop = 10f;
                    REPEATCELL2.PaddingBottom = 10f;
                    REPEATCELL2.BorderColor = Color.WHITE;
                    PDFDataTable.AddCell(REPEATCELL2);
                }
                NPARecoveryReport.Add(PDFDataTable);

                PDFWriter.PageEvent = new RecoveryFooter();

                NPARecoveryReport.Close();
                byte[] bytes = MStream.ToArray();
                MStream.Close();
                HttpContext.Current.Response.ContentType = "application/pdf";
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + "NPA RECOVERY DEPARTMENT " + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf");
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.Buffer = true;
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.BinaryWrite(bytes);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
        }
        catch (Exception ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(ex));
            Error_Mail_Thread.Start();
        }
    }

    #endregion

    #region RECOVERY BILL PAYMENT LETTER

    public static void RECOVERY_BILL_PAYMENT_LETTER(DataTable BillDt, string STN, string PAN)
    {
        try
        {
            int FontSize = 11;
            Document document = new Document(PageSize.A4, 5f, 5f, 10f, 5f);
            using (var memoryStream = new MemoryStream())
            {
                PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
                document.Open();
                PdfContentByte contentByte0 = writer.DirectContent;
                contentByte0.SetLineWidth(1f);
                contentByte0.MoveTo(0, 767);
                contentByte0.LineTo(writer.PageSize.Width, 767);
                contentByte0.Stroke();

                PdfContentByte contentByte = writer.DirectContent;
                contentByte.SetLineWidth(1f);
                contentByte.MoveTo(0, 82);
                contentByte.LineTo(writer.PageSize.Width, 82);
                contentByte.Stroke();

                PdfPTable HeaderTable = new PdfPTable(6)
                {
                    WidthPercentage = 100,
                    SpacingAfter = 0
                };

                var Company = new Phrase
                {
                    new Chunk("Kommineni Consultants Pvt. Ltd.\n",
                        FontFactory.GetFont("Times", 20, Font.BOLDITALIC, new Color(44, 156, 48)))
                };
                PdfPCell ComName = new PdfPCell(Company);
                ComName.BorderColor = Color.WHITE;
                ComName.VerticalAlignment = Element.ALIGN_TOP;
                ComName.HorizontalAlignment = Element.ALIGN_LEFT;
                ComName.Colspan = 6;
                HeaderTable.AddCell(ComName);
                Company.Add(new Chunk("H.No.: 8-3-1-21, Plot No.: 24, Krishna Vihar HDFC Bank Lane,\nSrinagar Colony, Hyderabad Ph : 65886859, 23744980, Fax : 23744981\nE-mail : reach@kommineni.co.in, www.kommineni.co.in \n", FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(51, 102, 153))));
                PdfPCell CompanyAddressCell = new PdfPCell(Company);
                CompanyAddressCell.BorderColor = Color.WHITE;
                CompanyAddressCell.VerticalAlignment = Element.ALIGN_TOP;
                CompanyAddressCell.HorizontalAlignment = Element.ALIGN_LEFT;
                CompanyAddressCell.PaddingBottom = 10f;
                CompanyAddressCell.Colspan = 6;
                //HeaderTable.AddCell(CompanyAddressCell);
                document.Add(HeaderTable);

                PdfPTable Table1 = new PdfPTable(6) { WidthPercentage = 100 };

                var phrase1 = new Phrase
                {
                    new Phrase("\nTo", FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell Row0 = new PdfPCell(phrase1)
                {
                    BorderColor = Color.WHITE,
                    PaddingTop = 0f,
                    PaddingBottom = 2f,
                    Colspan = 6,
                    VerticalAlignment = Element.ALIGN_CENTER
                };
                Table1.AddCell(Row0);

                phrase1 = new Phrase();
                phrase1.Add(new Phrase("The Branch Manager,\n" + BillDt.Rows[0]["BANK_NAME"] + ",\n" + BillDt.Rows[0]["BRANCH_NAME"] + ".", FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0))));
                PdfPCell Row2 = new PdfPCell(phrase1)
                {
                    HorizontalAlignment = Element.ALIGN_LEFT,
                    BorderColor = Color.WHITE,
                    PaddingLeft = 15f,
                    PaddingTop = 1f,
                    PaddingBottom = 2f,
                    Colspan = 4
                };
                Table1.AddCell(Row2);

                phrase1 = new Phrase();
                phrase1.Add(new Phrase("Date : " + DateTime.Now.ToString("dd/MM/yyyy"), FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0))));
                PdfPCell Row1 = new PdfPCell(phrase1);
                Row1.HorizontalAlignment = Element.ALIGN_RIGHT;
                Row1.BorderColor = Color.WHITE;
                Row1.PaddingRight = 38f;
                Row1.PaddingTop = 1f;
                Row1.Colspan = 2;
                Table1.AddCell(Row1);

                phrase1 = new Phrase
                {
                    new Phrase("S.No : " + BillDt.Rows[0]["SERIALNUMBER"],
                        FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell SnNo = new PdfPCell(phrase1);
                SnNo.HorizontalAlignment = Element.ALIGN_RIGHT;
                SnNo.BorderColor = Color.WHITE;
                SnNo.PaddingTop = 1f;
                SnNo.PaddingRight = 10f;
                SnNo.Colspan = 6;
                SnNo.VerticalAlignment = Element.ALIGN_CENTER;
                Table1.AddCell(SnNo);

                phrase1 = new Phrase
                {
                    new Phrase(
                        "Sub-NPA Recovery - Payment Commission.\n \nWe furnish below the details of recoveries made in the NPA Accounts entrusted to us and the \ncommission payable. there on",
                        FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell Row6 = new PdfPCell(phrase1)
                {
                    BorderColor = Color.WHITE,
                    PaddingTop = 10f,
                    PaddingBottom = 5f,
                    Colspan = 6,
                    VerticalAlignment = Element.ALIGN_CENTER
                };
                Table1.AddCell(Row6);

                document.Add(Table1);

                Paragraph TBT = new Paragraph(new Chunk(new iTextSharp.text.pdf.draw.LineSeparator(0.0F, 90.0F, new Color(0, 0, 0), Element.ALIGN_LEFT, 0)));
                document.Add(TBT);
                //Table
                var Table2 = new PdfPTable(6)
                {
                    HorizontalAlignment = 0,
                    TotalWidth = 580f,
                    LockedWidth = true
                };
                float[] widths = { 173f, 109f, 75f, 103f, 103f, 103f };
                Table2.SetWidths(widths);
                Table2.DefaultCell.BorderColor = Color.BLACK;

                Phrase phrase2 = new Phrase();
                phrase2.Add(new Phrase("\nBorrower", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
                PdfPCell Cell1 = new PdfPCell(phrase2);
                Cell1.BorderColor = Color.BLACK;
                Cell1.VerticalAlignment = Element.ALIGN_CENTER;
                Cell1.HorizontalAlignment = Element.ALIGN_CENTER;
                Cell1.BorderWidth = 0.6f;
                Table2.AddCell(Cell1);

                phrase2 = new Phrase
                {
                    new Phrase("\nAccount No", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell Cell2 = new PdfPCell(phrase2)
                {
                    BorderColor = Color.BLACK,
                    VerticalAlignment = Element.ALIGN_CENTER,
                    HorizontalAlignment = Element.ALIGN_CENTER,
                    BorderWidth = 0.6f
                };
                Table2.AddCell(Cell2);

                phrase2 = new Phrase
                {
                    new Phrase("\nDate of\nRecovery", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell Cell3 = new PdfPCell(phrase2)
                {
                    BorderColor = Color.BLACK,
                    VerticalAlignment = Element.ALIGN_CENTER,
                    HorizontalAlignment = Element.ALIGN_CENTER,
                    BorderWidth = 0.6f
                };
                Table2.AddCell(Cell3);

                phrase2 = new Phrase
                {
                    new Phrase("\nAmount \nRecovered\n(Rs.)",
                        FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell Cell4 = new PdfPCell(phrase2);
                Cell4.BorderColor = Color.BLACK;
                Cell4.VerticalAlignment = Element.ALIGN_CENTER;
                Cell4.HorizontalAlignment = Element.ALIGN_CENTER;
                Cell4.BorderWidth = 0.6f;
                Table2.AddCell(Cell4);

                phrase2 = new Phrase
                {
                    new Phrase("\nCommision\n(Rs.)", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell Cell5 = new PdfPCell(phrase2);
                Cell5.BorderColor = Color.BLACK;
                Cell5.HorizontalAlignment = Element.ALIGN_CENTER;
                Cell5.VerticalAlignment = Element.ALIGN_CENTER;
                Cell5.BorderWidth = 0.6f;
                Table2.AddCell(Cell5);

                phrase2 = new Phrase();
                phrase2.Add(new Phrase("Commision\n+ Service Tax\n@" + BillDt.Rows[0]["SERVICETAXPER"] + "%\n(Rs.)", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
                PdfPCell Cell6 = new PdfPCell(phrase2)
                {
                    BorderColor = Color.BLACK,
                    HorizontalAlignment = Element.ALIGN_CENTER,
                    VerticalAlignment = Element.ALIGN_CENTER,
                    BorderWidth = 0.6f
                };
                Table2.AddCell(Cell6);
                int LoopCount = 0;
                decimal RECOVERYAMOUNT = 0;
                decimal RECOVERYAMOUNTCOMMISSION = 0;
                decimal TOTALCOMMISSION = 0;
                //ROW
                foreach (DataRow DR in BillDt.Rows)
                {
                    phrase2 = new Phrase
                    {
                        new Phrase(DR["BORROWERNAME"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                    };
                    PdfPCell Cell11 = new PdfPCell(phrase2);
                    Cell11.BorderColor = Color.BLACK;
                    Cell11.VerticalAlignment = Element.ALIGN_CENTER;
                    Cell11.HorizontalAlignment = Element.ALIGN_LEFT;
                    Cell11.PaddingTop = 3f;
                    Cell11.PaddingBottom = 3f;
                    Cell11.BorderWidth = 0.6f;
                    Table2.AddCell(Cell11);

                    phrase2 = new Phrase
                    {
                        new Phrase(DR["LOANACCOUNTNO"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                    };
                    PdfPCell Cell12 = new PdfPCell(phrase2)
                    {
                        BorderColor = Color.BLACK,
                        VerticalAlignment = Element.ALIGN_CENTER,
                        HorizontalAlignment = Element.ALIGN_CENTER,
                        PaddingTop = 3f,
                        PaddingBottom = 3f,
                        BorderWidth = 0.6f
                    };
                    Table2.AddCell(Cell12);

                    phrase2 = new Phrase
                    {
                        new Phrase(DR["RECOVERDATE"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                    };
                    PdfPCell Cell13 = new PdfPCell(phrase2);
                    Cell13.BorderColor = Color.BLACK;
                    Cell13.VerticalAlignment = Element.ALIGN_CENTER;
                    Cell13.HorizontalAlignment = Element.ALIGN_CENTER;
                    Cell13.PaddingTop = 3f;
                    Cell13.PaddingBottom = 3f;
                    Cell13.BorderWidth = 0.6f;
                    Table2.AddCell(Cell13);

                    phrase2 = new Phrase
                    {
                        new Phrase(DR["RECOVERYAMOUNT"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                    };
                    PdfPCell Cell14 = new PdfPCell(phrase2)
                    {
                        BorderColor = Color.BLACK,
                        BorderColorBottom = Color.BLACK,
                        VerticalAlignment = Element.ALIGN_CENTER,
                        HorizontalAlignment = Element.ALIGN_RIGHT,
                        PaddingTop = 3f,
                        PaddingBottom = 3f,
                        BorderWidth = 0.6f
                    };
                    Table2.AddCell(Cell14);

                    phrase2 = new Phrase
                    {
                        new Phrase(DR["RECOVERYAMOUNTCOMMISSION"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                    };
                    PdfPCell Cell15 = new PdfPCell(phrase2)
                    {
                        BorderColor = Color.BLACK,
                        VerticalAlignment = Element.ALIGN_CENTER,
                        HorizontalAlignment = Element.ALIGN_RIGHT,
                        PaddingTop = 3f,
                        PaddingBottom = 3f,
                        BorderWidth = 0.6f
                    };
                    Table2.AddCell(Cell15);

                    phrase2 = new Phrase
                    {
                        new Phrase(DR["TOTALCOMMISSION"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                    };
                    PdfPCell Cell16 = new PdfPCell(phrase2)
                    {
                        BorderColor = Color.BLACK,
                        VerticalAlignment = Element.ALIGN_CENTER,
                        HorizontalAlignment = Element.ALIGN_RIGHT,
                        PaddingTop = 3f,
                        PaddingBottom = 3f,
                        BorderWidth = 0.6f
                    };
                    Table2.AddCell(Cell16);

                    RECOVERYAMOUNT += Convert.ToDecimal(DR["RECOVERYAMOUNT"]);
                    RECOVERYAMOUNTCOMMISSION += Convert.ToDecimal(DR["RECOVERYAMOUNTCOMMISSION"]);
                    TOTALCOMMISSION += Convert.ToDecimal(DR["TOTALCOMMISSION"]);
                    LoopCount++;
                }
                //ROW END
                for (int z = 0; z <= 13 - LoopCount; z++)
                {

                    //ROW
                    phrase2 = new Phrase
                    {
                        new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255)))
                    };
                    PdfPCell Cellc11 = new PdfPCell(phrase2)
                    {
                        BorderColor = Color.BLACK,
                        VerticalAlignment = Element.ALIGN_CENTER,
                        HorizontalAlignment = Element.ALIGN_LEFT,
                        PaddingTop = 3f,
                        PaddingBottom = 3f,
                        BorderWidth = 0.6f
                    };
                    Table2.AddCell(Cellc11);

                    phrase2 = new Phrase
                    {
                        new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255)))
                    };
                    PdfPCell Cellc12 = new PdfPCell(phrase2)
                    {
                        BorderColor = Color.BLACK,
                        VerticalAlignment = Element.ALIGN_CENTER,
                        HorizontalAlignment = Element.ALIGN_CENTER,
                        PaddingTop = 3f,
                        PaddingBottom = 3f,
                        BorderWidth = 0.6f
                    };
                    Table2.AddCell(Cellc12);

                    phrase2 = new Phrase
                    {
                        new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255)))
                    };
                    PdfPCell Cellc13 = new PdfPCell(phrase2)
                    {
                        BorderColor = Color.BLACK,
                        VerticalAlignment = Element.ALIGN_CENTER,
                        HorizontalAlignment = Element.ALIGN_CENTER,
                        PaddingTop = 3f,
                        PaddingBottom = 3f,
                        BorderWidth = 0.6f
                    };
                    Table2.AddCell(Cellc13);

                    phrase2 = new Phrase
                    {
                        new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255)))
                    };
                    PdfPCell Cellc14 = new PdfPCell(phrase2)
                    {
                        BorderColor = Color.BLACK,
                        BorderColorBottom = Color.BLACK,
                        VerticalAlignment = Element.ALIGN_CENTER,
                        HorizontalAlignment = Element.ALIGN_RIGHT,
                        PaddingTop = 3f,
                        PaddingBottom = 3f,
                        BorderWidth = 0.6f
                    };
                    Table2.AddCell(Cellc14);

                    phrase2 = new Phrase
                    {
                        new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255)))
                    };
                    PdfPCell Cellc15 = new PdfPCell(phrase2)
                    {
                        BorderColor = Color.BLACK,
                        VerticalAlignment = Element.ALIGN_CENTER,
                        HorizontalAlignment = Element.ALIGN_RIGHT,
                        PaddingTop = 3f,
                        PaddingBottom = 3f,
                        BorderWidth = 0.6f
                    };
                    Table2.AddCell(Cellc15);

                    phrase2 = new Phrase
                    {
                        new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(),
                            FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255)))
                    };
                    PdfPCell Cellc16 = new PdfPCell(phrase2);
                    Cellc16.BorderColor = Color.BLACK;
                    Cellc16.VerticalAlignment = Element.ALIGN_CENTER;
                    Cellc16.HorizontalAlignment = Element.ALIGN_RIGHT;
                    Cellc16.PaddingTop = 3f;
                    Cellc16.PaddingBottom = 3f;
                    Cellc16.BorderWidth = 0.6f;
                    Table2.AddCell(Cellc16);
                    //ROW END
                }
                phrase2 = new Phrase { new Phrase("", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))) };
                PdfPCell TotalCell1 = new PdfPCell(phrase2)
                {
                    BorderColor = Color.BLACK,
                    VerticalAlignment = Element.ALIGN_CENTER,
                    HorizontalAlignment = Element.ALIGN_LEFT,
                    PaddingTop = 3f,
                    PaddingBottom = 3f,
                    BorderWidth = 0.6f
                };
                Table2.AddCell(TotalCell1);

                phrase2 = new Phrase
                {
                    new Phrase("Total", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell TotalCell2 = new PdfPCell(phrase2)
                {
                    BorderColor = Color.BLACK,
                    VerticalAlignment = Element.ALIGN_CENTER,
                    HorizontalAlignment = Element.ALIGN_CENTER,
                    PaddingTop = 3f,
                    PaddingBottom = 3f,
                    BorderWidth = 0.6f
                };
                Table2.AddCell(TotalCell2);

                phrase2 = new Phrase { new Phrase("", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))) };
                PdfPCell TotalCell3 = new PdfPCell(phrase2)
                {
                    BorderColor = Color.BLACK,
                    VerticalAlignment = Element.ALIGN_CENTER,
                    HorizontalAlignment = Element.ALIGN_CENTER,
                    PaddingTop = 3f,
                    PaddingBottom = 3f,
                    BorderWidth = 0.6f
                };
                Table2.AddCell(TotalCell3);

                phrase2 = new Phrase
                {
                    new Phrase(RECOVERYAMOUNT.ToString(CultureInfo.InvariantCulture),
                        FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell TotalCell4 = new PdfPCell(phrase2)
                {
                    BorderColor = Color.BLACK,
                    BorderColorBottom = Color.BLACK,
                    VerticalAlignment = Element.ALIGN_CENTER,
                    HorizontalAlignment = Element.ALIGN_RIGHT,
                    PaddingTop = 3f,
                    PaddingBottom = 3f,
                    BorderWidth = 0.6f
                };
                Table2.AddCell(TotalCell4);

                phrase2 = new Phrase
                {
                    new Phrase(RECOVERYAMOUNTCOMMISSION.ToString(CultureInfo.InvariantCulture),
                        FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell TotalCell5 = new PdfPCell(phrase2)
                {
                    BorderColor = Color.BLACK,
                    VerticalAlignment = Element.ALIGN_CENTER,
                    HorizontalAlignment = Element.ALIGN_RIGHT,
                    PaddingTop = 3f,
                    PaddingBottom = 3f,
                    BorderWidth = 0.6f
                };
                Table2.AddCell(TotalCell5);

                phrase2 = new Phrase
                {
                    new Phrase(TOTALCOMMISSION.ToString(CultureInfo.InvariantCulture),
                        FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell TotalCell6 = new PdfPCell(phrase2)
                {
                    BorderColor = Color.BLACK,
                    VerticalAlignment = Element.ALIGN_CENTER,
                    HorizontalAlignment = Element.ALIGN_RIGHT,
                    PaddingTop = 3f,
                    PaddingBottom = 3f,
                    BorderWidth = 0.6f
                };
                Table2.AddCell(TotalCell6);

                document.Add(Table2);

                Paragraph pb = new Paragraph(new Chunk(new iTextSharp.text.pdf.draw.LineSeparator(0.0F, 100.0F, new Color(0, 0, 0), Element.ALIGN_LEFT, 0)));
                document.Add(pb);

                var Table3 = new PdfPTable(6) { WidthPercentage = 100 };

                Phrase phrase3 = new Phrase
                {
                    new Phrase(
                        "Service Tax - " + STN + ", PAN - " + PAN +
                        "\n\nWe request you to issue D.D in favour of M/s Kommineni Consultants Pvt. Ltd. or Credit the amount to\nAccount No.:054311100002962 with Andhra Bank, Srinagar Colony, Hyderabad. IFSC CODE: ANDB0000543",
                        FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0)))
                };
                PdfPCell Row9 = new PdfPCell(phrase3)
                {
                    BorderColor = Color.WHITE,
                    PaddingTop = 7f,
                    Colspan = 6,
                    VerticalAlignment = Element.ALIGN_CENTER
                };
                Table3.AddCell(Row9);
                document.Add(Table3);

                writer.PageEvent = new Footer();

                document.Close();
                byte[] bytes = memoryStream.ToArray();
                memoryStream.Close();
                HttpContext.Current.Response.ContentType = "application/pdf";
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + "NPA Recovery Bill " + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf");
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.Buffer = true;
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.BinaryWrite(bytes);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
        }
        catch (Exception ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(ex));
            Error_Mail_Thread.Start();
        }
    }
    #endregion

    #region MAILS

    #region NPA MAIL

    #region REQUIRED MAILS GET TO SEND NPA

    public static DataTable EMAILs(int ID)
    {
        try
        {
            var Parameters = new SqlParameter[1];
            Parameters[0] = new SqlParameter("@NPAID", SqlDbType.Int) { Value = Convert.ToInt32(ID) };
            var dt = SQLHelper.GetInstance().ExecuteStoredProcedure("RECOVERY.[NPA_CREATE_MAILIDS]", Parameters);
            return dt;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region SEND_NPA_MAIL
    public static void SEND_NPA_MAIL(int NPAID, string TYPE)
    {
        try
        {
            string SMTP_SERVER = ConfigurationManager.AppSettings["MailServer"];
            string FROM_MAIL = ConfigurationManager.AppSettings["From"];
            string SENDER_MAIL = ConfigurationManager.AppSettings["AuthUser"];
            string SENDER_MAIL_PASSWORD = ConfigurationManager.AppSettings["AuthPass"];
            string MAIL_AUTHENTICATION = ConfigurationManager.AppSettings["MailAuthentication"];
            string MAIL_BODY = "";
            if (TYPE == "NEW")
            {
                MAIL_BODY = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'><head><title></title></head><body><div>Dear Sir/Madam,</div><div>NPA details are created successfully and please find the below mentioned details.</div><br><div><table dir='ltr' style='color: #2B82AD; border: 1px solid #1793d1; border-collapse: collapse; padding-left: 50px'><tr><td style='color: #FFFFFF; font-weight: bold; width: 50px; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>S.No.</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>NPA Details</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>DATE : ##DATE##</td></tr>##CONTENT##</table></div><br><br><div style='text-decoration: underline'>Thanks & Regards</div><div style='color: #4cae4c; font-weight: bold'>Kommineni Consultants Pvt. Ltd.</div><div>Customer Recovery.</div><br /><br /><div><span style='color:red'>Note: </span>This is auto generated mail, Please do not reply to this mail</div></body></html>";
            }
            if (TYPE == "UPDATE")
            {
                MAIL_BODY = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'><head><title></title></head><body><div>Dear Sir/Madam,</div><div>NPA details are updated successfully and please find the below mentioned details.</div><br><div><table dir='ltr' style='color: #2B82AD; border: 1px solid #1793d1; border-collapse: collapse; padding-left: 50px'><tr><td style='color: #FFFFFF; font-weight: bold; width: 50px; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>S.No.</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>NPA Details</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>DATE : ##DATE##</td></tr>##CONTENT##</table></div><br><br><div style='text-decoration: underline'>Thanks & Regards</div><div style='color: #4cae4c; font-weight: bold'>Kommineni Consultants Pvt. Ltd.</div><div>Customer Recovery.</div><br /><br /><div><span style='color:red'>Note: </span>This is auto generated mail, Please do not reply to this mail</div></body></html>";
            }
            string MAIL_TABLE = NPA_RECOVERY_REPORT(NPAID.ToString()).Rows.Cast<DataRow>().Aggregate("", (current, DR) => current + ("<tr> <td style='padding:5px; border: 1px solid #1793d1;'>" + DR[0] + "</td> <td style='padding:5px; border: 1px solid #1793d1;'>" + DR[1].ToString() + "</td> <td style='font-weight:bold;padding:5px; border: 1px solid #1793d1;'>" + DR[2].ToString() + "</td> </tr>"));

            MAIL_BODY = MAIL_BODY.Replace("##CONTENT##", MAIL_TABLE);
            MAIL_BODY = MAIL_BODY.Replace("##DATE##", DateTime.Now.ToString("dd-MM-yyyy"));
            SmtpClient SMTP_CLIENT = new SmtpClient();
            NetworkCredential BASIC_CREDENTIAL = new NetworkCredential(SENDER_MAIL, SENDER_MAIL_PASSWORD);
            MailMessage MESSAGE = new MailMessage();
            MailAddress FROM_MAIL_ADDRESS = new MailAddress(FROM_MAIL, "Kommineni");

            SMTP_CLIENT.Host = SMTP_SERVER;
            if (MAIL_AUTHENTICATION == "True")
            {
                SMTP_CLIENT.UseDefaultCredentials = false;
                SMTP_CLIENT.Credentials = BASIC_CREDENTIAL;
            }
            else
            {
                SMTP_CLIENT.UseDefaultCredentials = true;
            }
            DataTable MDT = EMAILs(NPAID);
            MESSAGE.From = FROM_MAIL_ADDRESS;
            if (TYPE == "NEW")
            {
                MESSAGE.Subject = "Creation of NPA Details (" + MDT.Rows[0][1] + ")";
            }
            if (TYPE == "UPDATE")
            {
                MESSAGE.Subject = "Updation of NPA Details  (" + MDT.Rows[0][1] + ")";
            }
            //Set IsBodyHtml to true means you can send HTML email. 
            MESSAGE.IsBodyHtml = true;
            MESSAGE.Body = MAIL_BODY;// string.Format("You have requested the Verification Code from our site.{0} Here is the Verification Code : {1}", Environment.NewLine, password);
            //MESSAGE.Attachments.Add(new Attachment(new MemoryStream(NPA_DETAILS_RECOVERY_REPORT_BYTES(NPAID)), "" + MDT.Rows[0][1].ToString() + ".pdf"));
            string[] MailsList = MDT.Rows[0][0].ToString().Split(',');
            foreach (string t in MailsList)
            {
                MESSAGE.To.Add(t);
            }

            try
            {
                SMTP_CLIENT.Send(MESSAGE);
            }
            catch (Exception Ex)
            {
                logfile.ErrorFormat(Ex.Message);
            }
        }
        catch (Exception Ex)
        {
            logfile.ErrorFormat(Ex.Message);
        }
    }
    #endregion

    //#region NPA_DETAILS_RECOVERY_REPORT_BYTES
    //public static byte[] NPA_DETAILS_RECOVERY_REPORT_BYTES(int ID)
    //{
    //    try
    //    {
    //        int FontSize = 11;
    //        Document NPARecoveryReport = new Document(PageSize.A4, 5f, 5f, 10f, 5f);
    //        using (MemoryStream MStream = new MemoryStream())
    //        {
    //            PdfWriter PDFWriter = PdfWriter.GetInstance(NPARecoveryReport, MStream);
    //            NPARecoveryReport.Open();

    //            PdfContentByte contentByte0 = PDFWriter.DirectContent;
    //            contentByte0.SetLineWidth(1f);
    //            contentByte0.MoveTo(0, 767);
    //            contentByte0.LineTo(PDFWriter.PageSize.Width, 767);
    //            contentByte0.Stroke();

    //            PdfContentByte contentByte = PDFWriter.DirectContent;
    //            contentByte.SetLineWidth(1f);
    //            contentByte.MoveTo(0, 82);
    //            contentByte.LineTo(PDFWriter.PageSize.Width, 82);
    //            contentByte.Stroke();

    //            PdfPTable HeaderTable = new PdfPTable(6);
    //            HeaderTable.WidthPercentage = 100;
    //            HeaderTable.SpacingAfter = 0;

    //            var Company = new Phrase
    //            {
    //                new Chunk("Kommineni Consultants Pvt. Ltd.",
    //                    FontFactory.GetFont("Times", 20, Font.BOLDITALIC, new Color(44, 156, 48)))
    //            };
    //            PdfPCell ComName = new PdfPCell(Company)
    //            {
    //                BorderColor = Color.WHITE,
    //                VerticalAlignment = Element.ALIGN_TOP,
    //                HorizontalAlignment = Element.ALIGN_LEFT,
    //                Colspan = 6
    //            };
    //            HeaderTable.AddCell(ComName);

    //            Company = new Phrase
    //            {
    //                new Chunk(
    //                    "H.No.: 8-3-1-21, Plot No.: 24, Krishna Vihar HDFC Bank Lane,\nSrinagar Colony, Hyderabad Ph : 65886859, 23744980, Fax : 23744981\nE-mail : reach@kommineni.co.in, www.kommineni.co.in",
    //                    FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(51, 102, 153)))
    //            };
    //            PdfPCell CompanyAddressCell = new PdfPCell(Company)
    //            {
    //                BorderColor = Color.WHITE,
    //                VerticalAlignment = Element.ALIGN_TOP,
    //                HorizontalAlignment = Element.ALIGN_LEFT,
    //                PaddingBottom = 10f,
    //                Colspan = 6
    //            };
    //            HeaderTable.AddCell(CompanyAddressCell);

    //            //Report Name
    //            PdfPCell CELL11 =
    //                new PdfPCell(new Phrase("(RECOVERY DEPARTMENT)\n",
    //                    FontFactory.GetFont("Arial", 12, Font.BOLD, new Color(0, 0, 0))))
    //                {
    //                    BorderColor = Color.WHITE,
    //                    VerticalAlignment = Element.ALIGN_CENTER,
    //                    HorizontalAlignment = Element.ALIGN_CENTER,
    //                    PaddingBottom = 0f,
    //                    PaddingTop = 0f,
    //                    Colspan = 6,
    //                    BackgroundColor = Color.WHITE
    //                };
    //            CELL11.VerticalAlignment = Element.ALIGN_TOP;
    //            HeaderTable.AddCell(CELL11);

    //            NPARecoveryReport.Add(HeaderTable);

    //            PdfPTable PDFDataTable = new PdfPTable(3)
    //            {
    //                WidthPercentage = 100,
    //                SpacingBefore = 5f,
    //                TotalWidth = 580f,
    //                LockedWidth = true
    //            };
    //            float[] widths = { 40f, 265f, 265f };
    //            PDFDataTable.SetWidths(widths);

    //            PdfPCell PDFDTCELL00 =
    //                new PdfPCell(new Phrase("S.No.", FontFactory.GetFont("Arial", 12, Font.BOLD, new Color(0, 0, 0))))
    //                {
    //                    BackgroundColor = Color.WHITE,
    //                    VerticalAlignment = Element.ALIGN_MIDDLE,
    //                    HorizontalAlignment = Element.ALIGN_CENTER,
    //                    PaddingTop = 0f,
    //                    PaddingBottom = 0f,
    //                    BorderColor = Color.WHITE
    //                };
    //            PDFDataTable.AddCell(PDFDTCELL00);

    //            PdfPCell PDFDTCELL01 =
    //                new PdfPCell(new Phrase("NPA DETAILS",
    //                    FontFactory.GetFont("Arial", 12, Font.BOLD, new Color(0, 0, 0))))
    //                {
    //                    BackgroundColor = Color.WHITE,
    //                    VerticalAlignment = Element.ALIGN_MIDDLE,
    //                    HorizontalAlignment = Element.ALIGN_LEFT,
    //                    PaddingTop = 0f,
    //                    PaddingBottom = 0f,
    //                    BorderColor = Color.WHITE
    //                };
    //            PDFDataTable.AddCell(PDFDTCELL01);

    //            PdfPCell PDFDTCELL02 =
    //                new PdfPCell(new Phrase("DATE : " + DateTime.Now.ToString("dd/MM/yyyy"),
    //                    FontFactory.GetFont("Arial", 12, Font.BOLD, new Color(0, 0, 0))))
    //                {
    //                    BackgroundColor = Color.WHITE,
    //                    VerticalAlignment = Element.ALIGN_MIDDLE,
    //                    HorizontalAlignment = Element.ALIGN_CENTER,
    //                    PaddingTop = 0f,
    //                    PaddingBottom = 0f,
    //                    BorderColor = Color.WHITE
    //                };
    //            PDFDataTable.AddCell(PDFDTCELL02);
    //            foreach (DataRow DR in NPA_RECOVERY_REPORT(ID.ToString()).Rows)
    //            {
    //                PdfPCell REPEATCELL =
    //                    new PdfPCell(new Phrase(DR[0].ToString(),
    //                        FontFactory.GetFont("Arial", 11, Font.BOLD, Color.BLACK)))
    //                    {
    //                        BackgroundColor = Color.WHITE,
    //                        VerticalAlignment = Element.ALIGN_TOP,
    //                        HorizontalAlignment = Element.ALIGN_CENTER,
    //                        PaddingTop = 10f,
    //                        PaddingBottom = 10f,
    //                        BorderColor = Color.WHITE
    //                    };
    //                PDFDataTable.AddCell(REPEATCELL);

    //                PdfPCell REPEATCELL1 =
    //                    new PdfPCell(new Phrase(DR[1].ToString(),
    //                        FontFactory.GetFont("Arial", 11, Font.BOLD, Color.BLACK)))
    //                    {
    //                        BackgroundColor = Color.WHITE,
    //                        VerticalAlignment = Element.ALIGN_TOP,
    //                        HorizontalAlignment = Element.ALIGN_LEFT,
    //                        PaddingTop = 10f,
    //                        PaddingBottom = 10f,
    //                        BorderColor = Color.WHITE
    //                    };
    //                PDFDataTable.AddCell(REPEATCELL1);

    //                PdfPCell REPEATCELL2 =
    //                    new PdfPCell(new Phrase(DR[2].ToString().Replace(',', '\n'),
    //                        FontFactory.GetFont("Arial", 11, Font.BOLD, Color.BLACK)))
    //                    {
    //                        BackgroundColor = Color.WHITE,
    //                        VerticalAlignment = Element.ALIGN_TOP,
    //                        HorizontalAlignment = Element.ALIGN_LEFT,
    //                        PaddingTop = 10f,
    //                        PaddingBottom = 10f,
    //                        BorderColor = Color.WHITE
    //                    };
    //                PDFDataTable.AddCell(REPEATCELL2);
    //            }
    //            NPARecoveryReport.Add(PDFDataTable);

    //            PDFWriter.PageEvent = new RecoveryFooter();

    //            //NPARecoveryReport.Close();
    //            byte[] bytes = MStream.ToArray();
    //            return bytes;
    //            //MStream.Close();
    //            //HttpContext.Current.Response.ContentType = "application/pdf";
    //            //HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + "NPA RECOVERY DEPARTMENT " + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf");
    //            //HttpContext.Current.Response.Clear();
    //            //HttpContext.Current.Response.Buffer = true;
    //            //HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
    //            //HttpContext.Current.Response.BinaryWrite(bytes);
    //            //HttpContext.Current.ApplicationInstance.CompleteRequest();
    //        }
    //    }
    //    catch (Exception Ex)
    //    {
    //        Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex.Message));
    //        Error_Mail_Thread.Start();
    //        logfile.ErrorFormat(Ex.Message);
    //        return null;
    //    }
    //}

    //#endregion

    #endregion

    #region RECORDS OF VISIT

    #region EXECUTIVEWISEVISITDETAILS_GET_DATA_FOR_MAIL

    public static DataTable EXECUTIVEWISEVISITDETAILS_GET_DATA_FOR_MAIL(int RID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[EXECUTIVEWISEVISITDETAILS_GET_DATA_FOR_MAIL]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = RID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region SEND_NPA_MAIL
    public static void SEND_RECORDS_OF_VISIT_MAIL(int RID, string TYPE)
    {
        try
        {
            string SMTP_SERVER = ConfigurationManager.AppSettings["MailServer"];
            string FROM_MAIL = ConfigurationManager.AppSettings["From"];
            string SENDER_MAIL = ConfigurationManager.AppSettings["AuthUser"];
            string SENDER_MAIL_PASSWORD = ConfigurationManager.AppSettings["AuthPass"];
            string MAIL_AUTHENTICATION = ConfigurationManager.AppSettings["MailAuthentication"];
            string MAIL_BODY = "";
            if (TYPE == "NEW")
            {
                MAIL_BODY = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'><head><title></title></head><body><div>Dear Sir/Madam,</div><div>Records of visit details are created successfully and please find the below mentioned details.</div><br><div><table dir='ltr' style='color: #2B82AD; border: 1px solid #1793d1; border-collapse: collapse; padding-left: 50px'><tr><td style='color: #FFFFFF; font-weight: bold; width: 50px; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>S.No.</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>Details</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>DATE : #DATE#</td></tr><tbody><tr><td>1</td><td>Executive</td><td>:&nbsp;#EXECUTIVE#</td></tr><tr><td>2</td><td>Account Number</td><td>:&nbsp;#ACCOUNTNUMBER#</td></tr><tr><td>3</td><td>Bank</td><td>:&nbsp;#BANK#</td></tr><tr><td>4</td><td>Branch</td><td>:&nbsp;#BRANCH#</td></tr><tr><td>5</td><td>Date(MM/DD/YYYY)</td><td>:&nbsp;#DATE#</td></tr><tr><td>6</td><td>Loan Amount</td><td>:&nbsp;#LOAN_AMOUNT#</td></tr><tr><td>7</td><td>Bank Range Type</td><td>:&nbsp;#BANK_RANGE_TYPE#</td></tr><tr><td style='font-weight:bold'>8</td><td style='font-weight:bold'>Amount Recovered</td><td style='font-weight:bold'>:&nbsp;#AMOUNT_RECOVERED#</td></tr><tr><td>9</td><td>Balance Amount</td><td>:&nbsp;#BALANCE_AMOUNT#</td></tr><tr><td>10</td><td>Next Date For Visit</td><td>:&nbsp;#NEXT_DATE_FOR_VISIT#</td></tr><tr><td>11</td><td>Remarks</td><td>:&nbsp;#REMARKS#</td></tr></tbody></table></div><br><br><div style='text-decoration: underline'>Thanks & Regards</div><div style='color: #4cae4c;font-weight:bold'>Kommineni Consultants Pvt. Ltd.</div><div>Customer Recovery.</div><br /><br /><div><span style='color:red'>Note: </span>This is auto generated mail, Please do not reply to this mail</div></body></html>";
            }
            if (TYPE == "UPDATE")
            {
                MAIL_BODY = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'><head><title></title></head><body><div>Dear Sir/Madam,</div><div>Records of visit details are updated successfully and please find the below mentioned details.</div><br><div><table dir='ltr' style='color: #2B82AD; border: 1px solid #1793d1; border-collapse: collapse; padding-left: 50px'><tr><td style='color: #FFFFFF; font-weight: bold; width: 50px; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>S.No.</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>Details</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>DATE : #DATE#</td></tr><tbody><tr><td>1</td><td>Executive</td><td>:&nbsp;#EXECUTIVE#</td></tr><tr><td>2</td><td>Account Number</td><td>:&nbsp;#ACCOUNTNUMBER#</td></tr><tr><td>3</td><td>Bank</td><td>:&nbsp;#BANK#</td></tr><tr><td>4</td><td>Branch</td><td>:&nbsp;#BRANCH#</td></tr><tr><td>5</td><td>Date(MM/DD/YYYY)</td><td>:&nbsp;#DATE#</td></tr><tr><td>6</td><td>Loan Amount</td><td>:&nbsp;#LOAN_AMOUNT#</td></tr><tr><td>7</td><td>Bank Range Type</td><td>:&nbsp;#BANK_RANGE_TYPE#</td></tr><tr><td style='font-weight:bold'>8</td><td style='font-weight:bold'>Amount Recovered</td><td style='font-weight:bold'>:&nbsp;#AMOUNT_RECOVERED#</td></tr><tr><td>9</td><td>Balance Amount</td><td>:&nbsp;#BALANCE_AMOUNT#</td></tr><tr><td>10</td><td>Next Date For Visit</td><td>:&nbsp;#NEXT_DATE_FOR_VISIT#</td></tr><tr><td>11</td><td>follow-up action</td><td>:&nbsp;#REMARKS#</td></tr></tbody></table></div><br><br><div style='text-decoration: underline'>Thanks & Regards</div><div style='color: #4cae4c;font-weight:bold'>Kommineni Consultants Pvt. Ltd.</div><div>Customer Recovery.</div><br /><br /><div><span style='color:red'>Note: </span>This is auto generated mail, Please do not reply to this mail</div></body></html>";
            }
            DataRowCollection DDR = EXECUTIVEWISEVISITDETAILS_GET_DATA_FOR_MAIL(RID).Rows;
            foreach (DataRow DR in DDR)
            {
                MAIL_BODY = MAIL_BODY.Replace("##DATE##", DateTime.Now.ToString("dd-MM-yyyy"));
                MAIL_BODY = MAIL_BODY.Replace("#EXECUTIVE#", DR["EXECUTIVE_NAME"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#ACCOUNTNUMBER#", DR["LOANACCOUNTNO"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BANK#", DR["BANK"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BRANCH#", DR["BRANCH"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#DATE#", DR["DATE"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#LOAN_AMOUNT#", DR["LOANAMOUNT"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BANK_RANGE_TYPE#", DR["BANKRANGETYPEV"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#AMOUNT_RECOVERED#", DR["AMOUNTRECOVERD"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BALANCE_AMOUNT#", DR["BALANCEAMOUNT"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#NEXT_DATE_FOR_VISIT#", DR["NEXTDATEFORVISIT"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#REMARKS#", DR["COMMENTS"].ToString());
            }

            SmtpClient SMTP_CLIENT = new SmtpClient();
            NetworkCredential BASIC_CREDENTIAL = new NetworkCredential(SENDER_MAIL, SENDER_MAIL_PASSWORD);
            MailMessage MESSAGE = new MailMessage();
            MailAddress FROM_MAIL_ADDRESS = new MailAddress(FROM_MAIL, "Kommineni");

            SMTP_CLIENT.Host = SMTP_SERVER;
            if (MAIL_AUTHENTICATION == "True")
            {
                SMTP_CLIENT.UseDefaultCredentials = false;
                SMTP_CLIENT.Credentials = BASIC_CREDENTIAL;
            }
            else
            {
                SMTP_CLIENT.UseDefaultCredentials = true;
            }
            DataTable MDT = EMAILs(Convert.ToInt32(DDR[0]["NPAID"]));
            MESSAGE.From = FROM_MAIL_ADDRESS;
            if (TYPE == "NEW")
            {
                MESSAGE.Subject = "Creation of record visit details (" + MDT.Rows[0][1] + ")";
            }
            if (TYPE == "UPDATE")
            {
                MESSAGE.Subject = "Updation of records visit Details (" + MDT.Rows[0][1] + ")";
            }
            //Set IsBodyHtml to true means you can send HTML email. 
            MESSAGE.IsBodyHtml = true;
            MESSAGE.Body = MAIL_BODY;// string.Format("You have requested the Verification Code from our site.{0} Here is the Verification Code : {1}", Environment.NewLine, password);
            string[] MailsList = MDT.Rows[0][0].ToString().Split(',');
            for (int MailC = 0; MailC < MailsList.Length; MailC++)
            {
                MESSAGE.To.Add(MailsList[MailC]);
            }

            try
            {
                SMTP_CLIENT.Send(MESSAGE);
            }
            catch (Exception Ex)
            {
                logfile.ErrorFormat(Ex.Message);
            }
        }
        catch (Exception Ex)
        {
            logfile.ErrorFormat(Ex.Message);
        }
    }
    #endregion

    #endregion

    #region RECOVERY BILL DETAILS

    #region RECOVERYBILLDETAILS_GET_FOR_MAIL

    public static DataTable RECOVERYBILLDETAILS_GET_FOR_MAIL(int RBID)
    {
        try
        {
            const string storedprocedure = "[RECOVERY].[RECOVERYBILLDETAILS_GET_FOR_MAIL]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@RBID", SqlDbType.Int) { Value = RBID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            Thread Error_Mail_Thread = new Thread(() => ERROR_MAIL_CR(Ex));
            Error_Mail_Thread.Start();
            return null;
        }
    }

    #endregion

    #region SEND_RECOVEY_BILL_DETAILS_MAIL
    public static bool SEND_RECOVEY_BILL_DETAILS_MAIL(int RBID, string TYPE)
    {
        try
        {
            string SMTP_SERVER = ConfigurationManager.AppSettings["MailServer"];
            string FROM_MAIL = ConfigurationManager.AppSettings["From"];
            string SENDER_MAIL = ConfigurationManager.AppSettings["AuthUser"];
            string SENDER_MAIL_PASSWORD = ConfigurationManager.AppSettings["AuthPass"];
            string MAIL_AUTHENTICATION = ConfigurationManager.AppSettings["MailAuthentication"];
            string MAIL_BODY = "";
            if (TYPE == "NEW")
            {
                MAIL_BODY = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'><head><title></title></head><body><div>Dear Sir/Madam,</div><div>Recovery Bill details are created successfully and please find the below details.</div><br><div><table dir='ltr' style='color: #2B82AD; border: 1px solid #1793d1; border-collapse: collapse; padding-left: 50px'><tr><td style='color: #FFFFFF; font-weight: bold; width: 50px; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>S.No.</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>Details</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>DATE : #DATE#</td></tr><tbody><tr><td>1</td><td>Executive</td><td>:&nbsp;#EXECUTIVE#</td></tr><tr><td>2</td><td>Borrower Name</td><td>:&nbsp;#BORROWER_NAME#</td></tr><tr><td>3</td><td>Account Number</td><td>:&nbsp;#ACCOUNTNUMBER#</td></tr><tr><td>4</td><td>Bank</td><td>:&nbsp;#BANK#</td></tr><tr><td>5</td><td>Branch</td><td>:&nbsp;#BRANCH#</td></tr><tr><td>6</td><td>Loan Amount</td><td>:&nbsp;#LOAN_AMOUNT#</td></tr><tr><td>7</td><td>Previous Recovered Amount</td><td>:&nbsp;#PREVIOUS_RECOVERED_AMOUNT#</td></tr><tr><td>8</td><td style='font-weight:bold'>Amount Recovered</td><td style='font-weight:bold'>:&nbsp;#AMOUNT_RECOVERED#</td></tr><tr><td>9</td><td style='font-weight:bold'>Balance Amount</td><td style='font-weight:bold'>:&nbsp;#BALANCE_AMOUNT#</td></tr><tr><td>10</td><td>Recovered Date(MM/DD/YYYY)</td><td>:&nbsp;#RECOVERED_DATE#</td></tr><tr><td>11</td><td style='font-weight:bold'>Recovered Amount Commission(%)</td><td style='font-weight:bold'>:&nbsp;#RECOVERED_AMOUNT_COMMISSION#</td></tr><tr><td>12</td><td style='font-weight:bold'>Service Tax(%)</td><td style='font-weight:bold'>:&nbsp;#SERVICE_TAX#</td></tr><tr><td>13</td><td>Board Charges</td><td>:&nbsp;#BOARD_CHARGES#</td></tr><tr><td>14</td><td>Transport Charges</td><td>:&nbsp;#TRANSPORT_CHARGES#</td></tr><tr><td>15</td><td>Valuation Charges</td><td>:&nbsp;#VALUATION_CHARGES#</td></tr><tr><td>16</td><td>Surveyor Charges</td><td>:&nbsp;#SURVEYOR_CHARGES#</td></tr><tr><td>17</td><td>Property Identification Charges</td><td>:&nbsp;#PROPERTY_IDENTIFICATION_CHARGES#</td></tr><tr><td>18</td><td>Investigation Charges</td><td>:&nbsp;#INVESTIGATION_CHARGES#</td></tr><tr><td>19</td><td>Miscellaneous Charges</td><td>:&nbsp;#MISCELLANEOUS_CHARGES#</td></tr><tr><td>20</td><td>Total Commission</td><td>:&nbsp;#TOTAL_COMMISSION#</td></tr><tr><td>21</td><td>Bank Range Type</td><td>:&nbsp;#BANK_RANGE_TYPE#</td></tr></tbody></table></div><br><br><div style='text-decoration: underline'>Thanks & Regards</div><div style='color: #4cae4c;font-weight:bold'>Kommineni Consultants Pvt. Ltd.</div><div>Customer Recovery.</div><br /><br /><div><span style='color:red'>Note: </span>This is auto generated mail, Please do not reply to this mail</div></body></html>";
            }
            if (TYPE == "UPDATE")
            {
                MAIL_BODY = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'><head><title></title></head><body><div>Dear Sir/Madam,</div><div>Recovery Bill details are updated successfully and please find the below mentioned details.</div><br><div><table dir='ltr' style='color: #2B82AD; border: 1px solid #1793d1; border-collapse: collapse; padding-left: 50px'><tr><td style='color: #FFFFFF; font-weight: bold; width: 50px; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>S.No.</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>Details</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>DATE : #DATE#</td></tr><tbody><tr><td>1</td><td>Executive</td><td>:&nbsp;#EXECUTIVE#</td></tr><tr><td>2</td><td>Borrower Name</td><td>:&nbsp;#BORROWER_NAME#</td></tr><tr><td>3</td><td>Account Number</td><td>:&nbsp;#ACCOUNTNUMBER#</td></tr><tr><td>4</td><td>Bank</td><td>:&nbsp;#BANK#</td></tr><tr><td>5</td><td>Branch</td><td>:&nbsp;#BRANCH#</td></tr><tr><td>6</td><td>Loan Amount</td><td>:&nbsp;#LOAN_AMOUNT#</td></tr><tr><td>7</td><td>Previous Recovered Amount</td><td>:&nbsp;#PREVIOUS_RECOVERED_AMOUNT#</td></tr><tr><td>8</td><td style='font-weight:bold'>Amount Recovered</td><td style='font-weight:bold'>:&nbsp;#AMOUNT_RECOVERED#</td></tr><tr><td>9</td><td style='font-weight:bold'>Balance Amount</td><td style='font-weight:bold'>:&nbsp;#BALANCE_AMOUNT#</td></tr><tr><td>10</td><td>Recovered Date(MM/DD/YYYY)</td><td>:&nbsp;#RECOVERED_DATE#</td></tr><tr><td>11</td><td style='font-weight:bold'>Recovered Amount Commission(%)</td><td style='font-weight:bold'>:&nbsp;#RECOVERED_AMOUNT_COMMISSION#</td></tr><tr><td>12</td><td style='font-weight:bold'>Service Tax(%)</td><td style='font-weight:bold'>:&nbsp;#SERVICE_TAX#</td></tr><tr><td>13</td><td>Board Charges</td><td>:&nbsp;#BOARD_CHARGES#</td></tr><tr><td>14</td><td>Transport Charges</td><td>:&nbsp;#TRANSPORT_CHARGES#</td></tr><tr><td>15</td><td>Valuation Charges</td><td>:&nbsp;#VALUATION_CHARGES#</td></tr><tr><td>16</td><td>Surveyor Charges</td><td>:&nbsp;#SURVEYOR_CHARGES#</td></tr><tr><td>17</td><td>Property Identification Charges</td><td>:&nbsp;#PROPERTY_IDENTIFICATION_CHARGES#</td></tr><tr><td>18</td><td>Investigation Charges</td><td>:&nbsp;#INVESTIGATION_CHARGES#</td></tr><tr><td>19</td><td>Miscellaneous Charges</td><td>:&nbsp;#MISCELLANEOUS_CHARGES#</td></tr><tr><td>20</td><td>Total Commission</td><td>:&nbsp;#TOTAL_COMMISSION#</td></tr><tr><td>21</td><td>Bank Range Type</td><td>:&nbsp;#BANK_RANGE_TYPE#</td></tr></tbody></table></div><br><br><div style='text-decoration: underline'>Thanks & Regards</div><div style='color: #4cae4c;font-weight:bold'>Kommineni Consultants Pvt. Ltd.</div><div>Customer Recovery.</div><br /><br /><div><span style='color:red'>Note: </span>This is auto generated mail, Please do not reply to this mail</div></body></html>";
            }
            DataRowCollection DDR = RECOVERYBILLDETAILS_GET_FOR_MAIL(RBID).Rows;
            foreach (DataRow DR in DDR)
            {
                MAIL_BODY = MAIL_BODY.Replace("#DATE#", DateTime.Now.ToString("dd-MM-yyyy"));
                MAIL_BODY = MAIL_BODY.Replace("#EXECUTIVE#", DR["EXECUTIVE"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BORROWER_NAME#", DR["BORROWER_NAME"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#ACCOUNTNUMBER#", DR["ACCOUNTNUMBER"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BANK#", DR["BANK"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BRANCH#", DR["BRANCH"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#LOAN_AMOUNT#", DR["LOAN_AMOUNT"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#PREVIOUS_RECOVERED_AMOUNT#", (Convert.ToDecimal(DR["PREVIOUS_RECOVERED_AMOUNT"]) - Convert.ToDecimal(DR["AMOUNT_RECOVERED"])).ToString(CultureInfo.InvariantCulture));
                MAIL_BODY = MAIL_BODY.Replace("#AMOUNT_RECOVERED#", DR["AMOUNT_RECOVERED"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BALANCE_AMOUNT#", DR["BALANCE_AMOUNT"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#RECOVERED_DATE#", DR["RECOVERED_DATE"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#RECOVERED_AMOUNT_COMMISSION#", DR["RECOVERED_AMOUNT_COMMISSION"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#SERVICE_TAX#", DR["SERVICE_TAX"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#TOTALCOMMISSION#", DR["TOTALCOMMISSION"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BOARD_CHARGES#", DR["BOARD_CHARGES"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#TRANSPORT_CHARGES#", DR["TRANSPORT_CHARGES"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#VALUATION_CHARGES#", DR["VALUATION_CHARGES"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#SURVEYOR_CHARGES#", DR["SURVEYOR_CHARGES"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#PROPERTY_IDENTIFICATION_CHARGES#", DR["PROPERTY_IDENTIFICATION_CHARGES"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#INVESTIGATION_CHARGES#", DR["INVESTIGATION_CHARGES"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#MISCELLANEOUS_CHARGES#", DR["MISCELLANEOUS_CHARGES"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BANK_RANGE_TYPE#", DR["BANKRANGETYPEV"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#TOTAL_COMMISSION#", DR["TOTALCOMMISSION"].ToString());
            }
            SmtpClient SMTP_CLIENT = new SmtpClient();
            NetworkCredential BASIC_CREDENTIAL = new NetworkCredential(SENDER_MAIL, SENDER_MAIL_PASSWORD);
            MailMessage MESSAGE = new MailMessage();
            MailAddress FROM_MAIL_ADDRESS = new MailAddress(FROM_MAIL, "Kommineni");

            SMTP_CLIENT.Host = SMTP_SERVER;
            if (MAIL_AUTHENTICATION == "True")
            {
                SMTP_CLIENT.UseDefaultCredentials = false;
                SMTP_CLIENT.Credentials = BASIC_CREDENTIAL;
            }
            else
            {
                SMTP_CLIENT.UseDefaultCredentials = true;
            }
            DataTable MDT = EMAILs(Convert.ToInt32(DDR[0]["NPAID"]));
            MESSAGE.From = FROM_MAIL_ADDRESS;
            if (TYPE == "NEW")
            {
                MESSAGE.Subject = "Creation of Recovery bill details (" + MDT.Rows[0][1] + ")";
            }
            if (TYPE == "UPDATE")
            {
                MESSAGE.Subject = "Updation of Recovery Bill Details (" + MDT.Rows[0][1] + ")";
            }
            //Set IsBodyHtml to true means you can send HTML email. 
            MESSAGE.IsBodyHtml = true;
            MESSAGE.Body = MAIL_BODY;// string.Format("You have requested the Verification Code from our site.{0} Here is the Verification Code : {1}", Environment.NewLine, password);

            //DataTable BillDt = new DataTable();
            //BillDt = CRBusinessLogicLayer.RECOVERY_BILL(Convert.ToInt32(DDR[0]["NPAID"]));

            //MESSAGE.Attachments.Add(new Attachment(new MemoryStream(RECOVERY_BILL_PAYMENT_LETTER_FOR_MAIL(BillDt, "ST001", "AAACK8658H")), "" + MDT.Rows[0][1].ToString() + ".pdf"));
            string[] MailsList = MDT.Rows[0][0].ToString().Split(',');
            foreach (string t in MailsList)
            {
                MESSAGE.To.Add(t);
            }

            try
            {
                SMTP_CLIENT.Send(MESSAGE);
                return true;
            }
            catch (Exception Ex)
            {
                logfile.ErrorFormat(Ex.Message);
                return false;
            }
        }
        catch (Exception Ex)
        {

            logfile.ErrorFormat(Ex.Message);
            return false;
        }
    }
    #endregion

    //#region RECOVERY_BILL_PAYMENT_LETTER_FOR_MAIL

    //public static byte[] RECOVERY_BILL_PAYMENT_LETTER_FOR_MAIL(DataTable BillDt, string STN, string PAN)
    //{
    //    try
    //    {
    //        int FontSize = 11;
    //        Document document = new Document(PageSize.A4, 5f, 5f, 10f, 5f);
    //        using (var memoryStream = new MemoryStream())
    //        {
    //            PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
    //            document.Open();
    //            PdfContentByte contentByte0 = writer.DirectContent;
    //            contentByte0.SetLineWidth(1f);
    //            contentByte0.MoveTo(0, 767);
    //            contentByte0.LineTo(writer.PageSize.Width, 767);
    //            contentByte0.Stroke();

    //            PdfContentByte contentByte = writer.DirectContent;
    //            contentByte.SetLineWidth(1f);
    //            contentByte.MoveTo(0, 82);
    //            contentByte.LineTo(writer.PageSize.Width, 82);
    //            contentByte.Stroke();

    //            PdfPTable HeaderTable = new PdfPTable(6);
    //            HeaderTable.WidthPercentage = 100;
    //            HeaderTable.SpacingAfter = 0;

    //            Phrase Company = new Phrase();
    //            Company = new Phrase();
    //            Company.Add(new Chunk("Kommineni Consultants Pvt. Ltd.", FontFactory.GetFont("Times", 20, Font.BOLDITALIC, new Color(44, 156, 48))));
    //            PdfPCell ComName = new PdfPCell(Company);
    //            ComName.BorderColor = Color.WHITE;
    //            ComName.VerticalAlignment = PdfCell.ALIGN_TOP;
    //            ComName.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
    //            ComName.Colspan = 6;
    //            HeaderTable.AddCell(ComName);

    //            Company = new Phrase();
    //            Company.Add(new Chunk("H.No.: 8-3-1-21, Plot No.: 24, Krishna Vihar HDFC Bank Lane,\nSrinagar Colony, Hyderabad Ph : 65886859, 23744980, Fax : 23744981\nE-mail : reach@kommineni.co.in, www.kommineni.co.in", FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(51, 102, 153))));
    //            PdfPCell CompanyAddressCell = new PdfPCell(Company);
    //            CompanyAddressCell.BorderColor = Color.WHITE;
    //            CompanyAddressCell.VerticalAlignment = PdfCell.ALIGN_TOP;
    //            CompanyAddressCell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
    //            CompanyAddressCell.PaddingBottom = 10f;
    //            CompanyAddressCell.Colspan = 6;
    //            HeaderTable.AddCell(CompanyAddressCell);
    //            document.Add(HeaderTable);

    //            PdfPTable Table1 = new PdfPTable(6);
    //            Table1.WidthPercentage = 100;

    //            Phrase phrase1 = new Phrase();

    //            phrase1 = new Phrase();
    //            phrase1.Add(new Phrase("To", FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0))));
    //            PdfPCell Row0 = new PdfPCell(phrase1);
    //            Row0.BorderColor = Color.WHITE;
    //            Row0.PaddingTop = 0f;
    //            Row0.PaddingBottom = 2f;
    //            Row0.Colspan = 6;
    //            Row0.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //            Table1.AddCell(Row0);

    //            phrase1 = new Phrase();
    //            phrase1.Add(new Phrase("The Branch Manager,\n" + BillDt.Rows[0]["BANK_NAME"].ToString() + ",\n" + BillDt.Rows[0]["BRANCH_NAME"].ToString() + ".", FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0))));
    //            PdfPCell Row2 = new PdfPCell(phrase1);
    //            Row2.HorizontalAlignment = PdfCell.ALIGN_LEFT;
    //            Row2.BorderColor = Color.WHITE;
    //            Row2.PaddingLeft = 15f;
    //            Row2.PaddingTop = 1f;
    //            Row2.PaddingBottom = 2f;
    //            Row2.Colspan = 4;
    //            Table1.AddCell(Row2);

    //            phrase1 = new Phrase();
    //            phrase1.Add(new Phrase("Date : " + DateTime.Now.ToString("dd/MM/yyyy"), FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0))));
    //            PdfPCell Row1 = new PdfPCell(phrase1);
    //            Row1.HorizontalAlignment = PdfCell.ALIGN_RIGHT;
    //            Row1.BorderColor = Color.WHITE;
    //            Row1.PaddingRight = 38f;
    //            Row1.PaddingTop = 1f;
    //            Row1.Colspan = 2;
    //            Table1.AddCell(Row1);
    //            string RecoveredDate = DateTime.Now.ToString();
    //            string SNO = DateTime.Now.ToString();
    //            if (Convert.ToInt16(Convert.ToDateTime(RecoveredDate).ToString("dd")) > 3)
    //            {
    //                SNO = Convert.ToDateTime(RecoveredDate).ToString("MMM") + ' ' + Convert.ToDateTime(RecoveredDate).ToString("dd") + '/' + Convert.ToDateTime(RecoveredDate).ToString("yyyy") + '-' + Convert.ToDateTime(RecoveredDate).AddYears(1).ToString("yyyy");
    //            }
    //            else
    //            {
    //                SNO = Convert.ToDateTime(RecoveredDate).ToString("MMM") + ' ' + Convert.ToDateTime(RecoveredDate).ToString("dd") + '/' + Convert.ToDateTime(RecoveredDate).AddYears(-1).ToString("yyyy") + '-' + Convert.ToDateTime(RecoveredDate).ToString("yyyy");
    //            }

    //            phrase1 = new Phrase();
    //            phrase1.Add(new Phrase("S.No : " + SNO, FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0))));
    //            PdfPCell SnNo = new PdfPCell(phrase1);
    //            SnNo.HorizontalAlignment = PdfCell.ALIGN_RIGHT;
    //            SnNo.BorderColor = Color.WHITE;
    //            SnNo.PaddingTop = 1f;
    //            SnNo.PaddingLeft = 15f;
    //            SnNo.Colspan = 6;
    //            SnNo.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //            Table1.AddCell(SnNo);

    //            phrase1 = new Phrase();
    //            phrase1.Add(new Phrase("Sub-NPA Recovery - Payment Commission.\n \nWe furnish below the details of recoveries made in the NPA Accounts entrusted to us and the \ncommission payable. there on", FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0))));
    //            PdfPCell Row6 = new PdfPCell(phrase1);
    //            Row6.BorderColor = Color.WHITE;
    //            Row6.PaddingTop = 10f;
    //            Row6.PaddingBottom = 5f;
    //            Row6.Colspan = 6;
    //            Row6.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //            Table1.AddCell(Row6);

    //            document.Add(Table1);

    //            Paragraph TBT = new Paragraph(new Chunk(new iTextSharp.text.pdf.draw.LineSeparator(0.0F, 90.0F, new Color(0, 0, 0), Element.ALIGN_LEFT, 0)));
    //            document.Add(TBT);
    //            //Table
    //            PdfPTable Table2 = null;
    //            Table2 = new PdfPTable(6);
    //            Table2.HorizontalAlignment = 0;
    //            Table2.TotalWidth = 580f;
    //            Table2.LockedWidth = true;
    //            float[] widths = new float[] { 173f, 109f, 75f, 103f, 103f, 103f };
    //            Table2.SetWidths(widths);
    //            Table2.DefaultCell.BorderColor = Color.BLACK;

    //            Phrase phrase2 = new Phrase();
    //            phrase2.Add(new Phrase("\nBorrower", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //            PdfPCell Cell1 = new PdfPCell(phrase2);
    //            Cell1.BorderColor = Color.BLACK;
    //            Cell1.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell1.HorizontalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell1.BorderWidth = 0.6f;
    //            Table2.AddCell(Cell1);

    //            phrase2 = new Phrase();
    //            phrase2.Add(new Phrase("\nAccount No", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //            PdfPCell Cell2 = new PdfPCell(phrase2);
    //            Cell2.BorderColor = Color.BLACK;
    //            Cell2.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell2.HorizontalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell2.BorderWidth = 0.6f;
    //            Table2.AddCell(Cell2);

    //            phrase2 = new Phrase();
    //            phrase2.Add(new Phrase("\nDate of\nRecovery", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //            PdfPCell Cell3 = new PdfPCell(phrase2);
    //            Cell3.BorderColor = Color.BLACK;
    //            Cell3.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell3.HorizontalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell3.BorderWidth = 0.6f;
    //            Table2.AddCell(Cell3);

    //            phrase2 = new Phrase();
    //            phrase2.Add(new Phrase("\nAmount \nRecovered\n(Rs.)", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //            PdfPCell Cell4 = new PdfPCell(phrase2);
    //            Cell4.BorderColor = Color.BLACK;
    //            Cell4.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell4.HorizontalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell4.BorderWidth = 0.6f;
    //            Table2.AddCell(Cell4);

    //            phrase2 = new Phrase();
    //            phrase2.Add(new Phrase("\nCommision\n(Rs.)", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //            PdfPCell Cell5 = new PdfPCell(phrase2);
    //            Cell5.BorderColor = Color.BLACK;
    //            Cell5.HorizontalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell5.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell5.BorderWidth = 0.6f;
    //            Table2.AddCell(Cell5);

    //            phrase2 = new Phrase();
    //            phrase2.Add(new Phrase("Commision\n+ Service Tax\n@" + BillDt.Rows[0]["SERVICETAXPER"].ToString() + "%\n(Rs.)", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //            PdfPCell Cell6 = new PdfPCell(phrase2);
    //            Cell6.BorderColor = Color.BLACK;
    //            Cell6.HorizontalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell6.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //            Cell6.BorderWidth = 0.6f;
    //            Table2.AddCell(Cell6);
    //            int LoopCount = 0;
    //            decimal RECOVERYAMOUNT = 0;
    //            decimal RECOVERYAMOUNTCOMMISSION = 0;
    //            decimal TOTALCOMMISSION = 0;
    //            //ROW
    //            foreach (DataRow DR in BillDt.Rows)
    //            {
    //                phrase2 = new Phrase();
    //                phrase2.Add(new Phrase(DR["BORROWERNAME"].ToString(), FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //                PdfPCell Cell11 = new PdfPCell(phrase2);
    //                Cell11.BorderColor = Color.BLACK;
    //                Cell11.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //                Cell11.HorizontalAlignment = PdfCell.ALIGN_LEFT;
    //                Cell11.PaddingTop = 3f;
    //                Cell11.PaddingBottom = 3f;
    //                Cell11.BorderWidth = 0.6f;
    //                Table2.AddCell(Cell11);

    //                phrase2 = new Phrase();
    //                phrase2.Add(new Phrase(DR["LOANACCOUNTNO"].ToString(), FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //                PdfPCell Cell12 = new PdfPCell(phrase2);
    //                Cell12.BorderColor = Color.BLACK;
    //                Cell12.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //                Cell12.HorizontalAlignment = PdfCell.ALIGN_CENTER;
    //                Cell12.PaddingTop = 3f;
    //                Cell12.PaddingBottom = 3f;
    //                Cell12.BorderWidth = 0.6f;
    //                Table2.AddCell(Cell12);

    //                phrase2 = new Phrase();
    //                phrase2.Add(new Phrase(DR["RECOVERDATE"].ToString(), FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //                PdfPCell Cell13 = new PdfPCell(phrase2);
    //                Cell13.BorderColor = Color.BLACK;
    //                Cell13.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //                Cell13.HorizontalAlignment = PdfCell.ALIGN_CENTER;
    //                Cell13.PaddingTop = 3f;
    //                Cell13.PaddingBottom = 3f;
    //                Cell13.BorderWidth = 0.6f;
    //                Table2.AddCell(Cell13);

    //                phrase2 = new Phrase();
    //                phrase2.Add(new Phrase(DR["RECOVERYAMOUNT"].ToString(), FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //                PdfPCell Cell14 = new PdfPCell(phrase2);
    //                Cell14.BorderColor = Color.BLACK;
    //                Cell14.BorderColorBottom = Color.BLACK;
    //                Cell14.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //                Cell14.HorizontalAlignment = PdfCell.ALIGN_RIGHT;
    //                Cell14.PaddingTop = 3f;
    //                Cell14.PaddingBottom = 3f;
    //                Cell14.BorderWidth = 0.6f;
    //                Table2.AddCell(Cell14);

    //                phrase2 = new Phrase();
    //                phrase2.Add(new Phrase(DR["RECOVERYAMOUNTCOMMISSION"].ToString(), FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //                PdfPCell Cell15 = new PdfPCell(phrase2);
    //                Cell15.BorderColor = Color.BLACK;
    //                Cell15.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //                Cell15.HorizontalAlignment = PdfCell.ALIGN_RIGHT;
    //                Cell15.PaddingTop = 3f;
    //                Cell15.PaddingBottom = 3f;
    //                Cell15.BorderWidth = 0.6f;
    //                Table2.AddCell(Cell15);

    //                phrase2 = new Phrase();
    //                phrase2.Add(new Phrase(DR["TOTALCOMMISSION"].ToString(), FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0))));
    //                PdfPCell Cell16 = new PdfPCell(phrase2);
    //                Cell16.BorderColor = Color.BLACK;
    //                Cell16.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //                Cell16.HorizontalAlignment = PdfCell.ALIGN_RIGHT;
    //                Cell16.PaddingTop = 3f;
    //                Cell16.PaddingBottom = 3f;
    //                Cell16.BorderWidth = 0.6f;
    //                Table2.AddCell(Cell16);

    //                RECOVERYAMOUNT += Convert.ToDecimal(DR["RECOVERYAMOUNT"]);
    //                RECOVERYAMOUNTCOMMISSION += Convert.ToDecimal(DR["RECOVERYAMOUNTCOMMISSION"]);
    //                TOTALCOMMISSION += Convert.ToDecimal(DR["TOTALCOMMISSION"]);
    //                LoopCount++;
    //            }
    //            //ROW END
    //            for (int z = 0; z <= 15 - LoopCount; z++)
    //            {

    //                //ROW
    //                phrase2 = new Phrase();
    //                phrase2.Add(new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(), FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255))));
    //                PdfPCell Cellc11 = new PdfPCell(phrase2);
    //                Cellc11.BorderColor = Color.BLACK;
    //                Cellc11.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //                Cellc11.HorizontalAlignment = PdfCell.ALIGN_LEFT;
    //                Cellc11.PaddingTop = 3f;
    //                Cellc11.PaddingBottom = 3f;
    //                Cellc11.BorderWidth = 0.6f;
    //                Table2.AddCell(Cellc11);

    //                phrase2 = new Phrase();
    //                phrase2.Add(new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(), FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255))));
    //                PdfPCell Cellc12 = new PdfPCell(phrase2);
    //                Cellc12.BorderColor = Color.BLACK;
    //                Cellc12.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //                Cellc12.HorizontalAlignment = PdfCell.ALIGN_CENTER;
    //                Cellc12.PaddingTop = 3f;
    //                Cellc12.PaddingBottom = 3f;
    //                Cellc12.BorderWidth = 0.6f;
    //                Table2.AddCell(Cellc12);

    //                phrase2 = new Phrase();
    //                phrase2.Add(new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(), FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255))));
    //                PdfPCell Cellc13 = new PdfPCell(phrase2);
    //                Cellc13.BorderColor = Color.BLACK;
    //                Cellc13.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //                Cellc13.HorizontalAlignment = PdfCell.ALIGN_CENTER;
    //                Cellc13.PaddingTop = 3f;
    //                Cellc13.PaddingBottom = 3f;
    //                Cellc13.BorderWidth = 0.6f;
    //                Table2.AddCell(Cellc13);

    //                phrase2 = new Phrase();
    //                phrase2.Add(new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(), FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255))));
    //                PdfPCell Cellc14 = new PdfPCell(phrase2);
    //                Cellc14.BorderColor = Color.BLACK;
    //                Cellc14.BorderColorBottom = Color.BLACK;
    //                Cellc14.VerticalAlignment = PdfCell.ALIGN_CENTER;
    //                Cellc14.HorizontalAlignment = PdfCell.ALIGN_RIGHT;
    //                Cellc14.PaddingTop = 3f;
    //                Cellc14.PaddingBottom = 3f;
    //                Cellc14.BorderWidth = 0.6f;
    //                Table2.AddCell(Cellc14);

    //                phrase2 = new Phrase
    //                {
    //                    new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(),
    //                        FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255)))
    //                };
    //                PdfPCell Cellc15 = new PdfPCell(phrase2);
    //                Cellc15.BorderColor = Color.BLACK;
    //                Cellc15.VerticalAlignment = Element.ALIGN_CENTER;
    //                Cellc15.HorizontalAlignment = Element.ALIGN_RIGHT;
    //                Cellc15.PaddingTop = 3f;
    //                Cellc15.PaddingBottom = 3f;
    //                Cellc15.BorderWidth = 0.6f;
    //                Table2.AddCell(Cellc15);

    //                phrase2 = new Phrase
    //                {
    //                    new Phrase(BillDt.Rows[0]["TOTALCOMMISSION"].ToString(),
    //                        FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(255, 255, 255)))
    //                };
    //                PdfPCell Cellc16 = new PdfPCell(phrase2)
    //                {
    //                    BorderColor = Color.BLACK,
    //                    VerticalAlignment = Element.ALIGN_CENTER,
    //                    HorizontalAlignment = Element.ALIGN_RIGHT,
    //                    PaddingTop = 3f,
    //                    PaddingBottom = 3f,
    //                    BorderWidth = 0.6f
    //                };
    //                Table2.AddCell(Cellc16);
    //                //ROW END
    //            }
    //            phrase2 = new Phrase {new Phrase("", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))};
    //            PdfPCell TotalCell1 = new PdfPCell(phrase2)
    //            {
    //                BorderColor = Color.BLACK,
    //                VerticalAlignment = Element.ALIGN_CENTER,
    //                HorizontalAlignment = Element.ALIGN_LEFT,
    //                PaddingTop = 3f,
    //                PaddingBottom = 3f,
    //                BorderWidth = 0.6f
    //            };
    //            Table2.AddCell(TotalCell1);

    //            phrase2 = new Phrase
    //            {
    //                new Phrase("Total", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
    //            };
    //            PdfPCell TotalCell2 = new PdfPCell(phrase2)
    //            {
    //                BorderColor = Color.BLACK,
    //                VerticalAlignment = Element.ALIGN_CENTER,
    //                HorizontalAlignment = Element.ALIGN_CENTER,
    //                PaddingTop = 3f,
    //                PaddingBottom = 3f,
    //                BorderWidth = 0.6f
    //            };
    //            Table2.AddCell(TotalCell2);

    //            phrase2 = new Phrase {new Phrase("", FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))};
    //            PdfPCell TotalCell3 = new PdfPCell(phrase2)
    //            {
    //                BorderColor = Color.BLACK,
    //                VerticalAlignment = Element.ALIGN_CENTER,
    //                HorizontalAlignment = Element.ALIGN_CENTER,
    //                PaddingTop = 3f,
    //                PaddingBottom = 3f,
    //                BorderWidth = 0.6f
    //            };
    //            Table2.AddCell(TotalCell3);

    //            phrase2 = new Phrase
    //            {
    //                new Phrase(RECOVERYAMOUNT.ToString(CultureInfo.InvariantCulture),
    //                    FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
    //            };
    //            PdfPCell TotalCell4 = new PdfPCell(phrase2)
    //            {
    //                BorderColor = Color.BLACK,
    //                BorderColorBottom = Color.BLACK,
    //                VerticalAlignment = Element.ALIGN_CENTER,
    //                HorizontalAlignment = Element.ALIGN_RIGHT,
    //                PaddingTop = 3f,
    //                PaddingBottom = 3f,
    //                BorderWidth = 0.6f
    //            };
    //            Table2.AddCell(TotalCell4);

    //            phrase2 = new Phrase
    //            {
    //                new Phrase(RECOVERYAMOUNTCOMMISSION.ToString(CultureInfo.InvariantCulture),
    //                    FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
    //            };
    //            PdfPCell TotalCell5 = new PdfPCell(phrase2)
    //            {
    //                BorderColor = Color.BLACK,
    //                VerticalAlignment = Element.ALIGN_CENTER,
    //                HorizontalAlignment = Element.ALIGN_RIGHT,
    //                PaddingTop = 3f,
    //                PaddingBottom = 3f,
    //                BorderWidth = 0.6f
    //            };
    //            Table2.AddCell(TotalCell5);

    //            phrase2 = new Phrase
    //            {
    //                new Phrase(TOTALCOMMISSION.ToString(CultureInfo.InvariantCulture),
    //                    FontFactory.GetFont("Arial", 10, Font.NORMAL, new Color(0, 0, 0)))
    //            };
    //            PdfPCell TotalCell6 = new PdfPCell(phrase2)
    //            {
    //                BorderColor = Color.BLACK,
    //                VerticalAlignment = Element.ALIGN_CENTER,
    //                HorizontalAlignment = Element.ALIGN_RIGHT,
    //                PaddingTop = 3f,
    //                PaddingBottom = 3f,
    //                BorderWidth = 0.6f
    //            };
    //            Table2.AddCell(TotalCell6);

    //            document.Add(Table2);

    //            Paragraph pb = new Paragraph(new Chunk(new iTextSharp.text.pdf.draw.LineSeparator(0.0F, 100.0F, new Color(0, 0, 0), Element.ALIGN_LEFT, 0)));
    //            document.Add(pb);

    //            var Table3 = new PdfPTable(6) {WidthPercentage = 100};

    //            Phrase phrase3 = new Phrase
    //            {
    //                new Phrase(
    //                    "Service Tax - " + STN + ", PAN - " + PAN +
    //                    "\n\nWe request you to issue D.D in favour of M/s Kommineni Consultants Pvt. Ltd. or Credit the amount to\nAccount No.:054311100002962 with Andhra Bank, Srinagar Colony, Hyderabad. IFSC CODE: ANDB0000543",
    //                    FontFactory.GetFont("Arial", FontSize, Font.NORMAL, new Color(0, 0, 0)))
    //            };
    //            PdfPCell Row9 = new PdfPCell(phrase3)
    //            {
    //                BorderColor = Color.WHITE,
    //                PaddingTop = 7f,
    //                Colspan = 6,
    //                VerticalAlignment = Element.ALIGN_CENTER
    //            };
    //            Table3.AddCell(Row9);
    //            document.Add(Table3);

    //            writer.PageEvent = new Footer();

    //            //document.Close();
    //            byte[] bytes = memoryStream.ToArray();
    //            return bytes;
    //        }
    //    }
    //    catch (Exception Ex)
    //    {
    //        logfile.ErrorFormat(Ex.Message);
    //        return null;
    //    }
    //}
    //#endregion

    #endregion

    #region RECOVERY STATEMENT

    #region RECOVERY_STATEMENT_GET_FOR_MAIL

    public static DataTable RECOVERY_STATEMENT_GET_FOR_MAIL(int ID)
    {
        try
        {
            const string storedprocedure = "[REPORT].[RECOVERY_STATEMENT_GET_FOR_MAIL]";
            var parameters = new SqlParameter[1];
            parameters[0] = new SqlParameter("@ID", SqlDbType.Int) { Value = ID };
            var ds = SQLHelper.GetInstance().ExecuteStoredProcedure(storedprocedure, parameters);
            return ds;
        }
        catch (Exception Ex)
        {
            logfile.ErrorFormat(Ex.Message);
            return null;
        }
    }

    #endregion

    #region SEND_RECOVEY_STATEMENT_MAIL
    public static bool SEND_RECOVEY_STATEMENT_MAIL(int RSID, string TYPE)
    {
        try
        {
            string SMTP_SERVER = ConfigurationManager.AppSettings["MailServer"];
            string FROM_MAIL = ConfigurationManager.AppSettings["From"];
            string SENDER_MAIL = ConfigurationManager.AppSettings["AuthUser"];
            string SENDER_MAIL_PASSWORD = ConfigurationManager.AppSettings["AuthPass"];
            string MAIL_AUTHENTICATION = ConfigurationManager.AppSettings["MailAuthentication"];
            string MAIL_BODY = "";
            if (TYPE == "NEW")
            {
                MAIL_BODY = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'><head><title></title></head><body><div>Dear Sir/Madam,</div><div>Bank billing details are created successfully and please find the below details.</div><br><div><table dir='ltr' style='color: #2B82AD; border: 1px solid #1793d1; border-collapse: collapse; padding-left: 50px'><tr><td style='color: #FFFFFF; font-weight: bold; width: 50px; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>S.No.</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>Details</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>DATE : #DATE#</td></tr><tbody><tr><td>1</td><td>Account Number</td><td>:&nbsp;#ACCOUNTNUMBER#</td></tr><tr><td>2</td><td>Bank</td><td>:&nbsp;#BANK#</td></tr><tr><td>3</td><td>Branch</td><td>:&nbsp;#BRANCH#</td></tr><tr><td>4</td><td>Bill Amount</td><td>:&nbsp;#BILL_AMOUNT#</td></tr><tr><td>4</td><td>Previous Bill Amount Received</td><td>:&nbsp;#PREVIOUS_BILL_AMOUNT_RECEIVED#</td></tr><tr><td>5</td><td>Bill Amount Received</td><td>:&nbsp;#BILL_AMOUNT_RECEIVED#</td></tr><tr><td>6</td><td>Amount Less Paid</td><td>:&nbsp;#AMOUNT_LESS_PAID#</td></tr><tr><td>7</td><td>TDS</td><td>:&nbsp;#TDS#</td></tr><tr><td>8</td><td>Bill Due</td><td>:&nbsp;#BILL_DUE#</td></tr><tr><td>9</td><td>Recovered Date</td><td>:&nbsp;#RECOVERED_DATE#</td></tr></tbody></table></div><br><br><div style='text-decoration: underline'>Thanks & Regards</div><div style='color: #4cae4c; font-weight: bold'>Kommineni Consultants Pvt. Ltd.</div><div>Customer Recovery.</div><br /><br /><div><span style='color: red'>Note: </span>This is auto generated mail, Please do not reply to this mail</div></body></html>";
            }
            if (TYPE == "UPDATE")
            {
                MAIL_BODY = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'><head><title></title></head><body><div>Dear Sir/Madam,</div><div>Bank billing details are updated successfully and Please find the below mentioned details.</div><br><div><table dir='ltr' style='color: #2B82AD; border: 1px solid #1793d1; border-collapse: collapse; padding-left: 50px'><tr><td style='color: #FFFFFF; font-weight: bold; width: 50px; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>S.No.</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>Details</td><td style='color: #FFFFFF; font-weight: bold; padding: 5px; border: 1px solid #1793d1; background-color: #1793d1'>DATE : #DATE#</td></tr><tbody><tr><td>1</td><td>Account Number</td><td>:&nbsp;#ACCOUNTNUMBER#</td></tr><tr><td>2</td><td>Bank</td><td>:&nbsp;#BANK#</td></tr><tr><td>3</td><td>Branch</td><td>:&nbsp;#BRANCH#</td></tr><tr><td>4</td><td>Bill Amount</td><td>:&nbsp;#BILL_AMOUNT#</td></tr><tr><td>4</td><td>Previous Bill Amount Received</td><td>:&nbsp;#PREVIOUS_BILL_AMOUNT_RECEIVED#</td></tr><tr><td>5</td><td>Bill Amount Received</td><td>:&nbsp;#BILL_AMOUNT_RECEIVED#</td></tr><tr><td>6</td><td>Amount Less Paid</td><td>:&nbsp;#AMOUNT_LESS_PAID#</td></tr><tr><td>7</td><td>TDS</td><td>:&nbsp;#TDS#</td></tr><tr><td>8</td><td>Bill Due</td><td>:&nbsp;#BILL_DUE#</td></tr><tr><td>9</td><td>Recovered Date</td><td>:&nbsp;#RECOVERED_DATE#</td></tr></tbody></table></div><br><br><div style='text-decoration: underline'>Thanks & Regards</div><div style='color: #4cae4c; font-weight: bold'>Kommineni Consultants Pvt. Ltd.</div><div>Customer Recovery.</div><br /><br /><div><span style='color: red'>Note: </span>This is auto generated mail, Please do not reply to this mail</div></body></html>";
            }
            DataRowCollection DDR = RECOVERY_STATEMENT_GET_FOR_MAIL(RSID).Rows;
            foreach (DataRow DR in DDR)
            {
                MAIL_BODY = MAIL_BODY.Replace("#DATE#", DateTime.Now.ToString("dd-MM-yyyy"));
                MAIL_BODY = MAIL_BODY.Replace("#ACCOUNTNUMBER#", DR["ACCOUNTNUMBER"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BANK#", DR["BANK"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BRANCH#", DR["BRANCH"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BILL_AMOUNT#", DR["BILL_AMOUNT"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#PREVIOUS_BILL_AMOUNT_RECEIVED#", (Convert.ToDecimal(DR["PREVIOUS_BILL_AMOUNT_RECEIVED"]) - Convert.ToDecimal(DR["BILL_AMOUNT_RECEIVED"])).ToString(CultureInfo.InvariantCulture));
                MAIL_BODY = MAIL_BODY.Replace("#BILL_AMOUNT_RECEIVED#", DR["BILL_AMOUNT_RECEIVED"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#AMOUNT_LESS_PAID#", DR["AMOUNT_LESS_PAID"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#TDS#", DR["TDS"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#BILL_DUE#", DR["BILL_DUE"].ToString());
                MAIL_BODY = MAIL_BODY.Replace("#RECOVERED_DATE#", DR["RECOVERED_DATE"].ToString());
            }
            SmtpClient SMTP_CLIENT = new SmtpClient();
            NetworkCredential BASIC_CREDENTIAL = new NetworkCredential(SENDER_MAIL, SENDER_MAIL_PASSWORD);
            MailMessage MESSAGE = new MailMessage();
            MailAddress FROM_MAIL_ADDRESS = new MailAddress(FROM_MAIL, "Kommineni");

            SMTP_CLIENT.Host = SMTP_SERVER;
            if (MAIL_AUTHENTICATION == "True")
            {
                SMTP_CLIENT.UseDefaultCredentials = false;
                SMTP_CLIENT.Credentials = BASIC_CREDENTIAL;
            }
            else
            {
                SMTP_CLIENT.UseDefaultCredentials = true;
            }
            DataTable MDT = EMAILs(Convert.ToInt32(DDR[0]["NPAID"]));
            MESSAGE.From = FROM_MAIL_ADDRESS;
            if (TYPE == "NEW")
            {
                MESSAGE.Subject = "Creation of Bank billing details  (" + MDT.Rows[0][1] + ")";
            }
            if (TYPE == "UPDATE")
            {
                MESSAGE.Subject = "Updation of Bank billing details  (" + MDT.Rows[0][1] + ")";
            }
            //Set IsBodyHtml to true means you can send HTML email. 
            MESSAGE.IsBodyHtml = true;
            MESSAGE.Body = MAIL_BODY;// string.Format("You have requested the Verification Code from our site.{0} Here is the Verification Code : {1}", Environment.NewLine, password);
            string[] MailsList = MDT.Rows[0][0].ToString().Split(',');
            for (int MailC = 0; MailC < MailsList.Length; MailC++)
            {
                MESSAGE.To.Add(MailsList[MailC]);
            }

            try
            {
                SMTP_CLIENT.Send(MESSAGE);
                return true;
            }
            catch (Exception Ex)
            {
                logfile.ErrorFormat(Ex.Message);
                return false;
            }
        }
        catch (Exception Ex)
        {

            logfile.ErrorFormat(Ex.Message);
            return false;
        }
    }
    #endregion

    #endregion

    #endregion

    #region ERROR_MAIL
    public static void ERROR_MAIL_CR(Exception ERRORCONTENT)
    {
        foreach (var Mail in ConfigurationManager.AppSettings["ErrorReceiverMails"].Split(','))
        {
            if (!string.IsNullOrEmpty(Mail))
            {
                StackTrace stackTrace = new StackTrace();
                string MName = stackTrace.GetFrame(1).GetMethod().Name.Replace("<", "").Split('>')[0];
                logfile.ErrorFormat(ERRORCONTENT.Message + "found in method" + MName);
                string SMTP_SERVER = ConfigurationManager.AppSettings["MailServer"];
                string FROM_MAIL = ConfigurationManager.AppSettings["From"];
                string SENDER_MAIL = ConfigurationManager.AppSettings["AuthUser"];
                string SENDER_MAIL_PASSWORD = ConfigurationManager.AppSettings["AuthPass"];
                string MAIL_AUTHENTICATION = ConfigurationManager.AppSettings["MailAuthentication"];
                SmtpClient SMTP_CLIENT = new SmtpClient();
                NetworkCredential BASIC_CREDENTIAL = new NetworkCredential(SENDER_MAIL, SENDER_MAIL_PASSWORD);
                MailMessage MESSAGE = new MailMessage();
                MailAddress FROM_MAIL_ADDRESS = new MailAddress(FROM_MAIL, "CR Error Details");

                SMTP_CLIENT.Host = SMTP_SERVER;
                if (MAIL_AUTHENTICATION == "True")
                {
                    SMTP_CLIENT.UseDefaultCredentials = false;
                    SMTP_CLIENT.Credentials = BASIC_CREDENTIAL;
                }
                else
                {
                    SMTP_CLIENT.UseDefaultCredentials = true;
                }
                MESSAGE.From = FROM_MAIL_ADDRESS;
                MESSAGE.Subject = "ERROR IN CUSTOMER RECOVERY";
                //Set IsBodyHtml to true means you can send HTML email. 
                MESSAGE.IsBodyHtml = false;
                MESSAGE.Body =
                    string.Format(
                        "Dear Developer, \n\n    Error found in Customer Recovery Application. Please find below Details, \n        Method Name: " +
                        MName + "." + "\n        Error Message : " + ERRORCONTENT.Message +
                        "\n\nThanks & Regards,\nAtharvana Pvt LTD.");
                MESSAGE.To.Add(Mail);
                try
                {
                    SMTP_CLIENT.Send(MESSAGE);
                }
                catch (Exception)
                {
                    // ignored
                }
            }

        }
    }
    #endregion
}

public class Footer : PdfPageEventHelper
{
    public override void OnEndPage(PdfWriter writer, Document doc)
    {
        var table3 = new PdfPTable(6)
        {
            WidthPercentage = 100,
            TotalWidth = 600
        };

        var phrase2 = new Phrase
        {
            new Phrase("  Thanking you\n \n \n  Yours faithfully",
                FontFactory.GetFont("Times", 11, Font.NORMAL, new Color(0, 0, 0)))
        };
        PdfPCell thaF = new PdfPCell(phrase2)
        {
            BorderColor = Color.WHITE,
            Colspan = 6,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table3.AddCell(thaF);

        var phrase3 = new Phrase
        {
            new Phrase("  M/s. Kommineni Consultants Pvt. Ltd.",
                FontFactory.GetFont("Times", 12, Font.BOLDITALIC, new Color(44, 156, 48)))
        };
        PdfPCell nameCell = new PdfPCell(phrase3)
        {
            BorderColor = Color.WHITE,
            Colspan = 6,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table3.AddCell(nameCell);

        phrase3 = new Phrase
        {
            new Phrase("\n\n\n  Authorized Signatory", FontFactory.GetFont("Arial", 11, Font.NORMAL, new Color(0, 0, 0)))
        };
        PdfPCell auth = new PdfPCell(phrase3)
        {
            BorderColor = Color.WHITE,
            PaddingBottom = 0,
            Colspan = 6,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table3.AddCell(auth);
        table3.WriteSelectedRows(0, -1, 0, 200, writer.DirectContent);

        var table4 = new PdfPTable(6)
        {
            WidthPercentage = 100,
            TotalWidth = 600
        };

        var phrase4 = new Phrase
        {
            new Phrase("  Regd. Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address1 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address1);

        phrase4 = new Phrase();
        phrase4.Add(new Phrase(":Flat No. 413, Annapurna Block, Aditya Enclave, Ameerpet, Hyderabad-500 038.", FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0))));
        PdfPCell address2 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address2);

        phrase4 = new Phrase
        {
            new Phrase("  Vizag Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address3 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address3);

        phrase4 = new Phrase
        {
            new Phrase(":Flat No.1 02, Govinda Mansions, Dwaraka Nagar, 5th lane, Vizag - 530 016 Cell: 98495 64944",
                FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0)))
        };
        PdfPCell address4 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address4);

        phrase4 = new Phrase
        {
            new Phrase("  Vijayawada Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address5 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address5);

        phrase4 = new Phrase
        {
            new Phrase(
                ":D.No. 39-2-52, Flat No. 303, Sai kanthi Residency, Pitchaiah Street, Labbipet, Vijayawada - 520 010. Ph : 98490 82257",
                FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0)))
        };
        PdfPCell address6 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address6);

        phrase4 = new Phrase
        {
            new Phrase("  Guntur Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address7 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address7);

        phrase4 = new Phrase
        {
            new Phrase(
                ":Door No. 4-7-13, Flat No. 205, Kommineni Estates, Near Gandhi Statue, Koritipadu, Guntur-522 007. Ph: 98490 82257",
                FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0)))
        };
        PdfPCell address8 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address8);

        phrase4 = new Phrase
        {
            new Phrase("  Chennai Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address9 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address9);

        phrase4 = new Phrase
        {
            new Phrase(
                ":No-9.Cedar Wood Apartments, Fiat No. 1A, Ground Floor, IV th Main, R.A. Puram, Behind Sangeetha Hotel, \n Near Billorth Hospital,  Chennai - 600028 Ph : 0956600069",
                FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0)))
        };
        PdfPCell address10 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address10);

        phrase4 = new Phrase
        {
            new Phrase("  Bangalore Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address11 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address11);

        phrase4 = new Phrase
        {
            new Phrase(
                ":Flat No. 1011, 1st floor, High Point-1, 45, Palace Road, Bangalore - 560001 Cell: 085530 30253",
                FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0)))
        };
        PdfPCell address12 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address12);
        table4.WriteSelectedRows(0, -1, 0, 80, writer.DirectContent);

        var logoTale = new PdfPTable(1)
        {
            WidthPercentage = 100,
            TotalWidth = 600
        };

        //Company Logo
        Image image = Image.GetInstance(HttpContext.Current.Server.MapPath("~/APPRequires/Images/CR.png"));
        image.ScalePercent(80f);
        PdfPCell imageCel = new PdfPCell(image)
        {
            BorderWidth = 0,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_RIGHT,
            PaddingTop = 7f,
            PaddingBottom = 1f
        };
        logoTale.AddCell(imageCel);
        logoTale.WriteSelectedRows(0, -1, 0, 830, writer.DirectContent);
    }
}

public class RecoveryFooter : PdfPageEventHelper
{
    public override void OnEndPage(PdfWriter writer, Document doc)
    {
        var table4 = new PdfPTable(6)
        {
            WidthPercentage = 100,
            TotalWidth = 600
        };

        var phrase4 = new Phrase
        {
            new Phrase("  Regd. Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address1 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address1);

        phrase4 = new Phrase
        {
            new Phrase(":Flat No. 413, Annapurna Block, Aditya Enclave, Ameerpet, Hyderabad-500 038.",
                FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0)))
        };
        PdfPCell address2 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address2);

        phrase4 = new Phrase
        {
            new Phrase("  Vizag Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address3 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address3);

        phrase4 = new Phrase
        {
            new Phrase(":Flat No.1 02, Govinda Mansions, Dwaraka Nagar, 5th lane, Vizag - 530 016 Cell: 98495 64944",FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0)))
        };
        PdfPCell address4 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address4);

        phrase4 = new Phrase
        {
            new Phrase("  Vijayawada Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address5 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address5);

        phrase4 = new Phrase
        {
            new Phrase(
                ":D.No. 39-2-52, Flat No. 303, Sai kanthi Residency, Pitchaiah Street, Labbipet, Vijayawada - 520 010. Ph : 98490 82257",
                FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0)))
        };
        PdfPCell address6 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address6);

        phrase4 = new Phrase
        {
            new Phrase("  Guntur Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address7 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address7);

        phrase4 = new Phrase
        {
            new Phrase(":Door No. 4-7-13, Flat No. 205, Kommineni Estates, Near Gandhi Statue, Koritipadu, Guntur-522 007. Ph: 98490 82257",FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0)))
        };
        PdfPCell address8 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address8);

        phrase4 = new Phrase
        {
            new Phrase("  Chennai Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address9 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address9);

        phrase4 = new Phrase();
        phrase4.Add(new Phrase(":No-9.Cedar Wood Apartments, Fiat No. 1A, Ground Floor, IV th Main, R.A. Puram, Behind Sangeetha Hotel, \n Near Billorth Hospital,  Chennai - 600028 Ph : 0956600069", FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0))));
        PdfPCell address10 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address10);

        phrase4 = new Phrase
        {
            new Phrase("  Bangalore Office", FontFactory.GetFont("Arial", 8, Font.BOLD, new Color(0, 0, 0)))
        };
        PdfPCell address11 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 1,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address11);

        phrase4 = new Phrase();
        phrase4.Add(new Phrase(":Flat No. 1011, 1st floor, High Point-1, 45, Palace Road, Bangalore - 560001 Cell: 085530 30253", FontFactory.GetFont("Arial", 8, Font.NORMAL, new Color(0, 0, 0))));
        PdfPCell address12 = new PdfPCell(phrase4)
        {
            BorderColor = Color.WHITE,
            PaddingTop = 0,
            Colspan = 5,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_LEFT
        };
        table4.AddCell(address12);
        table4.WriteSelectedRows(0, -1, 0, 80, writer.DirectContent);

        var logoTale = new PdfPTable(1)
        {
            WidthPercentage = 100,
            TotalWidth = 600
        };

        //Company Logo
        Image image = Image.GetInstance(HttpContext.Current.Server.MapPath("~/APPRequires/Images/CR.png"));
        image.ScalePercent(80f);
        PdfPCell imageCel = new PdfPCell(image)
        {
            BorderWidth = 0,
            VerticalAlignment = Element.ALIGN_CENTER,
            HorizontalAlignment = Element.ALIGN_RIGHT,
            PaddingTop = 7f,
            PaddingBottom = 1f
        };
        logoTale.AddCell(imageCel);
        logoTale.WriteSelectedRows(0, -1, 0, 830, writer.DirectContent);
    }
}