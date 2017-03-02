<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Default.Include/Static.Default.Include.ascx"
    TagName="Static_Include" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Default.IE6/Static.Default.IE6.ascx"
    TagName="Static_IE6" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Header/Header.Default/Header.Default.ascx"
    TagName="Header" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Footer/Footer.Default/Footer.Default.ascx"
    TagName="Footer" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Article/Article.Default.List/Article.Default.SlideList.ascx"
    TagName="Article_SlideList" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Article/Article.Default.PagedList/Article.Default.PagedList.ascx"
    TagName="Article_PagedList" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Default.SideMenu/Static.Doctor.SideMenu.ascx"
    TagName="Static_SideMenu" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Doctor.Nav/Static.Doctor.Nav.ascx"
    TagName="Static_Nav" TagPrefix="wew" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <wew:Static_Include runat="server"></wew:Static_Include>
</head>
<body>
    <div id="wrap">
        <wew:Header ID="header" runat="server" CssClass="header"></wew:Header>
        <div id="main_wrap">
            <div id="main">
                <div id="main_full">
                    <wew:Static_Nav ID="Static_Nav" CssClass="module nav" runat="server"></wew:Static_Nav>
                </div>
                <div id="main_right">
                    <wew:Static_SideMenu ID="side_menu" CssClass="sub_menu" runat="server"></wew:Static_SideMenu>
                </div>
                <div id="main_inner">
                    <wew:Article_PagedList ID="paged_list" CssClass="module paged_list doctor_paged_list"
                        pager-pagesize="20" titlelength="80" includechildren="False" dateformat="yyyy-MM-dd"
                        pager-requestpageindex="page" pager-vmtemplatefilename="/Widgets/WidgetCollection/Article/Article.Default.PagedList/pager.vm"
                        pager-pagerdivclass="pager_container" pager-pagerspanclass="pager" runat="server">
                    </wew:Article_PagedList>
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
