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
    public partial class news_ch : System.Web.UI.UserControl
    {
        #region Declare
        List_news lnews = new List_news();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Pageindex_chage change = new Pageindex_chage();
        int _Catid = 0;
        string _cat_seo_url = string.Empty;
        int _page = 0;
        int _typecat = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            _cat_seo_url = Request.QueryString["curl"];
            _page = Utils.CIntDef(Request.QueryString["page"]);
            _typecat = Utils.CIntDef(Request.QueryString["typecat"]);
            if (!IsPostBack)
            {
                Loadtitle();
                Loadlist();
            }
        }
        public void Loadtitle()
        {
            try
            {
                lbNewsTitle.Text = lnews.Loadtitle(_cat_seo_url);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Loadlist()
        {
            try
            {
                int sotin = (_typecat == 0 ? lnews.Getsotin(_Catid) : 100);
                var list = lnews.Load_listnews(_Catid);
                if (list.Count > 0)
                {
                    if (_page != 0)
                    {
                        Rplistnews.DataSource = list.Skip(sotin * _page - sotin).Take(sotin);
                        Rplistnews.DataBind();
                    }
                    else
                    {
                        Rplistnews.DataSource = list.Take(sotin);
                        Rplistnews.DataBind();
                    }

                    ltrPage.Text = change.result(list.Count, sotin, _cat_seo_url, 0, _page, 1);

                }

            }
            catch (Exception)
            {

                throw;
            }
        }
        public string GetHtmlItemNews(object NEWS_URL, object NEWS_SEO_URL, object CAT_SEO_URL, object NEWS_ID, object NEWS_IMAGE3, object NEWS_TITLE, object NEWS_DESC)
        {
            string str = "<li style='width:100%;clear: both;'><a href='{0}' class='img_general'>{1}<span class='info_icon'></span></a>";
            str += "<h3><a href='{2}' class='h3Title font1'>{3}</a></h3>";
            str += "<p>{4}</p>";
            str += "  <a href='{5}' class='view_more'><u>Xem thêm...</u></a></li>";
            string link, img;
            link = GetLink(NEWS_URL, NEWS_SEO_URL, CAT_SEO_URL);
            img = GetImageT(NEWS_ID, NEWS_IMAGE3);
            return String.Format(str, link, img, link, NEWS_TITLE, NEWS_DESC, link);
        }

        #region function
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
                return fun.GetImageT_News_Hasclass(News_Id, News_Image1, "trans");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string getdate(object date)
        {
            return fun.getDate(date);
        }
        #endregion

    }
}