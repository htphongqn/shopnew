<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer_en.ascx.cs" Inherits="CatTrang.UIs.footer_en" %>

<footer>
    <div class="fullsize fl" id="copyright">Diamondbaycity Copyright © 2015. All right reserved</div>
    <!--Access Static-->
    <div class="fullsize fr" id="access_static">Online: <b><asp:Literal EnableViewState="false" runat="server" ID="lblOnline" /></b><span class="split_line"></span>Total: <b><asp:Literal EnableViewState="false" runat="server" ID="lblSum" /></b></div>
</footer>