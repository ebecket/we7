<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateStaticize.aspx.cs"
    Inherits="We7.CMS.Web.Admin.manage.TemplateStaticize" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:content id="We7Content" contentplaceholderid="MyContentPlaceHolder" runat="server">
     <link rel="stylesheet" type="text/css" href="<%=ThemePath%>/css/article.css" media="screen" />
    <script src="<%=AppPath%>/cgi-bin/article.js" type="text/javascript"></script>
    <h2 class="title">
    <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_tools.gif" />
        <asp:Label ID="NameLabel" runat="server" Text="管理网站静态内容"></asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="维护网站静态内容，使网站响应速度更快。"></asp:Label>
        </span>
    </h2>
   <div id="mycontent">
        <div class="Tab menuTab">
            <ul class="Tabs">
                <asp:Label runat="server" ID="MenuTabLabel"></asp:Label>
            </ul>
        </div>
        <div class="clear">
        </div>
        <div id="rightWrapper">
            <div id="container" style="display: table">
                <asp:PlaceHolder runat="server" ID="ContentHolder"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</asp:content>
