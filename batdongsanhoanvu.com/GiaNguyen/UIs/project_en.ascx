<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="project_en.ascx.cs" Inherits="CatTrang.UIs.project_en" %>
<%@ Register src="projectsLeft_en.ascx" tagname="projectsLeft_vi" tagprefix="uc2" %>

<div class="padding10">      
      <!--Main Column-->
      <div class="fr" id="main_col">
        <!--Projects-->
        <div class="box" id="project_dt">
          <h1 class="h1Title"><asp:Label ID="lbNewsTitle" runat="server" Text="" /> 
          <a href="/en/order.html" class="order_btn">ORDER</a></h1>
          <link type="text/css" rel="stylesheet" href="../Styles/easy-responsive-tabs.css" />
          <script src="../Scripts/easyResponsiveTabs.js" type="text/javascript"></script>
          <script type="text/javascript">
              $(document).ready(function () {
                  $('.horizontalTab').easyResponsiveTabs({
                      type: 'default', //Types: default, vertical, accordion           
                      width: 'auto', //auto or any width like 600px
                      fit: true,   // 100% fit in a container
                      closed: 'accordion', // Start closed if in accordion view
                      activate: function (event) { // Callback function if tab is switched
                          var $tab = $(this);
                          var $info = $('#tabInfo');
                          var $name = $('span', $info);

                          $name.text($tab.text());

                          $info.show();
                      }
                  });
              });
</script>
          <!--Horizontal Tab-->
          <div class="horizontalTab cf" id="tab_detail">
            <ul class="resp-tabs-list">
              <li > Introduction </ li >
              <li > Location </ li >
              <li > Space </ li >
              <li > Utilities </ li >
              <li > Architecture </ li >
              <li > Document </ li >
              <li > Download the brochure </li>
            </ul>
            <div class="resp-tabs-container">
              <div class="tab_ct text_content">
                <!--About Projects-->
                <div class="project_col fullsize fl">
                  <div class="project_logo"> 
                    <asp:Label ID="lbImage" runat="server" Text="" /> 
                  </div>
                  <div class="project_info">
                    <p class="hotline">Hotline:<br>
                      <b><asp:Label ID="lbHotline" runat="server" Text="" /> </b></p>
                      <asp:HyperLink ID="hplGooglemap" runat="server" Visible ="false" CssClass="show-map" Text="See location on Google Maps project"></asp:HyperLink> 
                    </div>
                </div>
                <div class="project_content fullsize fr">
                  <!-- jssor.slider.mini.js = (jssor.js + jssor.slider.js) -->
                  <script type="text/javascript" src="../Scripts/jssor.js"></script>
                  <script type="text/javascript" src="../Scripts/jssor.slider.js"></script>
                  <script type="text/javascript">
                      // JavaScript Document
                      jQuery(document).ready(function ($) {
                          var options = {
                              $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                              $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                              $SlideDuration: 500,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                              $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
                              $UISearchMode: 0,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).

                              $ThumbnailNavigatorOptions: {
                                  $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                                  $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always

                                  $Loop: 2,                                       //[Optional] Enable loop(circular) of carousel or not, 0: stop, 1: loop, 2 rewind, default value is 1
                                  $SpacingX: 3,                                   //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
                                  $SpacingY: 3,                                   //[Optional] Vertical space between each thumbnail in pixel, default value is 0
                                  $DisplayPieces: 6,                              //[Optional] Number of pieces to display, default value is 1
                                  $ParkingPosition: 204,                          //[Optional] The offset position to park thumbnail,

                                  $ArrowNavigatorOptions: {
                                      $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                                      $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                                      $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                                      $Steps: 6                                       //[Optional] Steps to go for each navigation request, default value is 1
                                  }
                              }
                          };

                          var jssor_slider1 = new $JssorSlider$("slider1_container", options);

                          //responsive code begin
                          //you can remove responsive code if you don't want the slider scales while window resizes
                          function ScaleSlider() {
                              var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                              if (parentWidth)
                                  jssor_slider1.$ScaleWidth(Math.min(parentWidth, 880));
                              else
                                  window.setTimeout(ScaleSlider, 30);
                          }
                          ScaleSlider();

                          $(window).bind("load", ScaleSlider);
                          $(window).bind("resize", ScaleSlider);
                          $(window).bind("orientationchange", ScaleSlider);
                          //responsive code end
                      });
				</script>
                  <link href="../Styles/jsor.css" rel="stylesheet" type="text/css" />
                  <!-- Jssor Slider Begin -->
                  <!-- You can move inline styles to css file or css block. -->
                  <div id="slider1_container" style="position: relative; width: 880px;
        height: 480px; overflow: hidden;">
                    <!-- Loading Screen -->
                    <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                      <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;"> </div>
                      <div style="position: absolute; display: block; background: url(../img/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;"> </div>
                    </div>
                    <!-- Slides Container -->
                    <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 880px; height: 480px; overflow: hidden;">                      
                      <asp:Repeater ID="rptImages" runat="server">
                        <ItemTemplate>
                            <div> 
                            <img u="image" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" /> 
                            <img u="thumb" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" /> 
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    </div>
                    <!-- Thumbnail Navigator Skin Begin -->
                    <div u="thumbnavigator" class="jssort07" style="position: absolute; width: 880px; height: 100px; left: 0px; bottom: 0px; overflow: hidden; ">
                      <div style=" background-color: #000; filter:alpha(opacity=30); opacity:.3; width: 100%; height:100%;"></div>
                      <!-- Thumbnail Item Skin Begin -->
                      <div u="slides" style="cursor: move;">
                        <div u="prototype" class="p" style="POSITION: absolute; WIDTH: 99px; HEIGHT: 66px; TOP: 0; LEFT: 0;">
                          <div u="thumbnailtemplate" class="i" style="position:absolute;"></div>
                          <div class="o"> </div>
                        </div>
                      </div>
                      <!-- Thumbnail Item Skin End -->
                      <!-- Arrow Navigator Skin Begin -->
                      <!-- Arrow Left -->
                      <span u="arrowleft" class="jssora11l" style="width: 37px; height: 37px; top: 123px; left: 8px;"> </span>
                      <!-- Arrow Right -->
                      <span u="arrowright" class="jssora11r" style="width: 37px; height: 37px; top: 123px; right: 8px"> </span>
                      <!-- Arrow Navigator Skin End -->
                    </div>
                    <!-- ThumbnailNavigator Skin End -->
                    <a style="display: none" href="http://www.jssor.com">javascript</a>
                    <!-- Trigger -->
                  </div>
                  <!-- Jssor Slider End -->
                  <!--Scrollbar-->
                  <script src="../Scripts/jquery.slimscroll.js"></script>
                  <script>
                      $(document).ready(function () {
                          $('.scrollbar').slimscroll({
                              height: 'auto'
                          });
                      });
