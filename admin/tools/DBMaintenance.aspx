<%@ Page Language="C#" MasterPageFile="~/Admin/theme/classic/content.Master" AutoEventWireup="true" CodeBehind="DBMaintenance.aspx.cs" Inherits="We7.CMS.Web.Admin.tools.DBMaintenance" Title="无标题页" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
     <link rel="stylesheet" type="text/css" href="<%=ThemePath%>/css/article.css" media="screen" />
    <script src="<%=AppPath%>/cgi-bin/article.js" type="text/javascript"></script>
    <h2 class="title">
    <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_tools.gif" />
        <asp:Label ID="NameLabel" runat="server" Text="数据库维护"></asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="维护当前网站数据库。操作之前，请注意先备份！"></asp:Label>
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
</asp:Content>
