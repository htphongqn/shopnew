<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer_ch.ascx.cs" Inherits="CatTrang.UIs.footer_ch" %>

<footer>
    <div class="fullsize fl" id="copyright">Diamondbaycity版权所有© 2015年保留所有权利<div>
    <!--Access Static-->
    <div class="fullsize fr" id="access_static">在线: <b><asp:Literal EnableViewState="false" runat="server" ID="lblOnline" /></b><span class="split_line"></span>计数器: <b><asp:Literal EnableViewState="false" runat="server" ID="lblSum" /></b></div>
</footer>