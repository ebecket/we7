<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateGroupEdit.aspx.cs"
    MasterPageFile="~/admin/theme/classic/ContentNoMenu.Master" Inherits="We7.CMS.Web.Admin.TemplateGroupEdit" %>
<%@ Register TagPrefix="WEC" Namespace="We7.CMS.Controls" Assembly="We7.CMS.UI" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
<link media="screen" rel="stylesheet" href="<%=AppPath%>/ajax/jquery/colorbox/colorbox.css" />
<script src="<%=AppPath%>/ajax/jquery/colorbox/jquery.colorbox-min.js"></script>
<script type="text/javascript" src="/Admin/cgi-bin/CheckBrowser.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#button").colorbox({ width: "50%", inline: true, href: "#templateConfigContainer", onClosed: function () { RefreshRpt(); } });
        $(".editAction").colorbox({ width: "70%", height: "80%", iframe: true });
        //$("#createVisualTemplate").colorbox({width:"70%", height:"80%", iframe:true});
        $("#createVisualTemplate").colorbox({ width: "50%", inline: true, href: "#VisualTemplateContainer", onClosed: function () { RefreshRpt(); } });
    });
</script>
<style>
#templateConfigContainer h3 { margin-top:15px;}
</style>
    <link rel="stylesheet" type="text/css" href="<%=ThemePath%>/css/article.css" media="screen" />
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="�༭ģ����">
        </asp:Label>
        <span class="summary">
        </span>
    </h2>
    <div>
    <table><tr>
    <td><asp:Image runat="server" ID="GroupImage" Height="180" Width="220" /></td>
    <td valign="top"> <asp:Label ID="SummaryLabel" runat="server" Text="">
            </asp:Label>
            <br /><br />
            ������<asp:Label ID="CreatedLabel" runat="server" Text="">
            </asp:Label>
             <div class="toolbar"
            <li class="smallButton4">
            <asp:HyperLink ID="EditHyperLink" class='editAction'  NavigateUrl="#"
                runat="server">
                 �޸�</asp:HyperLink></li></div>
            </td>
    </tr></table>
    </div>
    <div class="toolbar" style="display: <%=ToolbarVisible%>">
        <li class="smallButton6"  id="NewSpan">
        <div>
            <a href="#"  id="button">�½�ģ�娋</a></div>
        </li>
         <li class="smallButton8" >
            <a href="TemplateFileDetail.aspx"  id="createVisualTemplate">�½����ӻ�ģ�娋</a>
        </li>
        <li class="smallButton4">
            <asp:HyperLink ID="NewSubHyperLink"   runat="server">
                 �½���ģ��</asp:HyperLink></li>
        <li class="smallButton4">
            <asp:HyperLink ID="NewMasterPageHyperLink"    runat="server">
                 �½�ĸ��</asp:HyperLink></li>
        <li class="smallButton6">
            <asp:HyperLink ID="FilesHyperLink" NavigateUrl="/Admin/FileManagement.aspx" runat="server">
                 ģ���ļ�Ŀ¼</asp:HyperLink></li>
        <li class="smallButton8">
            <asp:LinkButton runat="server" ID="CreateMapLink" OnClick="CreateMapLink_Click">�ؽ�ģ������ͼ</asp:LinkButton></li>
       <%-- <li class="smallButton8">
            <asp:LinkButton runat="server" ID="CreateControlIndex" OnClick="CreateControlIndex_Click">�ؽ��ؼ�����</asp:LinkButton></li>--%>
        <li class="smallButton8">
            <asp:LinkButton runat="server" ID="CreateWidgetIndex" OnClick="CreateWidgetIndex_Click">�ؽ���������</asp:LinkButton></li>
            <li class="smallButton8">
            <asp:LinkButton runat="server" ID="CreateThemeIndex" OnClick="CreateThemeIndex_Click">�ؽ���������</asp:LinkButton></li>
        <li class="smallButton4">
            <asp:HyperLink ID="RefreshHyperLink"    runat="server">
                 ˢ��</asp:HyperLink></li>
    </div>
    <br />
    <div style="clear:both"></div>
    <WEC:MessagePanel ID="Messages" runat="server">
    </WEC:MessagePanel>
    <div>
        <asp:PlaceHolder runat="server" ID="ContentHolder"></asp:PlaceHolder>
    </div>
    <div style='display:none'>
    <div id="templateConfigContainer" >
    <asp:Literal runat="server" ID="TemplateConfigLiteral" ></asp:Literal>
    </div>
    <div id="VisualTemplateContainer" >
    <asp:Literal runat="server" ID="VisualTemplateConfigLiteral" ></asp:Literal>
    </div>
    </div>
</asp:Content>