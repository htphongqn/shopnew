using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using GiaNguyen.Components;
using Controller;

namespace CatTrang.en_us
{
    public partial class gallery : System.Web.UI.Page
    {
        Product_Details pro_detail = new Product_Details();
        Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {
            var listAlbum = pro_detail.Load_Allalbumimg(2, 2);
            rptImages.DataSource = listAlbum;
            rptImages.DataBind();
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