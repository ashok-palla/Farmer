using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUserName.Focus();
    }
    protected void ButLogin_Click(object sender, EventArgs e)
    {
        try
        {
            int? userId;
            string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["CustomerRecoveryConnectionString"].ConnectionString;
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(connectionString);
            string name = builder.InitialCatalog;
            CRBusinessLogicLayer.IsValidUser(txtUserName.Text, txtPassword.Text, out userId);
            if (userId == null)
            {
                txtUserName.Text = "";
                txtPassword.Text = "";
                LbError.Text = "Invalid  User Name/Password.";
                LbError.Visible = true;
            }
            else
            {
                var ds = CRBusinessLogicLayer.GetSequerityQuestion((int)userId);
                string SessionuserID = name + "_" + "userid";
                var UserType = ds.Tables[0].Rows[0]["UserRole"].ToString();
                var CityID = ds.Tables[0].Rows[0]["City"].ToString();
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, txtUserName.Text, DateTime.Now, DateTime.Now.AddDays(7), true, String.Format("{0}|{1}|{2}", txtUserName.Text, userId, UserType));
                string hash = FormsAuthentication.Encrypt(ticket);
                FormsAuthentication.SetAuthCookie(txtUserName.Text, true);
                Response.AppendCookie(new HttpCookie(SessionuserID, userId.ToString()));
                Response.AppendCookie(new HttpCookie("UserName", txtUserName.Text));
                Response.AppendCookie(new HttpCookie("UserRole", UserType));
                System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                Byte[] bytes = encoding.GetBytes(txtPassword.Text);
                string pwd = CRBusinessLogicLayer.PassEncrypt(bytes);
                Response.AppendCookie(new HttpCookie("Pass", pwd));
                Response.AppendCookie(new HttpCookie("CityID", CityID));
                Response.AppendCookie(new HttpCookie("USERID", userId.ToString()));
                Response.AppendCookie(new HttpCookie("udata", hash));

                string url = string.Empty;
                ds = CRBusinessLogicLayer.GetUserAccessURL((int)userId);
                if (ds.Tables[0].Rows.Count == 1)
                {
                    url = ds.Tables[0].Rows[0]["ScreenURL"].ToString();
                }
                else if (url == string.Empty)
                {
                    Response.Redirect(
                        Convert.ToInt16(UserType) == 2
                            ? "~/DailyTransactions/NPADetails.aspx"
                            : "~/Masters/Farmer.aspx", false);
                }
                if (url != string.Empty)
                {
                    Response.Redirect(url, false);
                }
            }
        }
        catch (Exception ex)
        {
            LbError.Text = ex.Message;
            LbError.Visible = true;
        }
    }

    #region FORGOT_PASSWORD

    static string VerificationCode = "";

    [WebMethod]
    public static string CheckUserNameAndEmail(string UserName, string EmailID)
    {
        try
        {
            DataTable DS = CRBusinessLogicLayer.ForgorPasswordSendCode(UserName, EmailID);
            if (DS.Rows[0]["USERID"].ToString() != "")
            {
                Login Method = new Login();
                VerificationCode = RandomPasswordGenerator.Generate();
                Method.SendMail(VerificationCode, EmailID);
                return "Please check above Registered Email for verification code";
            }
            return "Please enter valid User Name and Email Id";
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }

    [WebMethod]
    public static string VerificationCodeCheck(string VerificationCodeFromHTML)
    {
        return VerificationCodeFromHTML.Trim() == VerificationCode ? "OK" : null;
    }

    #region  ChangePassword
    [WebMethod]
    public static string UserChangePassword(string UserName, string NewPassword)
    {
        try
        {
            CRBusinessLogicLayer.UpdatePassword(UserName, NewPassword);
            return "Successfully Saved New Password";
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
    #endregion

    #region VerificationCode
    public enum RandomPasswordOptions
    {
        Alpha = 1,
        Numeric = 2,
        AlphaNumeric = Alpha + Numeric,
        AlphaNumericSpecial = 4
    }

    public class RandomPasswordGenerator
    {
        // Define default password length.
        private static int DEFAULT_PASSWORD_LENGTH = 4;

        //No characters that are confusing: i, I, l, L, o, O, 0, 1, u, v

        private static string PASSWORD_CHARS_Alpha = "abcdefghjkmnpqrstwxyzABCDEFGHJKMNPQRSTWXYZ";
        private static string PASSWORD_CHARS_NUMERIC = "0123456789";

        #region Overloads

        /// <SUMMARY>
        /// Generates a random password with the default length.
        /// </SUMMARY>
        /// <RETURNS>Randomly generated password.</RETURNS>
        public static string Generate()
        {
            return Generate(DEFAULT_PASSWORD_LENGTH, RandomPasswordOptions.AlphaNumericSpecial);
        }

        /// <SUMMARY>
        /// Generates a random password.
        /// </SUMMARY>
        /// <RETURNS>Randomly generated password.</RETURNS>
        public static string Generate(int passwordLength, RandomPasswordOptions option)
        {
            return GeneratePassword(passwordLength, option);
        }

        #endregion


        /// <SUMMARY>
        /// Generates the password.
        /// </SUMMARY>
        /// <RETURNS></RETURNS>
        private static string GeneratePassword(int passwordLength, RandomPasswordOptions option)
        {
            if (passwordLength < 0) return null;
            var passwordChars = GetCharacters(option);
            if (string.IsNullOrEmpty(passwordChars)) return null;
            var password = new char[passwordLength];
            var random = GetRandom();
            for (int i = 0; i < passwordLength; i++)
            {
                var index = random.Next(passwordChars.Length);
                var passwordChar = passwordChars[index];
                password[i] = passwordChar;
            }
            return new string(password);
        }



        /// <SUMMARY>
        /// Gets the characters selected by the option
        /// </SUMMARY>
        /// <RETURNS></RETURNS>
        private static string GetCharacters(RandomPasswordOptions option)
        {
            switch (option)
            {
                case RandomPasswordOptions.Alpha:
                    return PASSWORD_CHARS_Alpha;
                case RandomPasswordOptions.Numeric:
                    return PASSWORD_CHARS_NUMERIC;
                case RandomPasswordOptions.AlphaNumeric:
                    return PASSWORD_CHARS_Alpha + PASSWORD_CHARS_NUMERIC;
                case RandomPasswordOptions.AlphaNumericSpecial:
                    return PASSWORD_CHARS_NUMERIC;//PASSWORD_CHARS_Alpha + PASSWORD_CHARS_NUMERIC + PASSWORD_CHARS_SPECIAL;
            }
            return string.Empty;
        }

        /// <SUMMARY>
        /// Gets a random object with a real random seed
        /// </SUMMARY>
        /// <RETURNS></RETURNS>
        private static Random GetRandom()
        {
            // Use a 4-byte array to fill it with random bytes and convert it then
            // to an integer value.
            byte[] randomBytes = new byte[4];

            // Generate 4 random bytes.
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            rng.GetBytes(randomBytes);

            // Convert 4 bytes into a 32-bit integer value.
            int seed = (randomBytes[0] & 0x7f) << 24 |
                        randomBytes[1] << 16 |
                        randomBytes[2] << 8 |
                        randomBytes[3];

            // Now, this is real randomization.
            return new Random(seed);
        }


    }

    public void SendMail(string password, string email)
    {
        string smtpServer = ConfigurationManager.AppSettings["MailServer"];
        string fromMailID = ConfigurationManager.AppSettings["From"];
        string AuthUser = ConfigurationManager.AppSettings["AuthUser"];
        string AuthPass = ConfigurationManager.AppSettings["AuthPass"];
        string MailAuthentication = ConfigurationManager.AppSettings["MailAuthentication"];

        string BodySub = System.IO.File.ReadAllText(Server.MapPath("Templates") + "\\MailTemplate.htm");

        //Signed Form16 for the financial year 2013-14
        //string BodySub = System.IO.File.ReadAllText(path + "InfoMailTemplate.htm");

        BodySub = BodySub.Replace("###CUSTMAIL###", email);
        BodySub = BodySub.Replace("###VERCODE###", password);

        SmtpClient smtpClient = new SmtpClient();
        NetworkCredential basicCredential = new NetworkCredential(AuthUser, AuthPass);
        MailMessage message = new MailMessage();
        MailAddress fromAddress = new MailAddress(fromMailID);

        smtpClient.Host = smtpServer;
        if (MailAuthentication == "True")
        {
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = basicCredential;
        }
        else
        {
            smtpClient.UseDefaultCredentials = true;
        }

        message.From = fromAddress;
        message.Subject = "Verification Code For Customer Recovery";
        //Set IsBodyHtml to true means you can send HTML email. 
        message.IsBodyHtml = true;
        message.Body = BodySub;// string.Format("You have requested the Verification Code from our site.{0} Here is the Verification Code : {1}", Environment.NewLine, password);
        message.To.Add(email);

        try
        {
            smtpClient.Send(message);
        }
        catch (Exception)
        {
            // ignored
        }
    }
    #endregion

    #endregion
}