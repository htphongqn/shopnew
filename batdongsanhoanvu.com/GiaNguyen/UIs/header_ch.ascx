<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header_ch.ascx.cs" Inherits="CatTrang.UIs.header_ch" %>

<header>
        <asp:Repeater ID="Rplogo" runat="server">
            <ItemTemplate>
                <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%>
            </ItemTemplate>
        </asp:Repeater>

        <div id="find_hotel_area" class="fl">
          <div class="link_find_hotel"><span class="ico ico_address"></span> 
            <a href="javascript:void(0)">查找酒店<span class="ico ico_square_arrow"></span></a> 
          </div>
          <div class="link_hotel_lv2">
            <ul>
              <asp:Repeater ID="rptMenuHotel" runat="server">
                <ItemTemplate>
                    <li>
                    <a href="<%#GetLink(Eval("cat_url"),Eval("cat_seo_url"),1)%>">
                        <%#Eval("cat_name")%></a>                
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
          </div>
        </div>
        <div id="drop_linkhotel">
          <asp:DropDownList ID="ddlFindHotel" runat="server" class="sl_find_hotel" name="link_find_hotel" DataValueField="CAT_ID" DataTextField="cat_name" AppendDataBoundItems="true">
            <asp:ListItem Value="0" Text="查找酒店"></asp:ListItem>
          </asp:DropDownList>
        </div>
        <div class="fullsize fr" id="headr_r">
          <!--Row Head-->
          <div class="row_head row_h1">
            <!--Language-->
            <div class="fr" id="lang">
            <a href="/trang-chu.html"><img src="/Images/icons/vn_icon.gif" alt="Vietnamese" class="ico_lang" id="tv" /></a>
            <a href="/home.html"><img src="/Images/icons/en_icon.gif" alt="English" class="ico_lang" id="ta" /></a>
            <a href="/домой.html"><img src="/Images/icons/rus_icon.gif" alt="Rusian" class="ico_lang" id="tn" /></a>
            <a href="/设为首页.html"><img src="/Images/icons/china_icon.gif" alt="Chinese" class="ico_lang" id="ttq" /></a>
            </div>
            <!--end Language-->
            <div class="fr" id="ico_right_fixed">
              <!--Social-->
              <div class="fr" id="social_network">
              <asp:Literal ID="lblsocial_network" runat="server" Text="" />
              </div>
              <!--end Social-->
              <!--Email-->
              <div class="fr" id="head_email">
                <asp:Literal ID="lbEmail" runat="server"></asp:Literal>
              </div>
              <!--end Email-->
            </div>
          </div>
          <!--end Row Head-->
          <!--Row Head-->
          <div class="row_head row_h2">
            <!--Search Tool-->
            <div class="fr" id="search_box_head">
              <div id="search_head">
                <asp:Panel ID="pn1" runat="server" DefaultButton="Lbsearch">
                <input type="text" onblur="javscript:if (this.value == '') this.value = '搜索...';" onfocus="javascript:if (this.value == '搜索...') this.value = '';" value="搜索..." name="keyword" id="q" runat="server" class="inputSearch" />      
                <asp:LinkButton ID="Lbsearch" runat="server" class="btn_search_head" OnClick="Lbsearch_Click"></asp:LinkButton>
                </asp:Panel>
                </div>
            </div>
            <!--end Search Tool-->
            <span class="split_line"></span>
            <div class="fr" id="hotline_head">
            <asp:Literal ID="liLoadHotline" runat="server"></asp:Literal>
            </div>            
          </div>
          <!--end Row Head-->
        </div>
      </header>