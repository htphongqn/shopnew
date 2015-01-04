<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer_ru.ascx.cs" Inherits="CatTrang.UIs.footer_ru" %>

<footer>
    <div class="fullsize fl" id="copyright">Diamondbaycity Copyright © 2015 Все права защищены</div>
    <!--Access Static-->
    <div class="fullsize fr" id="access_static">Интернет: <b><asp:Literal EnableViewState="false" runat="server" ID="lblOnline" /></b><span class="split_line"></span>Счетчик: <b><asp:Literal EnableViewState="false" runat="server" ID="lblSum" /></b></div>
</footer>