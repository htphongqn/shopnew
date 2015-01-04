<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="hotels_ch.ascx.cs" Inherits="CatTrang.UIs.hotels_ch" %>
<%@ Register src="path_ch.ascx" tagname="path_vi" tagprefix="uc1" %>
<%@ Register src="~/UIs/sidebar_ch.ascx" tagname="sidebar_vi" tagprefix="uc2" %>

<div class="padding10">
      <!--Main Column-->
      <div class="fl" id="main_col">
        <uc1:path_vi ID="path_vi1" runat="server" />
        <h1 class="name_web">DiamondBayCity</h1>
        <!--List News-->
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
        <!--Fancybox-->
        <link href="../Styles/jquery.fancybox.css" media="all" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../Scripts/jquery.fancybox.js"></script>
        <script type="text/javascript">
$( function(){    	
$(".zoom").fancybox({
		openEffect: 'elastic',
        closeEffect: 'elastic',
		autoPlay: 'true',
		playSpeed: '5000',
    });	
});			
</script>
        <div class="box">
          <div id="list_hotels">
            <ul>
            <asp:Repeater ID="rptListHotel" runat="server" 
                    onitemcommand="rptListHotel_ItemCommand">
                <ItemTemplate>
              <li class="item_hotel">
                <h3><a title="<%# Eval("NEWS_TITLE") %>" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h3>
                <div class="fullsize fl img_holel">
                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>"  style="height:120px;max-height:120px;width:100%;margin-top:10px" /></a><br>
                </div>
                <div class="fullsize fl item_details"> 
                <span class="hotel_address"> <%# Eval("ADDRESS")%></span> 
                <%--<span class="hotel_location">Tp Hồ Chí Minh, Việt Nam</span> --%>
                <span class="hotel_location">电话号码: <%# Eval("PHONE")%></span> 
                <a title="查看地图" target="_blank" href="<%# Eval("GOOGLEMAPSLINK")%>">(查看地图)</a> <br><br>
                  <span itemprop="description" class="info_item"><%# GetShortName(Eval("NEWS_DESC"), 260)%></span>
                </div>
                <div class="fullsize fl item_logo">
                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE4")) %>" alt="" /></a> 
                </div>
                <!--Horizontal Tab-->
                <div class="horizontalTab cf">
                  <ul class="resp-tabs-list">
                    <li>酒店概览</li>
                    <li>设施</li>
                    <li>地图</li>
                    <li>图像</li>
                  </ul>
                  <div class="resp-tabs-container">
                    <div class="tab_ct text_content">
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="lnkTongquan" />
                    </Triggers>
                        <ContentTemplate>                      
                        <asp:Literal ID="HtmlTongquan" runat="server" Text='<%# GetShortName(Show_File_HTML(Eval("NEWS_ID"),"tongquankhachsan-ch.htm"), 400) %>'></asp:Literal>
                        <asp:LinkButton ID="lnkTongquan" runat="server" CommandName="tongquan" CommandArgument='<%#Eval("NEWS_ID")%>' Text="查看更多"></asp:LinkButton>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="tab_ct text_content">
                      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="lnkCosovatchat" />
                    </Triggers>
                        <ContentTemplate>                      
                        <asp:Literal ID="HtmlCosovatchat" runat="server" Text='<%# GetShortName(Show_File_HTML(Eval("NEWS_ID"),"cosovatchat-ch.htm"), 400) %>'></asp:Literal>
                        <asp:LinkButton ID="lnkCosovatchat" runat="server" CommandName="cosovatchat" CommandArgument='<%#Eval("NEWS_ID")%>' Text="查看更多"></asp:LinkButton>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="tab_ct"> 
                    <asp:Literal ID="HtmlBando" runat="server" Text='<%# Show_File_HTML(Eval("NEWS_ID"),"bando-ch.htm") %>'></asp:Literal>
                    </div>
                    <div class="tab_ct">
                    <ul class="photo">
                    <asp:Repeater ID="rptImages" runat="server" DataSource='<%# GetImages(Eval("NEWS_ID")) %>'>
                        <ItemTemplate>
                        <li> 
                        <a href="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" rel="gallery1" class="img_photo zoom"> 
                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" /></a> 
                        </li>
                        </ItemTemplate>
                    </asp:Repeater>                          
                      </ul>                    
                      <div class="view_more_photo fr">
                      <a href="/ch/gallery.html" data-href="/hyatt/ajax/passthrough.jsp?language=en&amp;spiritcode=saiph&amp;brand=park" id="openMultimedia" class="openMultimedia">查看更多图片</a> 
                      </div>
                    </div>
                  </div>
                </div>
              </li>
              </ItemTemplate>
            </asp:Repeater>
              
            </ul>
            <div class="pagination">
            <asp:Literal ID="ltrPage" runat="server"></asp:Literal> 
            </div>
          </div>
        </div>
        <!--End List News-->
      </div>
      <!--End Main Column-->
      <!--Sidebar-->
      <uc2:sidebar_vi ID="sidebar_vi1" runat="server" />
      <!--End Sidebar-->
    </div>