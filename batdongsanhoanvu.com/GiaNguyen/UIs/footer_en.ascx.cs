using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;

namespace CatTrang.UIs
{
    public partial class footer_en : System.Web.UI.UserControl
    {
        Propertity per = new Propertity();
        Function fun = new Function();
        private Config cf = new Config();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadOnline();
        }
        private void LoadOnline()
        {
            lblOnline.Text = string.Format("{0:#,#}", Utils.CIntDef(Application["Online"]));
            var _hit = cf.Config_meta();
            if (_hit.ToList().Count > 0)
            {
                int sum = Utils.CIntDef(_hit.ToList()[0].CONFIG_HITCOUNTER);
                lblSum.Text = string.Format("{0:#,#}", sum);

            }
        }
    }
}