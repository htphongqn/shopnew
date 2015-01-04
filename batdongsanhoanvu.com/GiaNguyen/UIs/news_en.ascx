<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news_en.ascx.cs" Inherits="CatTrang.UIs.news_en" %>
<%@ Register src="path_en.ascx" tagname="path_vi" tagprefix="uc1" %>

      <div class="fl" id="main_col" style="width:94%;padding:10px">
        <uc1:path_vi ID="path_vi1" runat="server" />
        <div class="box">
        <h1 class="h1Title"><asp:Label ID="lbNewsTitle" runat="server" Text="" /> </h1>
        <div class="box_ct" id="list_news">
          <ul>        

              <asp:Repeater ID="Rplistnews" runat="server">
                <ItemTemplate>
                <%#GetHtmlItemNews(Eval("NEWS_URL"), Eval("NEWS_SEO_URL"), Eval("CAT_SEO_URL"), Eval("NEWS_ID"), Eval("NEWS_IMAGE3"), Eval("NEWS_TITLE"), Eval("NEWS_DESC"))%>
                </ItemTemplate>
            </asp:Repeater>

          </ul>          
          <div class="pagination">
                <asp:Literal ID="ltrPage" runat="server"></asp:Literal>
            </div>
        </div>
      </div>

    </div>