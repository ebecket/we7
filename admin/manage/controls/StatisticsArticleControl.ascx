<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StatisticsArticleControl.ascx.cs" Inherits="We7.CMS.Web.Admin.StatisticsArticleControl" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>

<asp:Panel ID="PanelContent" runat="server" Width="100%">
<h3>
    访问路径跟踪：</h3>
<asp:GridView ID="GridViewArticle" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="List">
    <Columns>
    <asp:TemplateField Visible="False">
        <ItemTemplate >
            <asp:CheckBox ID="chkItem" runat="server" />
            <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField DataField="TimeNote" HeaderText="访问时间" >
        <ItemStyle Width="70px" />
    </asp:BoundField>
   
       <asp:HyperLinkField DataNavigateUrlFields="Url" DataNavigateUrlFormatString="{0}"
        DataTextField="Url" DataTextFormatString="{0}" HeaderText="页面" Target="_blank" >
    <ItemStyle Width="400px" /> 
    </asp:HyperLinkField>  
   <asp:HyperLinkField DataNavigateUrlFields="Url" DataNavigateUrlFormatString="{0}"
        DataTextField="ArticleName" DataTextFormatString="{0}" HeaderText="栏目/文章名称" Target="_blank" >
    </asp:HyperLinkField>
    </Columns>
</asp:GridView>
<div style="display:none">
<asp:CheckBox ID="AllCheckBox" runat="server" AutoPostBack="true" Text="" OnCheckedChanged="AllCheckBox_CheckedChanged" />全选&nbsp;&nbsp;
<asp:LinkButton ID="lBtnDelete" runat="server" OnClick="lBtnDelete_Click">删除</asp:LinkButton>
</div>
<div class="pagination">
    <p>
        <WEC:Pager ID="Pager" PageSize="25" PageIndex="0" runat="server" OnFired="Pager_Fired" />
    </p>
</div>
</asp:Panel>
<asp:Label ID="lblNoRecord" runat="server" Text=""></asp:Label>