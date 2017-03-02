<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/theme/classic/content.Master"
    CodeBehind="StrateList.aspx.cs" Inherits="We7.CMS.Web.Admin.StrateList" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="/Admin/theme/classic/css/article.css"
        media="screen" />

    <script type="text/javascript">
        function doDelete() {
            return confirm("您确认要把选中的策略删除吗？");
        }

        function selectAll(checked) {
            var items = document.getElementsByName("SelectedCheckBox");

            for (var i = 0; i < items.length; i++) {
                items[i].checked = checked;
            }
        }
    </script>

    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="IP策略管理">
        </asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="对信任IP与非法IP进行配置从而形成策略。根据文章，栏目，常规中所选中的策略对系统所允许的IP进行限制。">
            </asp:Label>
        </span>
    </h2>
    <div id="position">
        <asp:Literal ID="PagePathLiteral" runat="server"><a href="/admin/system.aspx">设置</a>>>IP策略管理>>IP策略列表</asp:Literal>
    </div>
    <WEC:MessagePanel runat="Server" ID="Messages">
    </WEC:MessagePanel>
    <div class="toolbar" style="margin: 0 0 0 0">
        <asp:HyperLink ID="NewHyperLink" NavigateUrl="StrategyDetail.aspx" runat="server">
            新建策略</asp:HyperLink>
        <asp:LinkButton ID="DeleteLinkButton" runat="server" Text="删除" OnClick="DeleteLinkButton_Click"
            OnClientClick="return doDelete();" />
        <asp:HyperLink ID="RefreshHyperLink" NavigateUrl="StrateList.aspx" runat="server">
            刷新</asp:HyperLink>
    </div>
    <div style="display: table; width: 100%">
        <ul class="subsubsub">
            <div style="">
                <asp:LinkButton ID="AllLinkButton" runat="server" Font-Bold="true" Text="全部" OnClick="AllLinkButton_Click" />|<asp:LinkButton
                    ID="EnabledLinkButton" runat="server" Text="启用" OnClick="EnabledLinkButton_Click" />|<asp:LinkButton
                        ID="DenyLinkButton" runat="server" Text="禁用" OnClick="DenyLinkButton_Click" />
            </div>
        </ul>
        <p class="search-box" runat="server" id="searchBox">
            <asp:Label runat="server" ID="lblKeyWords" Text="关键字:"></asp:Label>
            <asp:TextBox ID="txtKeyWords" runat="server" class="search-input"></asp:TextBox>
            <asp:Button ID="bttnQuery" runat="server" Text="　搜索　" class="button" OnClick="bttnQuery_Click"
                UseSubmitBehavior="false" />
        </p>
    </div>
    <div style="min-height: 300px">
        <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CssClass="List"
            GridLines="Horizontal" ShowFooter="True" OnRowCommand="gvList_RowCommand">
            <Columns>
                <asp:TemplateField ItemStyle-Width="20px">
                    <HeaderTemplate>
                        <asp:CheckBox ID="chkAll" runat="server" onclick="selectAll(this.checked)" Text="" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <input type="checkbox" name="SelectedCheckBox" value='<%# Eval("Key") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="Key" DataNavigateUrlFormatString="StrategyDetail.aspx?key={0}"
                    DataTextField="Name" DataTextFormatString="{0}" HeaderText="名称" />
                <asp:TemplateField HeaderText="状态" ItemStyle-Width="50px">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkBttnState" Style='<%# Convert.ToBoolean(Eval("Enable"))?"": "color:#999" %>'
                            runat="server" Text='<%# Convert.ToBoolean(Eval("Enable"))?"启用":"禁用" %>' CommandName="state"
                            CommandArgument='<%# Eval("Key") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="200px">
                    <ItemTemplate>
                        <asp:LinkButton OnClientClick="return doDelete();" ID="lnkBttnDel" runat="server"
                            Text="删除" CommandName="del" CommandArgument='<%# Eval("Key") %>' />
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
</asp:Content>
