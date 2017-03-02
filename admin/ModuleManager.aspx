<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuleManager.aspx.cs"
    Inherits="We7.CMS.Web.Admin.ModuleManager" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:content id="Content1" contentplaceholderid="MyContentPlaceHolder" runat="server">
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="模块管理">
        </asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="管理设置各栏目可用的模块" >
            </asp:Label>
        </span>
    </h2>
    <div id="position">
        <asp:Literal ID="PagePathLiteral" runat="server"><a href="/admin/system.aspx">设置</a>>>模块管理</asp:Literal>
    </div>
    <WEC:MessagePanel runat="Server" ID="Messages">
    </WEC:MessagePanel>
   <div class="toolbar" style="margin:0 0 0 0">
        <asp:HyperLink ID="NewHyperLink" NavigateUrl="ModuleAdd.aspx" runat="server">
            添加模块</asp:HyperLink>
        <asp:HyperLink ID="RefreshHyperLink" NavigateUrl="ModuleManager.aspx" runat="server">
            刷新</asp:HyperLink>
    </div>
    <div style="">
        <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" 
            CssClass="List" DataKeyNames="ID"  GridLines="Horizontal" OnRowEditing="gvList_OnRowEditing" OnRowDeleting="gvList_OnRowDeleting" ShowFooter="True">
            <Columns>
                 <asp:TemplateField HeaderText="名称"  ItemStyle-Width="50px">
                    <ItemTemplate>
                        <%# Eval("Title") %>
                    </ItemTemplate>
                </asp:TemplateField>                 
                <asp:TemplateField HeaderText="地址" ItemStyle-Width="200px">
                    <ItemTemplate>
                    <%# Eval("Path") %>
                    </ItemTemplate>
                </asp:TemplateField>      
                <asp:TemplateField HeaderText="操作" ItemStyle-Width="200px">
                    <ItemTemplate>
                         <asp:LinkButton ID="EditButton" CommandName="Edit" runat="server" Text="编辑" />
                         <asp:LinkButton ID="DeleteLinkButton" CommandName="Delete" runat="server" Text="删除" />
                    </ItemTemplate>
                </asp:TemplateField>           
            </Columns>
        </asp:GridView>
    </div>
     <div class="pagination">
        <p>
            <WEC:Pager ID="Pager" PageSize="13" PageIndex="0" runat="server" />
        </p>
    </div>
</asp:content>
