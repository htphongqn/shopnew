﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="vpro.eshop.cpanel.FileManager.Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="css/ui-lightness/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .hide
        {
            display:none;
        }
    </style>
</head>
<body>
       <form id="form1" runat="server">
    <div class="ui-widget-content" style="height:65px;border-right:0px;" >
    <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" /> 
    <asp:Button ID="bntUpload" runat="server" Text="upload" 
        onclick="bntUpload_Click" />   
    <span runat="server" style="font-weight:bold;color:Red" id="spanerror"></span>
    <asp:TextBox CssClass="hide" ID="txtPath" runat="server"></asp:TextBox>
    </div>
    </form>
</body>
</html>