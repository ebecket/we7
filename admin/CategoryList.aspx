<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryList.aspx.cs" Inherits="We7.CMS.Web.Admin.CategoryList" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:content id="We7Content" contentplaceholderid="MyContentPlaceHolder" runat="server">
    <base target="_self" />

    <script src="<%=AppPath%>/cgi-bin/DialogHelper.js" type="text/javascript"></script>

    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="类别数据项管理">
        </asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="数据项是类别的组成部份。">
            </asp:Label>
        </span>
    </h2>
        <div id="position">
        <a href="CatTypeMgr.aspx">自定义类别</a>></div>
    <div class="toolbar">
                <li>
                <a href="CategoryEdit.aspx?typeId=<%=TypeID %>">新建项</a>
        </li>
         <li>
                <a href="CatTypeMgr.aspx">类别管理</a>
        </li>
        
<%--                <li>
           <asp:LinkButton ID="lnkEdit" runat="server" Text="编辑"></asp:LinkButton>
        </li>
        <li>
            <asp:LinkButton ID="lnkDel" runat="server" Text="删除"></asp:LinkButton>
        </li>--%>

    </div>
    <div style="display: table; width: 100%">
        <p class="search-box">
        </p>
    </div>
    <WEC:MessagePanel runat="Server" ID="Messages">
    </WEC:MessagePanel>
    <div>
        <asp:GridView ID="DataGridView" runat="server" AutoGenerateColumns="False" Width="100%"
            ShowFooter="True" CssClass="List" GridLines="Horizontal" DataKeys="ID">
            <Columns>
               
                <asp:BoundField DataField="Name"  ItemStyle-Width="200px" HeaderText="类别名称" />
                <asp:BoundField DataField="Keyword" ItemStyle-Width="200px" HeaderText="标识符" />
                <asp:BoundField DataField="Index" ItemStyle-Width="50px" HeaderText="排序" />
                <asp:BoundField DataField="Description" HeaderText="描述" />
                 <asp:TemplateField HeaderText="管理" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" CommandArgument='<%# Eval("ID") %>' CommandName="ed" runat="server" Text="修改"></asp:LinkButton>
                        <asp:LinkButton ID="lnkDel" CommandArgument='<%# Eval("ID") %>' CommandName="del" runat="server" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="pagination">
        <p>
            <WEC:Pager ID="AdvicePager" PageSize="15" PageIndex="0" runat="server"/>
        </p>
    </div>
</asp:content>
