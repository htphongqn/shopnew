<%@ Page Title="Diamond Bay City" Language="C#" MasterPageFile="~/Master/SiteRu.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CatTrang.ru_mo.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Slider Responsive-->
        <link rel="stylesheet" href="../Styles/responsiveslides.css" type="text/css" media="screen" />
        <script type="text/javascript" src="../Scripts/responsiveslides.min.js"></script>
        <script type="text/javascript">
            // You can also use "$(window).load(function() {"
            $(function () {

                // Slideshow 4
                $("#slider4").responsiveSlides({
                    auto: true,
                    pager: false,
                    nav: true,
                    speed: 500,
                    namespace: "callbacks",
                    before: function () {
                        $('.events').append("<li>before event fired.</li>");
                    },
                    after: function () {
                        $('.events').append("<li>after event fired.</li>");
                    }
                });

            });


            window.onload = function () {
                var main = document.getElementById('main');
                main.removeAttribute("class");
            }

    </script>
        <!-- Slideshow 4 -->
        <div id="slide_banner">
          <div class="callbacks_container">
            <ul class="rslides" id="slider4">              
                <asp:Repeater ID="Rpslider" runat="server">
                    <ItemTemplate>
                        <li><%# GetImage(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
          </div>
        </div>
        <!-- END OF SLIDE -->
        <!--Intro-->
        <div id="wellcome">
            <asp:Literal ID="lbwellcome" runat="server"></asp:Literal>
          <%--<h1 style="font-size: 13px; color: #cfb461; text-transform: uppercase">Diamondbaycity kính chào quý khách !</h1>
          <p>Located in the world famous tourist destination of Nha Trang Vietnam, invested 
            and developed by the Hoan Cau Group, Diamond Bay Golf &amp; Villas&nbsp;is 
            where majestic mountains meet sunny skies, where unspoiled white-sand beaches 
            kiss unimaginable crystal blue waters. It's a tropical paradise unlike any 
            other. This extraordinary place offers a truly stress-free lifestyle. Diamond 
            Bay Golf &amp; Villas&nbsp;includes a beautiful resort and private villa 
            accommodation, a large swimming pool, restaurants featuring international 
            cuisine, an 18-hole championship Andy Dye designed golf course with an 
            oceanfront driving range, state of the art practice facility and golf academy. 
            Moreover, Diamond Bay Golf &amp; Villas&nbsp;allows purchase of luxury villas 
            to those who wish to experience a truly unique and wonderful lifestyle.</p>--%>

        </div>
        <!--end Intro-->
</asp:Content>
