using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Controller;
using vpro.functions;

namespace CatTrang.vi_vn
{
    public partial class Home : System.Web.UI.Page
    {
        Config cf = new Config();
        Propertity per = new Propertity();
        Function fun = new Function();
        private Controller.Home index = new Controller.Home();
        News_details ndetail = new News_details();
        string _sNews_Seo_Url = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //HtmlHead header = base.Header;
            //HtmlMeta headerDes = new HtmlMeta();
            //HtmlMeta headerKey = new HtmlMeta();
            //headerDes.Name = "Description";
            //headerKey.Name = "Keywords";
            //var _configs = cf.Config_meta();

            //if (_configs.ToList().Count > 0)
            //{
            //    if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
            //        ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
            //    header.Title = _configs.ToList()[0].CONFIG_TITLE;

            //    headerDes.Content = _configs.ToList()[0].CONFIG_DESCRIPTION;
            //    header.Controls.Add(headerDes);

            //    headerKey.Content = _configs.ToList()[0].CONFIG_KEYWORD;
            //    header.Controls.Add(headerKey);
            //}
            //else
            //{
            //    header.Title = "Enews Standard V1.0";

            //    headerDes.Content = "Enews Standard V1.0";
            //    header.Controls.Add(headerDes);

            //    headerKey.Content = "Enews Standard V1.0";
            //    header.Controls.Add(headerKey);
            //}

            Load_slider();
            var list = index.Loadindex(3, 1, 1, 1);
            if (list.Count > 0)
            {
                var item = list.ToList()[0];
                lbwellcome.Text = item.NEWS_DESC;
                //ShowWelcome(item.CAT_SEO_URL);
            }
        }
        #region Slider
        public void Load_slider()
        {
            try
            {
                Rpslider.DataSource = per.Load_slider1(0, 100, 1);
                Rpslider.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        //private void ShowWelcome(string _sCat_Seo_Url)
        //{
        //    try
        //    {
        //        if (!string.IsNullOrEmpty(_sCat_Seo_Url))
        //        {
        //            _sNews_Seo_Url = ndetail.Get_News_seo_url(_sCat_Seo_Url);
        //        }
        //        lbwellcome.Text = ndetail.Showfilehtm(_sCat_Seo_Url, _sNews_Seo_Url);
        //    }
        //    catch (Exception ex)
        //    {
        //        clsVproErrorHandler.HandlerError(ex);
        //    }
        //}
        #endregion

        #region Function

        public string GetImage(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url, object AD_ITEM_DESC)
        {
            try
            {
                string temp;
                temp = fun.GetImageHome(Ad_Id, Ad_Image1, Ad_Target, Ad_Url, AD_ITEM_DESC);
                return temp;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        #endregion
    }
}