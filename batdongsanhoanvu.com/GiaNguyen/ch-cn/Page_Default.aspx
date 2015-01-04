<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteCh.Master" AutoEventWireup="true" CodeBehind="Page_Default.aspx.cs" Inherits="CatTrang.ch_cn.Page_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:PlaceHolder ID="phdMain" runat="server"></asp:PlaceHolder>
</asp:Content>
