<%@ Page Language="C#" MasterPageFile="../theme/classic/content.Master" AutoEventWireup="true"
    CodeBehind="EditScoreSource.aspx.cs" Inherits="We7.CMS.Web.Admin.ScoreManager.EditScoreSource" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="/Admin/theme/classic/css/article.css"
        media="screen" />

    <script type="text/javascript" language="javascript">
        function iframeAutoFit() {
            try {

                if (window != parent) {
                    var a = parent.document.getElementsByTagName("IFRAME");
                    for (var i = 0; i < a.length; i++) //author:meizz
                    {
                        if (a[i].contentWindow == window) {
                            var h1 = 0, h2 = 0;
                            a[i].parentNode.style.height = a[i].offsetHeight + "px";
                            a[i].style.height = "10px";
                            if (document.documentElement && document.documentElement.scrollHeight) {
                                h1 = document.documentElement.scrollHeight;
                            }
                            if (document.body) h2 = document.body.scrollHeight;
                            var h = Math.max(h1, h2);
                            if (document.all) { h += 4; }
                            if (window.opera) { h += 1; }
                            a[i].style.height = a[i].parentNode.style.height = h + h * 0.3 + "px";
                        }
                    }
                }
            }
            catch (ex) { }
        }
        if (window.attachEvent) {
            window.attachEvent("onload", iframeAutoFit);
        }
        else if (window.addEventListener) {
            window.addEventListener('load', iframeAutoFit, false);
        }
    </script>

    <script src="<%=AppPath%>/cgi-bin/cookie.js" type="text/javascript"></script>

    <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="NameLabel" runat="server" Text="积分来源管理">
        </asp:Label>
        <span class="summary">
            <%-- <asp:Label ID="SummaryLabel" runat="server" Text="积分来源管理说明">
            </asp:Label>--%>
        </span>
    </h2>
    <!--导航路径-->
    <div id="position">
        <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/scoremanager/ScoreSourceList.aspx'>
            积分来源管理 </a>>
        <asp:HyperLink ID="btAction" runat="server" />
    </div>
    <!--main-->
    <WEC:MessagePanel ID="Messages" runat="server">
    </WEC:MessagePanel>
    <br /><br />
    <div id="mycontent">
    <div id="conbox">
        <div class="Tab menuTab">
            <ul id="ScoreSubjectMenu" class="Tabs">
                <span id="ctl00_MyContentPlaceHolder_MenuTabLabel">
                    <li style="" id="tab1" class="TabIn">基本信息</li>
                </span>
            </ul>
        </div>

        <div class="clear">
        </div>
        <dl>
            <dt>»积分主题的基本信息<br>
                <img align="absmiddle" alt="" src="/admin/images/bulb.gif"><label class="block_info">修改基本信息，可以对主题的名称，显示标题进行改变；</label>
            </dt>
            <dd>
                <table id="subjectForm" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="formTitle">
                            名称
                        </td>
                        <td class="formValue">
                            <asp:TextBox ID="NameTextBox" runat="server" Columns="25" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">
                            显示名称
                        </td>
                        <td class="formValue">
                            <asp:TextBox ID="TitleTextBox" runat="server" Columns="25" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">
                            描述
                        </td>
                        <td class="formValue">
                            <asp:TextBox ID="DescTextBox" runat="server" Columns="50" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td style="padding-top: 15px; padding-left: 0px">
                            <input class="Btn" id="SaveButton2" runat="server" type="submit" value="保存" onserverclick="SaveButton_ServerClick" />
                            <asp:Button ID="ReturnButton2" runat="server" Text="返回" CssClass="Btn" OnClick="ReturnButton_ServerClick" />
                        </td>
                    </tr>
                </table>
            </dd>
        </dl>
        </div>
    </div>
</asp:Content>
