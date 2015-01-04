<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="projectsLeft_vi.ascx.cs" Inherits="CatTrang.UIs.projectsLeft_vi" %>

<div class="fl" id="sidebar">
    <!--List Vertical Projects-->
    <div class="box" id="list_name_projects">
        <ul>
            <asp:Repeater ID="rptListProjectLeft" runat="server">
            <ItemTemplate>
            <li class="v_item_project">
                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                <h2><%# Eval("NEWS_TITLE") %></h2>
                <span><i><%# Eval("ADDRESS")%></i></span></a> 
            </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
    </div>
    <!--end List Vertical Projects-->
    <div class="pagination">
        <asp:Literal ID="ltrPage" runat="server"></asp:Literal>
    </div>
    </div>