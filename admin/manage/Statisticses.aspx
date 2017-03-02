<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Statisticses.aspx.cs" Inherits="We7.CMS.Web.Admin.Statisticses" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="<%=ThemePath%>/css/article.css" media="screen" />  

    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_tools.gif" />
        <asp:Label ID="NameLabel" runat="server" Text="流量与访问统计管理">
        </asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="概要一览">
            </asp:Label>
        </span>
    </h2>
    <div id="mycontent">
        <DIV class="Tab menuTab">
        <UL class=Tabs>
          <asp:Label runat="server" ID="MenuTabLabel"></asp:Label>
          </UL>
        </DIV>
          <DIV class=clear></DIV>
        <DIV id=rightWrapper>
        <DIV id=container>
            <asp:PlaceHolder runat="server" ID="ContentHolder" ></asp:PlaceHolder>
        </div>                   
     </div>
    </div>
</asp:Content>