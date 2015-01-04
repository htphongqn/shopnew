using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace CatTrang.UIs
{
    public partial class header_ru : System.Web.UI.UserControl
    {
        #region Declare
        Propertity per = new Propertity();
        Function fun = new Function();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            load_logo();
            loadMenuHotel();
            loadsocial_network();
            Loadhotline();
            LoadEmail();
        }

        #region Load Data
        private void loadsocial_network()
        {
            var list = per.Load_Online();
                string str = "<a href='{0}' title='{1}' target='_blank'><span class='{2}'></span></a>";
                foreach (var item in list)
                {
                    switch (item.ONLINE_TYPE)
                    {
                        case 3: lblsocial_network.Text += String.Format(str, item.ONLINE_NICKNAME, item.ONLINE_DESC, "icon_facebook"); break;
                        case 4: lblsocial_network.Text += String.Format(str, item.ONLINE_NICKNAME, item.ONLINE_DESC, "icon_gplus"); break;
                        case 5: lblsocial_network.Text += String.Format(str, item.ONLINE_NICKNAME, item.ONLINE_DESC, "icon_twitter"); break;
                        case 6: lblsocial_network.Text += String.Format(str, item.ONLINE_NICKNAME, item.ONLINE_DESC, "icon_youtube"); break;
                    }
                }
        }
        protected void load_logo()
        {
            var _logoSlogan = per.Load_logo_and_sologan(2, 1);
            if (_logoSlogan.ToList().Count > 0)
            {
                Rplogo.DataSource = _logoSlogan;
                Rplogo.DataBind();
            }
        }
        protected void loadMenuHotel()
        {
            try
            {
                var listhotel = per.MenuHotel(1, 12, 1, 3);
                rptMenuHotel.DataSource = listhotel;
                rptMenuHotel.DataBind();
                ddlFindHotel.DataSource = listhotel;
                ddlFindHotel.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
        public string Getbanner(object Banner_type, object banner_field, object Banner_ID, object Banner_Image)
        {
            return fun.GetbannerRu(Banner_type, banner_field, Banner_ID, Banner_Image);
        }
        public string GetLink(object Cat_Url, object Cat_Seo_Url, object Cat_Type)
        {
            try
            {
                string temp = fun.Getlink_Cat_RU(Cat_Url, Cat_Seo_Url);
                return temp;
            }
            catch 
            {
                return "javascript:void(0)";
            }
        }
        public void Loadhotline()
        {
            var list = per.Load_hotline().Take(1).ToList();
            if (list.Count > 0)
            {
                liLoadHotline.Text = list[0].ONLINE_FIELD2;
            }
        }
        public void LoadEmail()
        {
            var list = per.Load_hotline().Take(1).ToList();
            if (list.Count > 0)
            {

                lbEmail.Text = "<a href='mailto:" + list[0].ONLINE_NICKNAME + "'><i class='icon_email'></i><span>" + list[0].ONLINE_NICKNAME + "</span></a>";
            }
        }
        #endregion

        protected void Lbsearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("/поиск.html?page=0&keyword=" + q.Value);
        }
    }
}