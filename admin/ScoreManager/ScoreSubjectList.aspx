<%@ Page Language="C#" MasterPageFile="../theme/classic/content.Master" AutoEventWireup="true" CodeBehind="ScoreSubjectList.aspx.cs" Inherits="We7.CMS.Web.Admin.ScoreManager.ScoreSubjectList" Title="无标题页" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
<link rel="stylesheet" type="text/css" href="/Admin/theme/classic/css/article.css" media="screen" />  
    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="积分主题管理">
        </asp:Label>
        <span class="summary">
           <%-- <asp:Label ID="SummaryLabel" runat="server" Text="积分主题管理说明">
            </asp:Label>--%>
        </span>
    </h2>
    <!--导航路径-->
    <div id="position" >
        <a href='/admin/' target='_parent'>开始</a> > 
        <a href='/admin/scoremanager/ScoreSubjectList.aspx'>积分主题管理 </a>
    </div>
    <!--消息-->
    <WEC:MessagePanel ID="Msg" runat="server" Width="900px">
    </WEC:MessagePanel>
  <div class="toolbar">
        <asp:HyperLink ID="NewHyperLink" NavigateUrl="~/admin/ScoreManager/EditScoreSubject.aspx?action=add"
            runat="server">
            新建主题</asp:HyperLink>
        <asp:HyperLink ID="RefreshHyperLink" NavigateUrl="~/admin/ScoreManager/ScoreSubjectList.aspx"
            runat="server">刷新</asp:HyperLink>
       <%-- <asp:HyperLink ID="SourceLink" NavigateUrl="~/admin/ScoreManager/ScoreSourceList.aspx"
            runat="server">来源管理</asp:HyperLink>        --%>    
    </div>
    <div class="list">
        <asp:GridView ID="SubjectsGridView" runat="server" AutoGenerateColumns="False"
                 CssClass="List" EmptyDataText="暂无数据!" CellPadding="0" CellSpacing="0" Width="100%">
            <Columns>
                <asp:TemplateField HeaderText="序号">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>        
                <asp:TemplateField HeaderText="主题类别">
                    <ItemTemplate>
                        <%# GetSubjectType(Eval("IsGrade")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="主题显示名称" DataField="Title" />        
                <asp:BoundField HeaderText="主题名称" DataField="Name" />
                <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                         <a href="/admin/ScoreManager/EditScoreSubject.aspx?id=<%# Eval("ID") %>">编辑</a>|
                         <asp:LinkButton ID="deleteButton" runat="server" 
                            OnClientClick="return confirm('确认删除？');" OnCommand="onLineButton_Click" 
                            Text="删除" CommandArgument='<%# Eval("ID") %>' CommandName="DeleteSubject" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

