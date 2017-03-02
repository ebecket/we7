<%@ Page Language="C#" MasterPageFile="../theme/classic/content.Master" AutoEventWireup="true"
    CodeBehind="EditScoreRule.aspx.cs" Inherits="We7.CMS.Web.Admin.ScoreManager.EditScoreRule" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">

    <script type="text/javascript" language="javascript">
        function iframeAutoFit()
             {
           try
                {
                                      
                  if(window!=parent)
                    {
                    var a = parent.document.getElementsByTagName("IFRAME");
                     for(var i=0; i<a.length; i++) //author:meizz
                       {
                        if(a[i].contentWindow==window)
                           {
                          var h1=0, h2=0;
                          a[i].parentNode.style.height = a[i].offsetHeight +"px";
                          a[i].style.height = "10px";
        if(document.documentElement&&document.documentElement.scrollHeight)
                        {
                           h1=document.documentElement.scrollHeight;
                         }
                         if(document.body) h2=document.body.scrollHeight;
                         var h=Math.max(h1, h2);
                       if(document.all) {h += 4;}
                        if(window.opera) {h += 1;}
                        a[i].style.height = a[i].parentNode.style.height = h+h*0.3 +"px";
                        }
                  }
             }
         }
        catch (ex){}
          }
         if(window.attachEvent)
        {
           window.attachEvent("onload",iframeAutoFit);
        }
        else if(window.addEventListener)
        {
             window.addEventListener('load',   iframeAutoFit,   false);
        }
    </script>

    <link rel="stylesheet" type="text/css" href="<%=ThemePath%>/css/article.css" media="screen" />

    <script src="<%=AppPath%>/cgi-bin/cookie.js" type="text/javascript"></script>

    <!--title-->
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
    <div id="position">
        <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/scoremanager/ScoreSubjectList.aspx'>
            积分主题管理 </a>> <a href='/admin/scoremanager/EditScoreSubject.aspx?id=<%= SubjectID %>&tab=3'
                id='pathLast'>规则</a> >
        <asp:HyperLink ID="btAction" runat="server" />
    </div>
    <div id="mycontent">
        <!--tab-->
        <div class="Tab menuTab">
            <ul id="ScoreSubjectMenu" class="Tabs">
                <span id="ctl00_MyContentPlaceHolder_MenuTabLabel">
                    <li style="" id="tab1" class="TabOut"><a href="/admin/scoremanager/EditScoreSubject.aspx?id={39a9e225-f593-4b3e-a83c-8b8663dc480d}&amp;tab=1">
                        <%=CurrSubjectName %>基本信息</a> </li>
                    <li style="" id="tab2" class="TabOut"><a href="/admin/scoremanager/EditScoreSubject.aspx?id={39a9e225-f593-4b3e-a83c-8b8663dc480d}&amp;tab=2">
                        <%=CurrSubjectName %>等级</a> </li>
                    <li style="" id="tab3" class="TabIn"><a><%=CurrSubjectName %>规则</a> </li>
                </span>
            </ul>
        </div>
        <div class="clear">
        </div>
        <!--main-->
        <WEC:MessagePanel ID="Messages" runat="server">
        </WEC:MessagePanel>
        <dl>
            <%--»规则<br />--%>
            <dt>
                <img src="/admin/images/bulb.gif" align="absmiddle" alt="" /><label class="block_info" id="lblTip" runat="server">规则；</label>
            </dt>
            <dd>
                <table id="subjectForm" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="formTitle">
                            名称
                        </td>
                        <td class="formValue">
                            <asp:TextBox ID="NameTextBox" runat="server" Columns="50" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">
                            显示名称
                        </td>
                        <td class="formValue">
                            <asp:TextBox ID="TitleTextBox" runat="server" Columns="50" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">
                            来源
                        </td>
                        <td class="formValue">
                            <asp:DropDownList ID="SourceDropdownList" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">
                            分数
                        </td>
                        <td class="formValue">
                            <asp:TextBox ID="ScoreTextBox" runat="server" Columns="2" CssClass="txt"></asp:TextBox>
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
</asp:Content>
