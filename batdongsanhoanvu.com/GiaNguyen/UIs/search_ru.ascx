<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="search_ru.ascx.cs" Inherits="CatTrang.UIs.search_ru" %>

<div class="padding10">      
     <div class="path"><a href="/домой.html">домой</a> &raquo; <a href="/поиск.html">поиск</a></div>

      <!--Main Column-->
      <div class="fr" id="main_col" style="width:100%">
        <!--List Projects-->
        <div class="list_projects">
          <asp:Repeater ID="rptListProject" runat="server">
                <ItemTemplate>
                    <div class="project_item">                        
                        <a target="_self" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" class="project_img">
                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>">
                        <span class="project_name" title='<%# Eval("NEWS_TITLE")%>'><%# GetShortName(Eval("NEWS_TITLE"))%></span> 
                        <%--<span class="project_location"><%# Eval("ADDRESS")%></span>--%>
                        </a>
                </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="pagination">
            <asp:Literal ID="ltrPage" runat="server"></asp:Literal>
        </div>
        <!--End List Projects-->
      </div>
      <!--End Main Column-->
    </div>