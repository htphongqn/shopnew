using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Controller;
using GiaNguyen.Components;
using System.Web.UI.HtmlControls;
using System.IO;
using vpro.functions;

namespace CatTrang.en_us
{
    public partial class contactus : System.Web.UI.Page
    {
        #region Declare
        Config cf = new Config();
        SendMail sm = new SendMail();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Show_File_HTML("contact-en.htm");
            }
        }
        private void Show_File_HTML(string HtmlFile)
        {
            string pathFile;
            string strHTMLContent;
            pathFile = Server.MapPath("../Data/contact/" + HtmlFile);

            if ((File.Exists(pathFile)))
            {
                StreamReader objNewsReader;
                objNewsReader = new StreamReader(pathFile);
                strHTMLContent = objNewsReader.ReadToEnd();
                objNewsReader.Close();

                Literal1.Text = strHTMLContent;
            }
            else
                Literal1.Text = "";

        }


        protected void Lbthanhtoan_Click(object sender, EventArgs e)
        {
            try
            {

                if (this.txtCapcha.Value != this.Session["CaptchaImageText"].ToString())
                {
                    lblresult.Text = "Security code is not correct.";
                    //mp1.Show();
                }
                else
                {

                    string _sEmailCC = string.Empty;
                    string _sEmail = txtEmail.Value;
                    string _sName = Txtname.Value;
                    string _add = Txtaddress.Value;
                    string _phone = Txtphone.Value;
                    string _content = txtContent.Value;
                    //string _title = txttitle.Value;
                    cf.Insert_contact(_sName, _sEmail, "", _content, _add, _phone);
                    string _mailBody = string.Empty;
                    _mailBody += "<br/><br/><strong>Customer Name</strong>: " + _sName;
                    _mailBody += "<br/><br/><strong>Email</strong>: " + _sEmail;
                    _mailBody += "<br/><br/><strong>Phone</strong>: " + _phone;
                    _mailBody += "<br/><br/><strong>Address</strong>: " + _add;
                    //_mailBody += "<br/><br/><strong>Tiêu đề</strong>: " + _title;
                    _mailBody += "<br/><br/><strong>Note</strong>: " + _content + "<br/><br/>";
                    string _sMailBody = string.Empty;
                    _sMailBody += "Thank you: " + _sName + " was put to contact us. This email was sent from website " + System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"] + " <br>" + _mailBody;
                    _sEmailCC = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_TO : "";
                    sm.SendEmailSMTP("Notice: You have contacted success", _sEmail, _sEmailCC, "", _sMailBody, true, false);
                    string strScript = "<script>";
                    strScript += "alert(' You have contacted success!');";
                    strScript += "window.location='/home.html';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}