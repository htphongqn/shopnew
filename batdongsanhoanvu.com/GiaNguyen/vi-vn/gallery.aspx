<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVi.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="CatTrang.vi_vn.gallery" %>
<%@ Register src="~/UIs/sidebar_vi.ascx" tagname="sidebar_vi" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="padding10">
      <!--Main Column-->
      <div class="fl" id="main_col">
        <div class="path"><a href="/">Trang chủ</a> &raquo; <a href="gallery.html">Hình ảnh</a></div>
        <!--Gallery Images-->
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
        height: 480px; overflow: hidden; margin-bottom: 15px">
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
        <!--End Gallery Images-->
      </div>
      <!--End Main Column-->
      <!--Sidebar-->
      <uc2:sidebar_vi ID="sidebar_vi1" runat="server" />
      <!--End Sidebar-->
    </div>
</asp:Content>
