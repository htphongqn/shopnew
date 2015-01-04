using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using CatTrang.Components;

namespace CatTrang.UIs
{
    public partial class carousel_en : System.Web.UI.UserControl
    {
        private Function fun = new Function();
        private Controller.Home index = new Controller.Home();
        private Controller.List_news lnews = new Controller.List_news();
        private Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadSlider();
        }
        public void LoadSlider()
        {
            try
            {
                var list = per.Load_slider1(1, 100, Cost.EN).ToList();
                if (list.Count > 0)
                {
                    rptcarousel.DataSource = list;
                    rptcarousel.DataBind();
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public string GetImageBox(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url)
        {
            try
            {
                string temp;
                temp = fun.GetImageAd1(Ad_Id, Ad_Image1, Ad_Target, Ad_Url, "img-box");
                return temp;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News_EN(News_Url, News_Seo_Url, cat_seo);
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

    }
}