<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteEdit.aspx.cs" Inherits="We7.CMS.Web.Admin.VoteEdit"
    MasterPageFile="../theme/classic/content.Master" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <script src="/Admin/Ajax/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="<%=ThemePath%>/css/jquery.easywidgets.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="<%=ThemePath%>/css/mywidgets.css" />
    <script src="<%=ThemePath%>/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="<%=ThemePath%>/js/jquery.easywidgets.js" type="text/javascript"></script>
    <script src="<%=ThemePath%>/js/mywidgets.js" type="text/javascript"></script>
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
        </a>> <a href="<%= CurrRequest %>">投票编辑</a>
    </div>
    <!--消息-->
    <WEC:MessagePanel ID="Msg" runat="server" Width="900px">
    </WEC:MessagePanel>
    <div class="toolbar">
        <asp:HyperLink ID="NewHyperLink" NavigateUrl="~/admin/Vote/VoteList.aspx" runat="server">
            投票管理</asp:HyperLink>
        <asp:HyperLink ID="RefreshHyperLink" runat="server">刷新</asp:HyperLink>
        <%-- <asp:HyperLink ID="SubjectLink" NavigateUrl="~/admin/ScoreManager/ScoreSubjectList.aspx"
            runat="server">主题管理</asp:HyperLink>     --%>
    </div>
    <div id="conbox">
        <dl>
            <dt>»投票的基本信息<br />
                <img src="/admin/images/bulb.gif" align="absmiddle" alt="" /><label class="block_info">修改基本信息，可以对投票的标题进行改变；</label>
            </dt>
            <dd>
                <table id="subjectForm" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="formTitle">
                            投票标题
                        </td>
                        <td class="formValue">
                            <asp:TextBox ID="txtTitle" runat="server" Columns="50" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">
                            选项类型
                        </td>
                        <td class="formValue">
                            <asp:DropDownList ID="drpOptionType" runat="server">
                                <asp:ListItem Text="单选" Value="1" />
                                <asp:ListItem Text="多选" Value="2" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">
                            选项类型
                        </td>
                        <td class="formValue">
                            <asp:RadioButtonList ID="rdIsCanRepeat" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">                                
                                <asp:ListItem Text="不可重复投票" Value="False" />
                                <asp:ListItem Text="可重复投票" Value="True" />
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">
                            截止日期
                        </td>
                        <td class="formValue">
                            <asp:TextBox ID="txtEndDate" runat="server" onfocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm'})" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td style="padding-top: 15px; padding-left: 0px">
                        </td>
                    </tr>
                </table>
                <div class="widget collapsable  inputWidth" id="divWidgetEntrys" runat="server" visible="false"
                     style="margin-left: 0px">
                    <div class="widget-header">
                        <strong>投票选项</strong>
                    </div>
                    <div class="widget-content">
                        <div class="inside">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="formTitle">
                                        选项内容
                                    </td>
                                    <td class="formValue">
                                        <asp:TextBox ID="txtEntryText" runat="server" CssClass="txt" />
                                    </td>
                                </tr>
                            </table>
                            <asp:Button ID="Button1" runat="server" Text="添加投票选项" CssClass="Btn" OnClick="AddEntry_Click" />
                        </div>
                        <div class="inside">
                            <br />
                            <asp:GridView ID="gvVoteEntrys" runat="server" AutoGenerateColumns="False" 
                                EnableModelValidation="True" onrowdeleting="gvVoteEntrys_RowDeleting" CssClass="List"
                                Width="90%" onrowcreated="gvVoteEntrys_RowCreated">
                                <Columns>
                                    <asp:BoundField HeaderText="选项内容" DataField="EntryText" />
                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </dd>
            <asp:Button ID="SaveButton" runat="server" Text="保存投票" CssClass="Btn" OnClick="SaveButton_Click" />
        </dl>
    </div>
</asp:Content>