</script>
                  <div class="project_table">
                    <div class="scrollbar">
                      <table class="prj-table">
                        <tr>
                          <td>
                          <asp:Literal ID="HtmlGioithieuchung" runat="server"></asp:Literal>
                          </td>
                        </tr>                        
                      </table>
                    </div>
                  </div>
                </div>
                <!--end About Projects-->
              </div>
              <div class="tab_ct text_content">
                <!--Vi tri-->
                <asp:Literal ID="HtmlVitri" runat="server"></asp:Literal>
                <!--end Vi tri-->
              </div>
              <div class="tab_ct text_content">
                <!--Mat bang-->
                <asp:Literal ID="HtmlMatbang" runat="server"></asp:Literal>
                <!--end Mat bang-->
              </div>
              <div class="tab_ct text_content">
                <!--Tien ich-->
                <asp:Literal ID="HtmlTienich" runat="server"></asp:Literal>
                <!--Tien ich-->
              </div>
              <div class="tab_ct">
                <!--Kien truc-->
                <asp:Literal ID="HtmlKientruc" runat="server"></asp:Literal>
                <!--end Kien truc-->
              </div>
              <div class="tab_ct">
                <!--Tai lieu-->
                <asp:Repeater ID="rpttailieu" runat="server">
                    <ItemTemplate>
                        <div class="download_item">
                        <img src="../Images/icons/download_icon.png" alt="" width="29" height="25" />
                        <a href="<%# linkDownload(Eval("NEWS_ID"),Eval("NEWS_ATT_FILE"))%>" >
                        <%# Eval("NEWS_ATT_NAME") %></a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <!--end Tai lieu-->
              </div>
              <div class="tab_ct">
                <!--Tai brochure-->
                <asp:Repeater ID="rptbrochure" runat="server">
                    <ItemTemplate>
                        <div class="download_item">
                        <img src="../Images/icons/download_icon.png" alt="" width="29" height="25" />
                        <a href="<%# linkDownload(Eval("NEWS_ID"),Eval("NEWS_ATT_FILE"))%>" >
                        <%# Eval("NEWS_ATT_NAME")%></a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <!--end Tai brochure-->
              </div>
            </div>
          </div>
          <!--end Horizontal Tab-->
        </div>
        <!--End Detail Hotel-->
      </div>
      <!--End Main Column-->
      <!--Sidebar-->
      <uc2:projectsLeft_vi ID="projectsLeft_vi1" runat="server" />      
      <!--End Sidebar-->
    </div>