<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer_vi.ascx.cs" Inherits="CatTrang.UIs.footer_vi" %>

<footer>
    <div class="fullsize fl" id="copyright">Diamondbaycity Copyright © 2015. All right reserved</div>
    <!--Access Static-->
    <div class="fullsize fr" id="access_static">Đang online: <b><asp:Literal EnableViewState="false" runat="server" ID="lblOnline" /></b><span class="split_line"></span>Lượt truy cập: <b><asp:Literal EnableViewState="false" runat="server" ID="lblSum" /></b></div>
</footer>