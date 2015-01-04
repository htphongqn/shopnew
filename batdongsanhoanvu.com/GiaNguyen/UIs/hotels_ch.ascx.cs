using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;

namespace CatTrang.UIs
{
    public partial class hotels_ch : System.Web.UI.UserControl
    {
        #region Declare
        List_product list_pro = new List_product();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Pageindex_chage change = new Pageindex_chage();
        Product_Details pro_detail = new Product_Details();
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
                int sotin = list_pro.Getsotin(_Catid);
                var list = list_pro.Load_listpro(_Catid);
                if (list.Count > 0)
                {
                    if (_page != 0)
                    {
                        rptListHotel.DataSource = list.Skip(sotin * _page - sotin).Take(sotin);
                        rptListHotel.DataBind();
                    }
                    else
                    {
                        rptListHotel.DataSource = list.Take(sotin);
                        rptListHotel.DataBind();
                    }

                    ltrPage.Text = change.result(list.Count, sotin, _cat_seo_url, 0, _page, 1);

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
                return fun.Getlink_News_CH(News_Url, News_Seo_Url, cat_seo);
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
        public List<Model.ESHOP_NEWS_IMAGE> GetImages(object NEWS_ID)
        {
            var listAlbum = pro_detail.Load_albumimg(Utils.CIntDef(NEWS_ID)).ToList();
            return listAlbum;
        }
        public string Show_File_HTML(object newsID, string nameHtml)
        {
            try
            {
                int _newsID = Utils.CIntDef(newsID);
                return pro_detail.Show_File_HTML_ByName(_newsID, nameHtml);

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return "";
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

        protected void rptListHotel_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "tongquan")
            {
                Literal HtmlTongquan = (Literal)e.Item.FindControl("HtmlTongquan");
                LinkButton lnkTongquan = (LinkButton)e.Item.FindControl("lnkTongquan");
                if (HtmlTongquan != null && lnkTongquan != null)
                {
                    if (lnkTongquan.Text == "查看更多")
                    {
                        HtmlTongquan.Text = Show_File_HTML(e.CommandArgument, "tongquankhachsan-ch.htm");
                        lnkTongquan.Text = "Thu gọn";
                    }
                    else
                    {
                        HtmlTongquan.Text = GetShortName(Show_File_HTML(e.CommandArgument, "tongquankhachsan-ch.htm"), 400);
                        lnkTongquan.Text = "查看更多";
                    }
                }
            }
            else if (e.CommandName == "cosovatchat")
            {
                Literal HtmlCosovatchat = (Literal)e.Item.FindControl("HtmlCosovatchat");
                LinkButton lnkCosovatchat = (LinkButton)e.Item.FindControl("lnkCosovatchat");
                if (HtmlCosovatchat != null && lnkCosovatchat != null)
                {
                    if (lnkCosovatchat.Text == "查看更多")
                    {
                        HtmlCosovatchat.Text = Show_File_HTML(e.CommandArgument, "cosovatchat-ch.htm");
                        lnkCosovatchat.Text = "Thu gọn";
                    }
                    else
                    {
                        HtmlCosovatchat.Text = GetShortName(Show_File_HTML(e.CommandArgument, "cosovatchat-ch.htm"), 400);
                        lnkCosovatchat.Text = "查看更多";
                    }
                }
            }
        }
    }
}