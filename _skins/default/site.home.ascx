<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Default.Include/Static.Default.Include.ascx"
    TagName="Static_Include" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Default.IE6/Static.Default.IE6.ascx"
    TagName="Static_IE6" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Header/Header.Default/Header.Default.ascx"
    TagName="Header" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Default.SubMenu/Static.Default.SubMenu.ascx"
    TagName="Static_SubMenu" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Article/Article.Default.List/Article.Default.SlideList.ascx"
    TagName="Article_SlideList" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Lecture/Lecture.Default.List/Lecture.Default.List.ascx"
    TagName="Lecture_List" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Article/Article.Default.List/Article.Default.List.ascx"
    TagName="Article_List" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Article/Article.Default.List/Article.Default.HeadlineList.ascx"
    TagName="Article_HeadlineList" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Article/Article.Default.List/Article.Default.HeadList.ascx"
    TagName="Article_HeadList" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Article/Article.Default.List/Article.Default.PicList.ascx"
    TagName="Article_PicList" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Link/Link.Default.List/Link.Default.List.ascx"
    TagName="Link_List" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Footer/Footer.Default/Footer.Default.ascx"
    TagName="Footer" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Article/Article.Default.List/Article.Default.TabList.ascx"
    TagName="Article_TabList" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Lecture/Lecture.Default.List/Lecture.Default.TabList.ascx"
    TagName="Lecture_TabList" TagPrefix="wew" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <wew:Static_Include ID="include" runat="server"></wew:Static_Include>
</head>
<body id="home">
    <div id="wrap">
        <wew:Static_IE6 ID="ie6" runat="server"></wew:Static_IE6>
        <wew:Header ID="header" runat="server" CssClass="header"></wew:Header>
        <div id="main">
            <div id="sub_wrap">
                <%--首页大图--%>
                <wew:Article_SlideList ID="slide" includechildren="False" ownerid="{125040bd-d0b2-4b4d-a948-3ae26b951d1d}"
                    CssClass="slide" titlelength="70" pagesize="6" runat="server" thumbnailtag="slide">
                </wew:Article_SlideList>
            </div>
            
            <div id="left">
                    <%--学术模块--%>
                    <wew:Article_TabList ID="notice" ownerid1="{cfb582d1-a2cb-4567-a137-0ef5f20aa29d}" ownerid2="{bacda8e1-1387-4cd3-88f0-bbc0f0d17e3a}"
                        ownerid3="{0e3e6551-a6fb-4010-86c0-771e2e3737db}" ownerid4="{9252207f-1a56-419c-b703-a72bd0d7de7f}"
                        dateformat="MM-dd" includechildren="False" titlelength="48" summarylength="60"
                        CssClass="module tabs notice" pagesize="20" runat="server" thumbnailtag="en-news">
                    </wew:Article_TabList>
                    <div class="auto">
                    </div>
                </div>
            <div id="center">
                 <%--最新消息--%>
                    <wew:Article_HeadlineList ID="Article_HeadlineList" includechildren="true" ownerid="{a7b16fa2-a58f-4494-ab41-a5fd19410b18}"
                        dateformat="MM-dd" CssClass="module news" titlelength="42" firsttitlelength="30"
                        summarylength="100" pagesize="5" runat="server" thumbnailtag="news"></wew:Article_HeadlineList>
                    <div class="auto">
                    </div>
                   <%--学术讲座--%>
                    <wew:Lecture_TabList ID="tabs" ownerid1="{7d326420-7905-4847-850d-3a4573a00d53}"
                        ownerid2="{26b34e98-6134-4882-be42-f7484159fdad}" DateFormat="MM-dd" IncludeChildren="False"
                        titlelength="42" CssClass="module tabs events" PageSize="5" runat="server" ThumbnailTag="news">
                    </wew:Lecture_TabList>
                </div>
            <div id="right">
                    <%--名课--%>
                    <wew:Article_HeadlineList ID="Article_HeadlineList1" includechildren="true" ownerid="{d51716ae-598e-49ed-8b0b-49408a270032}"
                        dateformat="MM-dd" CssClass="module famous" titlelength="26" firsttitlelength="26"
                        summarylength="70" pagesize="5" runat="server" thumbnailtag="magazine"></wew:Article_HeadlineList>
                    <%--研究人员--%>
                    <wew:Article_PicList ID="view" includechildren="false" ownerid="{e312f66b-6bac-4ee5-ad0b-b686e3db384a}"
                        dateformat="MM-dd" CssClass="module view" titlelength="34" pagesize="12" runat="server"
                        thumbnailtag="head"></wew:Article_PicList>
                    <%--科研平台--%>
                     <wew:Article_HeadList ID="database" includechildren="true" ownerid="{1fcdf8eb-cfe5-4267-9cad-c4b80f12bcc2}"
                        dateformat="MM-dd" CssClass="module database" titlelength="50" firsttitlelength="60"
                        summarylength="120" pagesize="6" runat="server" thumbnailtag="news"></wew:Article_HeadList>
                    
                    <%--相关链接--%>
                    <wew:Link_List ID="link" CssClass="module link" titlelength="60" runat="server" pagesize="12">
                    </wew:Link_List>
                    <div class="auto"> </div>
                </div>
                <div class="auto">
                </div>            
            
        </div>
        <wew:Footer ID="footer" runat="server" CssClass="footer"></wew:Footer>
    </div>
</body>
</html>
