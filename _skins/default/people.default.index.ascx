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
<%@ Register Src="/Widgets/WidgetCollection/People/People.Default.PagedList/People.DefaultBy2.PagedList.ascx"
    TagName="People_PagedList" TagPrefix="wew" %>
<%@ Register Src="/Widgets/WidgetCollection/Static/Static.Default.SideMenu/Static.Faculty.SideMenu.ascx"
    TagName="Static_SideMenu" TagPrefix="wew" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <wew:Static_Include runat="server"></wew:Static_Include>
</head>
<body>
    <div id="wrap">
        <wew:Header ID="header" runat="server" CssClass="header"></wew:Header>
        <div id="main_wrap">
            <div id="main">
                <%--<wew:Article_SlideList ID="inner_slide" includechildren="False" ownerid="{4058bc36-07dd-4c8b-8c34-742381bbcb44}"
                    CssClass="inner_slide" titlelength="70" pagesize="3" runat="server" thumbnailtag="inner-slide">
                </wew:Article_SlideList>--%>
                <div id="main_full">
                    <div class="module nav faculty_nav">
                        <h1>
                            <span class="title title_arr first"><a class="txt" href="javascript:void(0);">学院人员</a><em class="arrow-right"></em></span>
                            <span class="title"><a class="txt" href="javascript:void(0);">教学科研人员</a></span>
                        </h1>
                    </div>
                </div>
                <div id="main_right">
                    <wew:Static_SideMenu ID="side_menu" CssClass="sub_menu" runat="server"></wew:Static_SideMenu>
                </div>
                <div id="main_inner">
                    <wew:People_PagedList ID="paged_list" CssClass="module paged_list faculty_paged_list"
                        pager-pagesize="500" titlelength="80" IncludeChildren="False" DateFormat="yyyy-MM-dd"
                        pager-requestpageindex="page" pager-vmtemplatefilename="/Widgets/WidgetCollection/Article/Article.Default.PagedList/pager.vm"
                        EncodeQueryParam="true" pager-pagerdivclass="pager_container" pager-pagerspanclass="pager"
                        runat="server" QueryByColumn="true" QueryParam="Cate&Subject"></wew:People_PagedList>
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
