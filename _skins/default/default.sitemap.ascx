<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Include/Static.Include.ascx"
    TagName="Static_Include" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Header/Header.Default/Header.Default.ascx"
    TagName="Header_Default" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Footer/Footer.Default/Footer.Default.ascx"
    TagName="Footer_Default" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.QuickLink/Static.QuickLink.ascx"
    TagName="Static_QuickLink" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.PicLink/Static.PicLink.ascx"
    TagName="Static_PicLink" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Search/Search.Bar/Search.Bar.ascx" TagName="Search_Bar"
    TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Lecture/Lecture.List/Lecture.List.ascx"
    TagName="Lecture_List" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Recruitment/Static.Recruitment.ascx"
    TagName="Static_Recruitment" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Other/Statistic.Default/Statistic.Default.ascx"
    TagName="Statistic_Default" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Navigation/Navigation.Sitemap/Navigation.Sitemap.ascx"
    TagName="Navigation_Sitemap" TagPrefix="wew" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <wew:Static_Include filename="/Widgets/WidgetCollection/Static/Static.Include/Static.Include.ascx" runat="server"></wew:Static_Include>
</head>
<body>
    <div id="warp">
        <div id="main">
            <wew:Header_Default filename="/Widgets/WidgetCollection/Header/Header.Default/Header.Default.ascx"
                ID="header" runat="server" CssClass="header"></wew:Header_Default>
            <div id="container">
                <div class="left">
                    <wew:Navigation_Sitemap ID="sitemap" CssClass="module single sitemap" filename="/Widgets/WidgetCollection/Navigation/Navigation.Sitemap/Navigation.Sitemap.ascx"
                        runat="server"></wew:Navigation_Sitemap>
                </div>
                <div class="right">
                    <wew:Static_QuickLink ID="quick" CssClass="quick" filename="/Widgets/WidgetCollection/Static/Static.QuickLink/Static.QuickLink.ascx"
                        runat="server"></wew:Static_QuickLink>
                    <wew:Search_Bar ID="search" CssClass="search" filename="/Widgets/WidgetCollection/Search/Search.Bar/Search.Bar.ascx"
                        runat="server"></wew:Search_Bar>
                    <wew:Lecture_List ID="lecture" CssClass="lecture" EncodeQueryParam="False" TitleMaxLength="30"
                        QueryByColumn="False" PageSize="5" OwnerID="{f5a2e63a-9e54-4008-83d6-ab37c572d225}"
                        IncludeChildren="False" ShowAtHome="False" filename="/Widgets/WidgetCollection/Lecture/Lecture.List/Lecture.List.ascx"
                        runat="server"></wew:Lecture_List>
                    <wew:Static_Recruitment ID="recruitment" CssClass="recruitment" filename="/Widgets/WidgetCollection/Static/Static.Recruitment/Static.Recruitment.ascx"
                        runat="server"></wew:Static_Recruitment>
                    <wew:Static_PicLink ID="friend" CssClass="module friend" filename="/Widgets/WidgetCollection/Static/Static.PicLink/Static.PicLink.ascx"
                        runat="server"></wew:Static_PicLink>
                    <wew:Statistic_Default ID="statistic" CssClass="statistic" filename="/Widgets/WidgetCollection/Other/Statistic.Default/Statistic.Default.ascx"
                        runat="server"></wew:Statistic_Default>
                </div>
            </div>
            <wew:Footer_Default filename="/Widgets/WidgetCollection/Footer/Footer.Default/Footer.Default.ascx"
                ID="footer" runat="server" CssClass="footer"></wew:Footer_Default>
        </div>
    </div>
</body>
</html>
