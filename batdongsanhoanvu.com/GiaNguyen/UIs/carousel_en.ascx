<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="carousel_en.ascx.cs" Inherits="CatTrang.UIs.carousel_en" %>

        <div id="carousel_ads">
          <div id="slide_ads">
            <ul>
              <%--<asp:Repeater ID="rptcarousel" runat="server">
                <ItemTemplate>
                <%#GetCarouselItem(Eval("NEWS_URL"), Eval("NEWS_SEO_URL"), Eval("CAT_SEO_URL"), Eval("NEWS_ID"), Eval("NEWS_IMAGE4"), Eval("NEWS_TITLE"), Eval("NEWS_DESC"))%>
                </ItemTemplate>
            </asp:Repeater>--%>
            <asp:Repeater ID="rptcarousel" runat="server">
            <ItemTemplate>
                <li>
                <%# GetImageBox(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
                </li>
            </ItemTemplate>
        </asp:Repeater>
            </ul>
            <div class="cf"></div>
            <a id="prev" class="prev slide_control" href="#">&lt;</a> <a id="next" class="next slide_control" href="#">&gt;</a> </div>
        </div>