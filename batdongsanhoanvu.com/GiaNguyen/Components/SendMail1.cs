using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Net.Configuration;
using System.Configuration;
using vpro.functions;
using System.Text;

namespace GiaNguyen.Components
{
    public class SendMail1
    {
        private SmtpClient MailClient = new SmtpClient();        

        //public void SendEmail(string strSubject, string toAddress, string ccAddress, string bccAddress, string body, bool isHtml, bool isSSL)
        //{
        //    try
        //    {
        //        using (MailMessage mail = new MailMessage())
        //        {
        //            mail.From = new MailAddress(FormAddress, System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"]);
        //            mail.To.Add(toAddress);
        //            if (ccAddress != "")
        //            {
        //                mail.CC.Add(ccAddress);
        //            }
        //            if (bccAddress != "")
        //            {
        //                mail.Bcc.Add(bccAddress);
        //            }
        //            mail.Subject = strSubject;

        //            string str = "<html>" + body + "</html>";
        //            mail.Body = str;
        //            mail.IsBodyHtml = isHtml;
        //            SmtpClient client = new SmtpClient();
        //            client.EnableSsl = isSSL;
        //            client.Send(mail);
        //        }
        //    }
        //    catch (SmtpException ex)
        //    {
        //        clsVproErrorHandler.HandlerError(ex);
        //    }
        //}

        //public void SendEmailSMTP(string strSubject, string toAddress, string ccAddress, string bccAddress, string body, bool isHtml, bool isSSL)
        //{
        //    try
        //    {
        //        using (MailMessage mail = new MailMessage())
        //        {
        //            mail.From = new MailAddress(Utils.CStrDef(System.Configuration.ConfigurationManager.AppSettings["Email"]), Utils.CStrDef(System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"]));
        //            mail.To.Add(toAddress);
        //            if (ccAddress != "")
        //            {
        //                mail.CC.Add(ccAddress);
        //            }
        //            if (bccAddress != "")
        //            {
        //                mail.Bcc.Add(bccAddress);
        //            }
        //            mail.Subject = strSubject;

        //            string str = "<html>" + body + "</html>";
        //            mail.Body = str;
        //            mail.IsBodyHtml = isHtml;
        //            SmtpClient client = new SmtpClient();
        //            client.EnableSsl = isSSL;
        //            client.Host = Utils.CStrDef(System.Configuration.ConfigurationManager.AppSettings["EmailHost"]);
        //            client.Port = Utils.CIntDef(System.Configuration.ConfigurationManager.AppSettings["EmailPort"]);
        //            client.Credentials = new System.Net.NetworkCredential(Utils.CStrDef(System.Configuration.ConfigurationManager.AppSettings["Email"]), Utils.CStrDef(System.Configuration.ConfigurationManager.AppSettings["EmailPassword"]));

        //            client.Send(mail);
        //        }
        //    }
        //    catch (SmtpException ex)
        //    {
        //        clsVproErrorHandler.HandlerError(ex);
        //    }
        //}

        

        internal void SendMail_Active_Account(System.Web.UI.HtmlControls.HtmlInputText txtEmail, string p, string p_2, string p_3)
        {
            throw new NotImplementedException();
        }

        public void SendMailAll(string recipientin, string ccAddress, string subject, string message, string displayname)
        {
            try
            {
                string emailDomain = "bdshoanvu.com";

                MailAddress source = new MailAddress("no-reply@" + emailDomain, displayname);
                MailAddress recipient = new MailAddress(recipientin);

                MailMessage msg = new MailMessage();

                msg.From = source;
                msg.To.Add(recipient);
                if (ccAddress != "")
                {
                    msg.CC.Add(ccAddress);
                }
                //if (bccAddress != "")
                //{
                //    mail.Bcc.Add(bccAddress);
                //}
                msg.Subject = subject;
                msg.Body = message;
                msg.IsBodyHtml = true;

                MailClient.Send(msg);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw ex;
            }
        }

    }
}