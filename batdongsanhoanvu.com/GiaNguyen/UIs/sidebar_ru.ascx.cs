using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using Model;
using vpro.functions;
using GiaNguyen.Components;
using CatTrang.Components;

namespace CatTrang.UIs
{
    public partial class sidebar_ru : System.Web.UI.UserControl
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        Propertity per = new Propertity();
        Function fun = new Function();
        private Config cf = new Config();
        private SendMail1 sm1 = new SendMail1();
        Booking_result booking = new Booking_result();
        List_product list_pro = new List_product();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Loadlist();
            }
        }
        public void Loadlist()
        {
            try
            {
                var list = list_pro.Load_listprobyPeriod(2, Cost.RU);
                if (list.Count > 0)
                {
                    rptListHotelPromotion.DataSource = list.Take(10);
                    rptListHotelPromotion.DataBind();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetImageT(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News(News_Id, News_Image1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetShortName(object obj, int lenght)
        {
            string strObj = Utils.CStrDef(obj);
            if (strObj.Length >= lenght)
            {
                return strObj.Substring(0, lenght - 3) + "...";
            }
            return strObj;
        }
        //public void LoadSlider()
        //{
        //    try
        //    {
        //        var list = per.Load_slider1(1, 30, 3).ToList();
        //        if (list.Count > 0)
        //        {
        //            rptBox.DataSource = list;
        //            rptBox.DataBind();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        clsVproErrorHandler.HandlerError(ex);
        //    }
        //}
        //public string GetImageBox(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url)
        //{
        //    try
        //    {
        //        string temp;
        //        temp = fun.GetImageAd(Ad_Id, Ad_Image1, Ad_Target, Ad_Url);
        //        return temp;
        //    }
        //    catch (Exception ex)
        //    {
        //        clsVproErrorHandler.HandlerError(ex);
        //        return null;
        //    }

        //}

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtname_hotel.Value.Length  == 0)
            {
                string strScript = "<script>";
                strScript += "alert(' Пожалуйста, введите название отеля');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
                return;
            }
            if (txtflights_checkin.Value.Length == 0 || txtflights_checkin.Value.Length == 0)
            {
                string strScript = "<script>";
                strScript += "alert(' Пожалуйста, выберите дату и день');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
                return;
            }
            if (txtfullname.Value.Length == 0)
            {
                string strScript = "<script>";
                strScript += "alert(' Пожалуйста, введите имя');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
                return;
            }
            if (txtphonenumber.Value.Length == 0)
            {
                string strScript = "<script>";
                strScript += "alert(' Пожалуйста, введите номер телефона');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
                return;
            }
                string strEmailBody = "";
                strEmailBody += "<html><body>";
                strEmailBody += "Информация о бронировании<br />";
                strEmailBody += " - дней осталось: " + txtflights_checkin.Value + "<br />";
                strEmailBody += " - На: " + txtflights_checkout.Value + "<br />";
                strEmailBody += " - комната: " + ddlHotelClass.SelectedItem.Text + "<br />";
                strEmailBody += " - для взрослых: " + ddlCusM.SelectedItem.Text + "<br />";
                strEmailBody += " - ребенок: " + ddlCusS.SelectedItem.Text + "<br />";

                strEmailBody += "КОНТАКТЫ <br />";
                strEmailBody += " - Они называют: " + txtfullname.Value + "<br />";
                strEmailBody += " - телефон: " + txtphonenumber.Value + "<br />";
                strEmailBody += " - Email: " + txtemail.Value + "<br />";
                //strEmailBody += "<a href='" + Request.ServerVariables["HTTP_REFERER"] + "'>" + Request.ServerVariables["HTTP_REFERER"] + "</a>";
                strEmailBody += "</body></html>";
                //string _sEmailTo = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_TO : "";

                sm1.SendMailAll(txtemail.Value, "", "Обратите внимание : Вы успешно заказали", strEmailBody, "Hoanvu");

                DateTime checkin = DateTime.ParseExact(txtflights_checkin.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                DateTime checkout = DateTime.ParseExact(txtflights_checkout.Value, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                booking.Add_booking(txtname_hotel.Value, checkin, checkout, Utils.CIntDef(ddlHotelClass.SelectedItem.Value), Utils.CIntDef(ddlCusM.SelectedItem.Value), Utils.CIntDef(ddlCusS.SelectedItem.Value)
                       , txtfullname.Value, txtphonenumber.Value, txtemail.Value);

                string str = "<script>";
                str += "alert(' Бронирование успех!');";
                str += "window.location='/домой.html';";
                str += "</script>";
                Page.RegisterClientScriptBlock("strScript", str);            
        }
        
        
    }
}