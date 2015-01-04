<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sidebar_vi.ascx.cs" Inherits="CatTrang.UIs.sidebar_vi" %>

<div class="fr sidebar_hotel" id="sidebar">
        <!--Search Hotel-->
        <!--DatePicker Plugin-->
        <link rel="stylesheet" href="../Styles/BeatPicker.min.css" />
        <script src="../Scripts/BeatPicker.min.js"></script>
        <div class="box" id="searchhotel_area">
          <div id="search_ht_content">
            <div class="form_row_search fl">
              <label class="left_row_search">Khách sạn</label>
              <input name="name_hotel" type="text" id="txtname_hotel" runat="server" />
            </div>
            <div class="form_row_search fl">
              <div class="col_form_search fl">
                <label class="left_row_search">Ngày đi</label>
                <input type="text" data-beatpicker="true" data-beatpicker-position="['bottom','*']" data-beatpicker-module="clear" data-beatpicker-format="['DD','MM','YYYY'],separator:'/'" class="date depDate hasDatepicker fl" id="txtflights_checkin" name="flights-checkin" placeholder="MM / DD / YYYY" runat="server" />
              </div>
              <div class="col_form_search fr">
                <label class="left_row_search">Ngày về</label>
                <input type="text" data-beatpicker="true" data-beatpicker-position="['bottom','*']" data-beatpicker-module="clear" data-beatpicker-format="['DD','MM','YYYY'],separator:'/'" class="date retDate hasDatepicker fl" id="txtflights_checkout" name="flights-checkout" placeholder="MM / DD / YYYY"  runat="server"/>
              </div>
            </div>
            <div class="form_row_search fl">
              <label class="left_row_search fl">Loại phòng</label>
              <div class="styled-select fr">
                <asp:DropDownList ID="ddlHotelClass" runat="server" Width="100px">
                    <asp:ListItem Value="1" Text="Phòng vip"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="Phòng thường"></asp:ListItem> 
                    <%--<asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> --%>
                </asp:DropDownList>
              </div>
            </div>
            <div class="form_row_search aut fl">
              <label class="left_row_search fl">Người lớn</label>
              <div class="styled-select fr">
                <asp:DropDownList ID="ddlCusM" runat="server" Width="100px">
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>
                </asp:DropDownList>
              </div>
            </div>
            <div class="form_row_search chd fl">
              <label class="left_row_search fl">Trẻ em</label>
              <div class="styled-select fr">
                <asp:DropDownList ID="ddlCusS" runat="server" Width="100px">
                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
                    <asp:ListItem Value="1" Text="1"></asp:ListItem> 
                    <asp:ListItem Value="2" Text="2"></asp:ListItem> 
                    <asp:ListItem Value="3" Text="3"></asp:ListItem> 
                    <asp:ListItem Value="4" Text="4"></asp:ListItem> 
                    <asp:ListItem Value="5" Text="5"></asp:ListItem> 
                    <asp:ListItem Value="6" Text="6"></asp:ListItem> 
                    <asp:ListItem Value="7" Text="7"></asp:ListItem> 
                    <asp:ListItem Value="8" Text="8"></asp:ListItem> 
                    <asp:ListItem Value="9" Text="9"></asp:ListItem> 
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>
                </asp:DropDownList>
              </div>
            </div>
            <div class="form_row_search fl">
              <label class="left_row_search">Họ tên:</label>
              <input name="fullname" type="text" id="txtfullname" placeholder="Nguyen Van A" runat="server" />
            </div>
            <div class="form_row_search fl">
              <label class="left_row_search">Email:</label>
              <input name="email" type="text" id="txtemail" placeholder="nguyenvana@gmail.com"  runat="server"/>
            </div>
            <div class="form_row_search fl">
              <label class="left_row_search">Điện thoại:</label>
              <input name="phonenumber" type="text" id="txtphonenumber" placeholder="(+84)"  runat="server"/>
            </div>
            <div class="form_row_search butonsearch fl">
              <asp:Button ID="btnSubmit" runat="server" Text="Đặt Phòng" CssClass="btn_web" 
                    onclick="btnSubmit_Click" />
            </div>
          </div>
        </div>
        <!--end Search Hotel-->
        <!--Ads Right Hotel-->
        <div class="box ads"> 
        <%--<asp:Repeater ID="rptBox" runat="server">
            <ItemTemplate>
                <li>
                <%# GetImageBox(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"))%>
                </li>
            </ItemTemplate>
        </asp:Repeater>--%>
        <ul>
        <asp:Repeater ID="rptListHotelPromotion" runat="server">
                <ItemTemplate>
                <li>
                <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" />
                </a>
                <h3><a title="<%# Eval("NEWS_TITLE") %>" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h3>
                <span><%# GetShortName(Eval("NEWS_DESC"), 135)%></span>                
                </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
        </div>
        <!--end Ads Right Hotel-->
      </div>