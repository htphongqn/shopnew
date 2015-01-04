using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using GiaNguyen.Components;
using Controller;

namespace CatTrang.UIs
{
    public partial class hotel_vi : System.Web.UI.UserControl
    {
        public clsFormat _clsFormat = new clsFormat();
        News_details ndetail = new News_details();
        Product_Details pro_detail = new Product_Details();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        string _sNews_Seo_Url = string.Empty;
        SendMail send = new SendMail();
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            ListHotelOther();
            Loaddetails();
        }
        public void Loaddetails()
        {
            try
            {
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                if (!string.IsNullOrEmpty(_sCat_Seo_Url))
                {
                    _sNews_Seo_Url = ndetail.Get_News_seo_url(_sCat_Seo_Url);
                }
                var list = pro_detail.Load_Product_Detail(_sNews_Seo_Url);
                if (list != null && list.Count > 0)
                {
                    lbNewsTitle.Text = list[0].NEWS_TITLE;
                    lbAddress.Text = list[0].ADDRESS;
                    lbHotline.Text = list[0].PHONE;
                    lbEmail.Text = list[0].EMAIL;
                    lbPrice.Text = fm.FormatMoneyNoVND(list[0].NEWS_PRICE1);
                    int id = list[0].NEWS_ID;
                    var listAlbum = pro_detail.Load_albumimg(id).ToList();
                    rptImages.DataSource = listAlbum;
                    rptImages.DataBind();
                    Show_File_HTML();
                }

            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void Show_File_HTML()
        {
            try
            {
                int _newsID = Utils.CIntDef(Session["news_id"]);
                string htmExt = "-vi.htm";
                string tongquankhachsan = "tongquankhachsan" + htmExt;
                string cosovatchat = "cosovatchat" + htmExt;
                string bando = "bando" + htmExt;
                string khuyenmai = "khuyenmai" + htmExt;
                string gia = "gia" + htmExt;

                HtmlTongquan.Text = pro_detail.Show_File_HTML_ByName(_newsID, tongquankhachsan);
                HtmlKhuyenmai.Text = pro_detail.Show_File_HTML_ByName(_newsID, khuyenmai);
                HtmlGia.Text = pro_detail.Show_File_HTML_ByName(_newsID, gia);
                HtmlCosovatchat.Text = pro_detail.Show_File_HTML_ByName(_newsID, cosovatchat);
                HtmlBando.Text = pro_detail.Show_File_HTML_ByName(_newsID, bando);

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
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

        public void ListHotelOther()
        {
            try
            {
                if (_sNews_Seo_Url != "")
                {
                    var _tinTucKhac = ndetail.Load_othernews(_sNews_Seo_Url);
                    if (_tinTucKhac.ToList().Count > 0)
                    {
                        rptListHotelOther.DataSource = _tinTucKhac;
                        rptListHotelOther.DataBind();
                    }
                    else
                        rptListHotelOther.Visible = false;
                }
                else rptListHotelOther.Visible = false;
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }

    }
}