using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;

namespace MVC_Kutun.ajax
{
    public partial class vi_vnToolTip : System.Web.UI.Page
    {
        #region Declare
        List_product lpro = new List_product();
        Function fun = new Function();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_tooltip();
        }
        private void Load_tooltip()
        {
            string str = string.Empty;
            //var list = lpro.getTooltip(Request["purl"]);
            //if (list.Count > 0)
            //{
                
            //    str += "<div style='margin-top: 5px; padding: 0px 5px 5px 5px;'>";
            //    str += "<div class='headerTooltip'>" + list[0].NEWS_TITLE + "</div>";
            //    str += "<div class='orderTooltip'><img src='"+GetImageT(list[0].NEWS_ID,list[0].NEWS_IMAGE3)+"'/></div>";
            //    str += "<div class='contentTooltip'>" + list[0].NEWS_DESC+ "</div>";
            //    str += "</div>";

            //}
            str += "<div style='margin-top: 5px; padding: 0px 5px 5px 5px;background-color:White;width:300px'>";
            str += "<div class='headerTooltip'>" + "THE POINT" + "</div>";
                str += "<div class='orderTooltip'><img src='" + "/data/news/17/img_logo_point.png" + "'/></div>";
                str += "<div class='contentTooltip'>" + "The Point là một trong những dự án biệt thự bên sân gôn hàng đầu Việt Nam. Nằm trong khuôn viên của sân gôn The Dunes đoạt giải thưởng quốc tế được thiết kế bởi huyền thoại golf Greg Norman, The Point được thiết kế với các nguyên tắc tương tự như khu biệt thự The Dune Residences." + "</div>";
                str += "</div>";
            ltrInfo.Text = str;
        }
        //private string GetPrice1(object News_Price1, object News_Price2, object news_id)
        //{
        //    try
        //    {
        //        return fun.Getprice1(News_Price1, News_Price2, news_id);
        //    }
        //    catch (Exception ex)
        //    {
        //        clsVproErrorHandler.HandlerError(ex);
        //        return null;
        //    }
        //}
        private string GetImageT(object News_Id, object News_Image1)
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