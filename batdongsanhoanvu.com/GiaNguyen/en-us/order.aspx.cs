using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using GiaNguyen.Components;
using System.Drawing;
using CatTrang.Components;

namespace CatTrang.en_us
{
    public partial class order : System.Web.UI.Page
    {
        int _Catid = 0;
        List_product list_pro = new List_product();
        private SendMail1 sm1 = new SendMail1();
        Booking_result booking = new Booking_result();
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            LoadProject();
        }
        private void LoadProject()
        {
            //var list = list_pro.Load_listpro(_Catid);
            var list = list_pro.Load_listprobytype(1, Cost.EN);
            ddlProjects.DataSource = list;
            ddlProjects.DataBind();
        }
        protected void Lbthanhtoan_Click(object sender, EventArgs e)
        {
            if (this.txtCapcha.Value != this.Session["CaptchaImageText"].ToString())
            {
                lblresult.ForeColor = Color.Red;
                lblresult.Text = "Security code is not correct.";
                return;
            }
            string strEmailBody = "";
            strEmailBody += "<html><body>";
            strEmailBody += "ORDER INFORMATION PROJECT <br />";
            strEmailBody += " - PROJECT: " + ddlProjects.SelectedItem.Text + "<br />";
            strEmailBody += " - Fullname: " + txtFullname.Value + "<br />";
            strEmailBody += " - Phone: " + txtPhone.Value + "<br />";
            strEmailBody += " - Email: " + txtEmail.Value + "<br />";
            strEmailBody += " - Company: " + txtCompanyname.Value + "<br />";
            strEmailBody += " - Address: " + txtAddress.Value + "<br />";
            //strEmailBody += "<a href='" + Request.ServerVariables["HTTP_REFERER"] + "'>" + Request.ServerVariables["HTTP_REFERER"] + "</a>";
            strEmailBody += "</body></html>";
            //string _sEmailTo = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_TO : "";
            sm1.SendMailAll(txtEmail.Value, "", "Notice: You have put the project success", strEmailBody, "Hoanvu");

            booking.Add_booking2(Utils.CIntDef(ddlProjects.SelectedItem.Value),txtFullname.Value,txtPhone.Value,txtEmail.Value,txtContent.Value,txtCompanyname.Value,txtAddress.Value);

            string strScript = "<script>";
            strScript += "alert(' You have put the project success!');";
            strScript += "window.location='/home.html';";
            strScript += "</script>";
            Page.RegisterClientScriptBlock("strScript", strScript); 

        }
    }
}