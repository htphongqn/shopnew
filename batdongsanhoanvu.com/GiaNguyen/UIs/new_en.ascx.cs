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
    public partial class new_en : System.Web.UI.UserControl
    {
        public clsFormat _clsFormat = new clsFormat();
        News_details ndetail = new News_details();
        Product_Details pro_detail = new Product_Details();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        string _sNews_Seo_Url = string.Empty;
        SendMail send = new SendMail();
        List_product list_pro = new List_product();
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            gettitle();
            Show_File_HTML();
            Get_ViewMore();
            Tinkhac();
        }
        //public void Loaddetails()
        //{
        //    try
        //    {
        //        var list = pro_detail.Load_Product_Detail(_sNews_Seo_Url);
        //        if (list != null && list.Count > 0)
        //        {
        //            lbNewsTitle.Text = list[0].NEWS_TITLE;
                    
        //        }

        //    }
        //    catch (Exception ex)
        //    {

        //        clsVproErrorHandler.HandlerError(ex);
        //    }
        //}
        //private void Show_File_HTML()
        //{
        //    try
        //    {
        //        //string htmExt = "-vi.htm";
        //        //if (lang == 1)
        //        //{
        //        //    htmExt = "-vi.htm";
        //        //}
        //        //else if (lang == 2)
        //        //{
        //        //    htmExt = "-en.htm";
        //        //}
        //        //else if (lang == 3)
        //        //{
        //        //    htmExt = "-ru.htm";
        //        //}
        //        //else if (lang == 4)
        //        //{
        //        //    htmExt = "-ch.htm";
        //        //}
        //        int _Catid = Utils.CIntDef(Session["Cat_id"]);
        //        var list = list_pro.Load_listpro(_Catid);
        //        if (list != null && list.Count > 0)
        //        {
        //            liHtml.Text = pro_detail.Show_File_HTML(list[0].NEWS_ID, "-en.htm");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        clsVproErrorHandler.HandlerError(ex);
        //    }
        //}
        public void gettitle()
        {
            try
            {
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                lbNewsTitle.Text = ndetail.gettitle(_sCat_Seo_Url, _sNews_Seo_Url).Count > 0 ? ndetail.gettitle(_sCat_Seo_Url, _sNews_Seo_Url)[0].News_title : "";
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void Show_File_HTML()
        {
            try
            {
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                if (!string.IsNullOrEmpty(_sCat_Seo_Url))
                {
                    _sNews_Seo_Url = ndetail.Get_News_seo_url(_sCat_Seo_Url);
                }
                liHtml.Text = ndetail.Showfilehtm(_sCat_Seo_Url, _sNews_Seo_Url, "-en.htm");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public string GetImageT(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News_Hasclass(News_Id, News_Image1, "");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public void Tinkhac()
        {
            try
            {
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                if (!string.IsNullOrEmpty(_sCat_Seo_Url))
                {
                    _sNews_Seo_Url = ndetail.Get_News_seo_url(_sCat_Seo_Url);
                }
                if (_sNews_Seo_Url != "")
                {
                    var _tinTucKhac = ndetail.Load_othernews(_sNews_Seo_Url);
                    if (_tinTucKhac.ToList().Count > 0)
                    {
                        Rptinkhac.DataSource = _tinTucKhac;
                        Rptinkhac.DataBind();
                    }
                    else
                        dvOtherNews.Visible = false;
                }
                else dvOtherNews.Visible = false;
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void Get_ViewMore()
        {
            try
            {
                int _newsID = Utils.CIntDef(Session["news_id"]);
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                if (!string.IsNullOrEmpty(_sCat_Seo_Url))
                {
                    _newsID = ndetail.Get_NewsID(_sCat_Seo_Url);
                }
                hplViewmore.HRef = ndetail.Get_ViewMore(_newsID);
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
        public string getDate(object News_PublishDate)
        {
            return fun.getDate(News_PublishDate);
        }
    }
}