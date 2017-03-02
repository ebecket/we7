<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatisticsDetail.aspx.cs" Inherits="We7.CMS.Web.Admin.StatisticsDetail" %>

<%@ Register Src="controls/StatisticsUserDetailControl.ascx" TagName="StatisticsUserDetailControl"
    TagPrefix="uc1" %>
<%@ Register Src="controls/StatisticsArticleControl.ascx" TagName="StatisticsArticleControl"
    TagPrefix="uc2" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">

   <style>
   td
   {
   word-break:break-all;
	table-layout:fixed;
	}
	
   </style>  
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_tools.gif" />
        <asp:Label ID="NameLabel" runat="server" Text="流量与访问统计管理"> </asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="用户访问踪迹" >
            </asp:Label>
        </span>
    </h2>
    <div class="toolbar">
        
        <asp:HyperLink ID="HyperLink1" NavigateUrl="javascript:history.back();" runat="server">
            返回
        </asp:HyperLink>
    </div>
    <div>
        <uc1:StatisticsUserDetailControl ID="StatisticsUserDetailControl1" runat="server" />
        <br />
        <uc2:StatisticsArticleControl ID="StatisticsArticleControl1" runat="server" />
        
    </div>
    <div style="display: none">
        <asp:Button ID="BtnDelete" runat="server" Text="删除" OnClick="BtnDelete_Click" />
        
    </div>
</asp:Content>