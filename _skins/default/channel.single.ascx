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
<%@ Register Src="/Widgets/WidgetCollection/Article/Article.Default.Single/Article.Default.Single.ascx"
    TagName="Article_Single" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Default.SideMenu/Static.Default.SideMenu.ascx"
    TagName="Static_SideMenu" TagPrefix="wew" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <wew:Static_Include filename="/Widgets/WidgetCollection/Static/Static.Include/Static.Include.ascx" runat="server"></wew:Static_Include>
</head>
<body>
    <div id="wrap">
        <wew:Header ID="header" runat="server" CssClass="header"></wew:Header>
        <div id="main_wrap">
            <div id="main">
                <wew:Article_SlideList ID="inner_slide" includechildren="False" ownerid="{4058bc36-07dd-4c8b-8c34-742381bbcb44}"
                    CssClass="inner_slide" titlelength="70" pagesize="3" runat="server" thumbnailtag="inner-slide">
                </wew:Article_SlideList>
                <div id="main_inner">
                    <div id="listleft">
                   <wew:Static_SideMenu ID="side_menu" CssClass="sub_menu" runat="server">
                    </wew:Static_SideMenu>
                    </div>
                    <div id="listright">
                    
                     <wew:Article_Single ID="single" CssClass="module single" runat="server">
                    </wew:Article_Single>
                    </div>
                    <div class="auto">
                    </div>
                </div>
                <div class="auto">
                </div>
                <wew:Footer ID="footer" runat="server" CssClass="footer"></wew:Footer>
            </div>
        </div>
        
    </div>
</body>
</html>
