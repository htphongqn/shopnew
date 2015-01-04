<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteEn.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="CatTrang.en_us.order" %>
<%@ Register src="~/UIs/projectsLeft_en.ascx" tagname="projectsLeft_vi" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="padding10">
      <div class="path"><a href="/home.html">Home</a> &raquo; <a href="/en/order.html">ORDER PROJECT</a></div>
      <!--Main Column-->
      <div class="fr" id="main_col">
        <!--Order Project-->
        <link href="../Styles/contact.css" rel="stylesheet" type="text/css" />
        <div class="box">
          <div class="box_Tab">Order Project</div>
          <!--Form Order-->
          <div class="fullsize form_web" id="order_project">
            <div class="row_account">
              <label class="item_title">Project:</label>
              <asp:DropDownList ID="ddlProjects" runat="server" DataTextField="NEWS_TITLE" DataValueField="NEWS_ID" CssClass="inputbox">
              </asp:DropDownList>
            </div>
            <div class="row_account">
              <label class="item_title">Company name:</label>
              <input type="text" class="inputbox" id="txtCompanyname" runat="server" name="txtcompanyname" placeholder="Please enter the company name">
            </div>
            <div class="row_account">
              <label class="item_title">Fullname:<span class="required">*</span></label>
              <input type="text" class="inputbox" id="txtFullname" runat="server" name="txtFullname" placeholder="Please enter the fullname">
              <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Please enter the fullname"
                            ControlToValidate="txtFullname" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
              <label class="item_title">Address:</label>
              <input type="text" class="inputbox" id="txtAddress" runat="server" name="txtAddress" placeholder="Please enter the address">
            </div>
            <div class="row_account">
              <label class="item_title">Phone:<span class="required">*</span></label>
              <input type="text" class="inputbox" id="txtPhone" runat="server" name="txtPhone" placeholder="Please enter the phone">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter the phone"
                            ControlToValidate="txtPhone" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
              <label class="item_title"> Email:<span class="required">*</span></label>
              <input type="text" class="inputbox" id="txtEmail" runat="server" name="ctl00$ContentPlaceHolder1$txtEmail" placeholder="Please enter the email">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter the email"
                            ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
              <label class="item_title">Note:<span class="required">*</span></label>
              <textarea rows="10" cols="45" id="txtContent" name="ctl00$ContentPlaceHolder1$txtContent" runat="server" class="inputbox"></textarea>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter the note"
                            ControlToValidate="txtContent" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
              <label class="item_title"> Captcha:<span class="required">*</span></label>
              <input type="text" class="inputbox" id="txtCapcha" runat="server" name="txtCapcha" style="float: left; width: 46%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter the captcha"
                            ControlToValidate="txtCapcha" Display="Dynamic" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              <asp:Image ID="Image1" runat="server" ImageUrl="~/vi-vn/CImage.aspx" height="35px"  style="float: left; margin-left: 10px; width: 42%; height:32px"/>
              <div class="btn_form row_account"> 
              <asp:Label ID="lblresult" runat="server"></asp:Label>
              <asp:LinkButton ID="Lbthanhtoan" runat="server" class="btn_web send_cmt" OnClick="Lbthanhtoan_Click"
                            ValidationGroup="G40">Sent</asp:LinkButton>
              <a class="btn_web send_cmt reset_btn" onclick="reset();" href="javascript:void(0)"> Reset</a> 
              </div>
            </div>
          </div>
          <!--End Form Contact-->
                  <div style="text-align: center">
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G40" />
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Email is invalid" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
                  <br />
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone"
                        ErrorMessage="Phone is invalid" SetFocusOnError="True" ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$"
                        ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
                  <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </div>
        </div>
        <!--End Order Project-->
      </div>
      <!--End Main Column-->
      <!--Sidebar-->
      <uc2:projectsLeft_vi ID="projectsLeft_vi1" runat="server" />      
      <!--End Sidebar-->
    </div>
    <script type="text/javascript">
        function reset() {
            var companyname = document.getElementById("<%= txtCompanyname.ClientID %>");
            var name = document.getElementById("<%= txtFullname.ClientID %>");
            var email = document.getElementById("<%= txtEmail.ClientID %>");
            var add = document.getElementById("<%= txtAddress.ClientID %>");
            var desc = document.getElementById("<%= txtContent.ClientID %>");
            var phone = document.getElementById("<%= txtPhone.ClientID %>");
            var content = document.getElementById("<%= txtContent.ClientID %>");
            var capcha = document.getElementById("<%= txtCapcha.ClientID %>");
            companyname.value = name.value = email.value = add.value = desc.value = phone.value = content.value = capcha.value = "";
        }
    </script>
</asp:Content>
