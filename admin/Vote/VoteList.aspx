<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteList.aspx.cs" Inherits="We7.CMS.Web.Admin.VoteList"
    MasterPageFile="../theme/classic/content.Master" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="/Admin/theme/classic/css/article.css"
        media="screen" />
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="投票管理">
        </asp:Label>
        <span class="summary"></span>
    </h2>
    <!--导航路径-->
    <div id="position">
        <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/Vote/VoteList.aspx'>投票管理
        </a>
    </div>
    <!--消息-->
    <WEC:MessagePanel ID="Msg" runat="server" Width="900px">
    </WEC:MessagePanel>
    <div class="toolbar">
        <asp:HyperLink ID="NewHyperLink" NavigateUrl="~/admin/Vote/VoteEdit.aspx?action=add"
            runat="server">
            新建投票</asp:HyperLink>
        <asp:HyperLink ID="RefreshHyperLink" NavigateUrl="~/admin/Vote/VoteList.aspx"
            runat="server">刷新</asp:HyperLink>
        <%-- <asp:HyperLink ID="SubjectLink" NavigateUrl="~/admin/ScoreManager/ScoreSubjectList.aspx"
            runat="server">主题管理</asp:HyperLink>     --%>
    </div>
    <div class="list">
        <asp:GridView ID="VotesGridView" runat="server" AutoGenerateColumns="False" CssClass="List"
            EmptyDataText="暂无数据!" CellPadding="0" CellSpacing="0" Width="100%" 
            onrowcreated="VotesGridView_RowCreated">
            <Columns>
                <asp:TemplateField HeaderText="序号">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:BoundField HeaderText="标题" DataField="Title" />
                <asp:BoundField HeaderText="选项类型" DataField="OptionTypeString" />
                <asp:BoundField HeaderText="添加日期" DataField="AddDate" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField HeaderText="截止日期" DataField="EndDate" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <a href="/admin/Vote/VoteEdit.aspx?ID=<%# Eval("ID") %>">编辑</a>|
                        <asp:LinkButton ID="deleteButton" runat="server" OnClientClick="return confirm('确认删除？');"
                            OnCommand="onLineButton_Click" Text="删除" CommandArgument='<%# Eval("ID") %>'
                            CommandName="DeleteSubject" />
                            |<a target="_blank" href="/admin/Vote/VoteResult.aspx?ID=<%# Eval("ID") %>">查看结果</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="pagination">
        <p>
            <WEC:Pager ID="Pager" PageSize="15" PageIndex="0" runat="server" OnFired="Pager_Fired" />
        </p>
    </div>
</asp:Content>
