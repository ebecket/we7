<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Default.Include/Static.Default.Include.ascx"
    TagName="Static_Include" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Header/Header.Default/Header.Default.ascx"
    TagName="Header" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Footer/Footer.Default/Footer.Default.ascx"
    TagName="Footer" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Article/Article.Default.List/Article.Default.SlideList.ascx"
    TagName="Article_SlideList" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Article/Article.Default.View/Article.AlbumView.ascx"
    TagName="Article_AlbumView" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Default.SideMenu/Static.Default.SideMenu.ascx"
    TagName="Static_SideMenu" TagPrefix="wew" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <wew:Static_Include filename="/Widgets/WidgetCollection/Static/Static.Include/Static.Include.ascx"
        runat="server"></wew:Static_Include>
</head>
<body>
<div id="wrap">
        <wew:Header ID="header" runat="server" CssClass="header"></wew:Header>
        <div id="main_wrap">
            <div id="main">
                <div id="main_full">
                    <wew:Article_AlbumView ID="detail" CssClass="module detail Album" pager-requestpageindex="page"
                        pager-vmtemplatefilename="/Widgets/WidgetCollection/Article/Article.PagedList/pager.vm"
                        pager-pagerdivclass="pager" pager-pagerspanclass="pager-span" pager-pagesize="30"
                        runat="server"></wew:Article_AlbumView>
                    <div class="auto">
                    </div>
                </div>
                <div class="auto">
                </div>
            </div>
        </div>
        <wew:Footer ID="footer" runat="server" CssClass="footer"></wew:Footer>
    </div>
</body>
</html>
