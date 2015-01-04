<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="projects_ch.ascx.cs" Inherits="CatTrang.UIs.projects_ch" %>

<%@ Register src="path_ch.ascx" tagname="path_vi" tagprefix="uc1" %>

<%@ Register src="projectsLeft_ch.ascx" tagname="projectsLeft_vi" tagprefix="uc2" %>

<div class="padding10">      
      <uc1:path_vi ID="path_vi1" runat="server" />

      <!--Main Column-->
      <div class="fr" id="main_col">
        <!--List Projects-->
        <div class="list_projects">
          <asp:Repeater ID="rptListProject" runat="server">
                <ItemTemplate>
                    <div class="project_item">                        
                        <a target="_self" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" class="project_img">
                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>">
                        <span class="project_name" title='<%# Eval("NEWS_TITLE")%>'><%# GetShortName(Eval("NEWS_TITLE"), 20)%></span>
                        <span class="project_location" title='<%# Eval("ADDRESS")%>'><%# GetShortName(Eval("ADDRESS"), 20)%></span>
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
      <!--Sidebar-->
      <uc2:projectsLeft_vi ID="projectsLeft_vi1" runat="server" />
      <!--End Sidebar-->
    </div>

