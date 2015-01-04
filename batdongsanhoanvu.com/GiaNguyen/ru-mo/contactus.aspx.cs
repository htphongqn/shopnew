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

namespace CatTrang.ru_mo
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
                Show_File_HTML("contact-ru.htm");
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
                    lblresult.Text = "Код введен неверно.";
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
                    _mailBody += "<br/><br/><strong>Имя клиента</strong>: " + _sName;
                    _mailBody += "<br/><br/><strong>Email</strong>: " + _sEmail;
                    _mailBody += "<br/><br/><strong>Номер Телефона</strong>: " + _phone;
                    _mailBody += "<br/><br/><strong>адрес</strong>: " + _add;
                    //_mailBody += "<br/><br/><strong>Tiêu đề</strong>: " + _title;
                    _mailBody += "<br/><br/><strong>содержание</strong>: " + _content + "<br/><br/>";
                    string _sMailBody = string.Empty;
                    _sMailBody += "Спасибо: " + _sName + " был поставлен на свяжитесь с нами. Это письмо было отправлено с сайта " + System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"] + " <br>" + _mailBody;
                    _sEmailCC = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_TO : "";
                    sm.SendEmailSMTP("Примечание: Вы связались с успехом", _sEmail, _sEmailCC, "", _sMailBody, true, false);
                    string strScript = "<script>";
                    strScript += "alert(' Вы связались с успехом!');";
                    strScript += "window.location='/домой.html';";
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