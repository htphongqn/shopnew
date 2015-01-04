using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using GiaNguyen.Components;
using CatTrang.Components;

namespace CatTrang.UIs
{
    public partial class projectsLeft_ru : System.Web.UI.UserControl
    {
        #region Declare
        List_product list_pro = new List_product();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Pageindex_chage change = new Pageindex_chage();
        int _Catid = 0;
        string _cat_seo_url = string.Empty;
        int _page = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            _cat_seo_url = Request.QueryString["curl"];
            _page = Utils.CIntDef(Request.QueryString["page"]);

            Loadlist();
        }
        public void Loadlist()
        {
            try
            {
                //int sotin = list_pro.Getsotin(_Catid);
                //if (sotin == 0)
                int sotin = 50;
                //var list = list_pro.Load_listpro(_Catid);
                var list = list_pro.Load_listprobytype(1, Cost.RU);
                if (list.Count > 0)
                {
                    if (_page != 0)
                    {
                        rptListProjectLeft.DataSource = list.Skip(sotin * _page - sotin).Take(sotin);
                        rptListProjectLeft.DataBind();
                    }
                    else
                    {
                        rptListProjectLeft.DataSource = list.Take(sotin);
                        rptListProjectLeft.DataBind();
                    }

                    ltrPage.Text = change.result(list.Count, sotin, _cat_seo_url, 0, _page, 1);

                }
            }
            catch
            {

            }
        }
        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News_RU(News_Url, News_Seo_Url, cat_seo);
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
    }
}