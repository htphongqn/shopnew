<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menutop_vi.ascx.cs" Inherits="CatTrang.UIs.menutop_vi" %>

      <!--Top Menu-->
      <div id="nav_menu">
        <ul>
          <asp:Repeater ID="rptMenu" runat="server">
            <ItemTemplate>
                <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                    <%#Eval("cat_name")%></a>
                    <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                                <%#Eval("cat_name")%>
                                </a>
                                <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                                            <%#Eval("cat_name")%>
                                            </a></li></ItemTemplate>
                                    <FooterTemplate>
                                        </ul></FooterTemplate>
                                </asp:Repeater>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
      </div>
      <!--end Top Menu-->
      <div id="topbar_mobile">
        <div class="fl" id="icon_home_mobile"><a href="/"><img alt="" src="/Images/icons/home_icon.png"></a></div>
        <!--Menu Mobile-->
        <div id="menu_button" class="fr">
          <div class="menu_icon"></div>
          <div class="mobile_menu">
            <div class="fly_menu">
              <div class="main_nav" id="box_category">
                <ul>
                  <asp:Repeater ID="rptMenuMobile" runat="server">
                    <ItemTemplate>
                        <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %> cat-header'><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                            <%#Eval("cat_name")%></a>
                            <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                <HeaderTemplate>
                                    <ul>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                                        <%#Eval("cat_name")%>
                                        </a>
                                        <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                            <HeaderTemplate>
                                                <ul>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li><a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                                                    <%#Eval("cat_name")%>
                                                    </a></li></ItemTemplate>
                                            <FooterTemplate>
                                                </ul></FooterTemplate>
                                        </asp:Repeater>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                </ul>
                <div class="close_menu">Đóng Menu</div>
              </div>
            </div>
          </div>
        </div>
        <!--End Menu Mobile-->