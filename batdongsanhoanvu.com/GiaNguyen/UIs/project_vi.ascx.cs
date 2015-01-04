using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GiaNguyen.Components;
using Controller;
using vpro.functions;
using Model;
using System.IO;

namespace CatTrang.UIs
{
    public partial class project_vi : System.Web.UI.UserControl
    {
        private Controller.Home _home = new Controller.Home();
        private News_details ndetail = new News_details();
        Product_Details pro_detail = new Product_Details();
        Function fun = new Function();
        Attfile att = new Attfile();
        Comment cm = new Comment();
        public clsFormat fm = new clsFormat();
        string _sNews_Seo_Url = string.Empty;
        public string comment_url = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            if (!IsPostBack)
            {
                Loaddetails();
            }
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
                    lbImage.Text = GetImage(list[0].NEWS_ID, list[0].NEWS_IMAGE4);
                    lbHotline.Text = list[0].PHONE;
                    if (!string.IsNullOrEmpty(list[0].GOOGLEMAPSLINK))
                    {
                        hplGooglemap.Visible = true;
                        hplGooglemap.NavigateUrl = list[0].GOOGLEMAPSLINK;
                    }
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
                string gioithieuchung = "gioithieuchung" + htmExt;
                string vitri = "vitri" + htmExt;
                string matbang = "matbang" + htmExt;
                string tienich = "tienich" + htmExt;
                string kientruc = "kientruc" + htmExt;

                HtmlGioithieuchung.Text = pro_detail.Show_File_HTML_ByName(_newsID, gioithieuchung);
                //HtmlVitri.Text = pro_detail.Show_File_HTML_ByName(_newsID, vitri);
                HtmlMatbang.Text = pro_detail.Show_File_HTML_ByName(_newsID, matbang);
                HtmlTienich.Text = pro_detail.Show_File_HTML_ByName(_newsID, tienich);
                HtmlKientruc.Text = pro_detail.Show_File_HTML_ByName(_newsID, kientruc);
                rpttailieu.DataSource = att.Loadatt_fileByType(_newsID, 15);
                rptbrochure.DataSource = att.Loadatt_fileByType(_newsID, 16);
                rpttailieu.DataBind();
                rptbrochure.DataBind();

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public string linkDownload(object m_news_id, object Att_File)
        {
            string pathfile = Server.MapPath(PathFiles.GetPathNews(Utils.CIntDef(m_news_id)));
            //string pathfile = Server.MapPath("../data/news/" + m_news_id);
            string fullpathfile = pathfile + "/" + Att_File;

            if (File.Exists(pathfile))
            {
                return fullpathfile; 
            }

            return "";
        }
        public string GetImage(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News_Hasclass(News_Id, News_Image1,"");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
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