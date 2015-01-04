<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="new_en.ascx.cs" Inherits="CatTrang.UIs.new_en" %>
<%@ Register src="path_en.ascx" tagname="path_vi" tagprefix="uc1" %>

      <div class="fl" id="main_col" style="width:94%;padding:10px">
        <uc1:path_vi ID="path_vi1" runat="server" />
        <div class="function">
            <div class="addthis_toolbox addthis_default_style like_face">
                <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
                </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
                </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
                </a>
                <script type="text/javascript">
                    var addthis_config = { "data_track_addressbar": true };
                    addthis_config = addthis_config || {};
                    addthis_config.data_track_addressbar = false;
                </script>
                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50d418ab2d45f0aa"></script>
            </div>            
        </div>

        <!--Detail Hotel-->
        <div class="box" id="detail_news">
          <h1 class="h1Title"><asp:Label ID="lbNewsTitle" runat="server" Text="" /> </h1>
          <asp:Literal ID="liHtml" runat="server"></asp:Literal>
        </div>
        
        <div class="other_news_sub" id="dvOtherNews" runat="server">
            <div class="other_newsT">Tin liên quan</div>
            <ul>
              <asp:Repeater ID="Rptinkhac" runat="server">
                <ItemTemplate>
                    <li><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                        <%# Eval("NEWS_TITLE") %>
                        <%--<span class="date">(Ngày đăng <%# getDate(Eval("NEWS_PUBLISHDATE"))%>)</span> --%>
                        </a></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
            <a class="view_all" href="" id="hplViewmore" runat="server">Xem tất cả &raquo;</a> </div>

    </div>