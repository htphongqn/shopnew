<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="carousel_vi.ascx.cs" Inherits="CatTrang.UIs.carousel_vi" %>

        <div id="carousel_ads">
          <div id="slide_ads">
            <ul>
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