<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatisticsIndex.aspx.cs"
    Inherits="We7.CMS.Web.Admin.StatisticsIndex" MasterPageFile="~/admin/theme/classic/ContentNoMenu.Master" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
<link rel="stylesheet" type="text/css" href="/Admin/theme/classic/css/article.css" media="screen" />
        <h2 class="title">
            <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_user.gif" />
            <asp:Label ID="NameLabel" runat="server" Text="数据统计分析报表——问卷列表">
            </asp:Label>
            <span class="summary">
                <asp:Label ID="SummaryLabel" runat="server" Text="">
                </asp:Label>
            </span>
        </h2>
        <div id="position">
            <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/Questionnaire/QuestionnaireMng.aspx'>问卷管理</a> > 问卷数据统计分析
        </div>
        <div class="toolbar">
            <a href="">刷新</a>            
        </div>
        <WEC:MessagePanel ID="Messages" runat="server">
        </WEC:MessagePanel>
    <div style="display: table; width: 100%">
        <ul class="subsubsub">
            <asp:Literal ID="StateLiteral" runat="server"></asp:Literal>
        </ul>
        <p class="search-box">
            <label class="hidden" for="user-search-input">
                搜索问卷:</label>
            <input type="text" class="search-input" id="KeyWord" name="KeyWord" value="" />
            <input type="button" value="搜索问卷" class="button" id="SearchButton" />
        </p>
    </div>
    <div style="min-height: 35px;">
        <asp:GridView ID="QuestionnaireGridView" runat="server" AutoGenerateColumns="False"
            CssClass="List" GridLines="Horizontal" ShowFooter="True">
            <AlternatingRowStyle CssClass="alter" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="StatisticsSingleQuestion.aspx?QuestionnaireID={0}"
                    DataTextField="Title" DataTextFormatString="{0}" HeaderText="标题">
                    <HeaderStyle Width="200px" />
                </asp:HyperLinkField>
                 <asp:TemplateField>
                    <ItemTemplate>
                        <%#GetTypeName(Eval("TypeID"))%>
                    </ItemTemplate>
                    <HeaderTemplate>
                        所属类别
                    </HeaderTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="创建时间" DataField="Created"></asp:BoundField>
                <asp:BoundField HeaderText="更新时间" DataField="Updated"></asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <%# Eval("State").ToString() == "0" ? "未发布" : "已发布" %>
                    </ItemTemplate>
                    <HeaderTemplate>
                        状态
                    </HeaderTemplate>
                </asp:TemplateField>                
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="StatisticsSingleQuestion.aspx?QuestionnaireID=<%# Eval("ID") %>">统计</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="pagination">
        <WEC:URLPager ID="UPager" runat="server" UseSpacer="False" UseFirstLast="true" PageSize="10"
            FirstText="<< 首页" LastText="尾页 >>" LinkFormatActive='<span class=Current>{1}</span>'
            UrlFormat="Departments.aspx?pg={0}" CssClass="Pager" />
    </div>
    <script type="text/javascript">
        $(function () {
            $('#KeyWord').bind('keyup', function (event) {
                if (event.keyCode == 13) {
                    window.location = "StatisticsIndex.aspx?keyword=" + encodeURIComponent(this.value);
                }
            });
            $('#SearchButton').click(function () {
                window.location = "StatisticsIndex.aspx?keyword=" + encodeURIComponent($('#KeyWord').val());
            });
            if (QueryString('keyword'))
                $('#KeyWord').val(QueryString('keyword'));
        });
    </script>
</asp:Content>
