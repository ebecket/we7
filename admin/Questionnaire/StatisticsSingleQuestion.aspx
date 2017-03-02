<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatisticsSingleQuestion.aspx.cs"
    Inherits="We7.CMS.Web.Admin.StatisticsSingleQuestion" MasterPageFile="~/admin/theme/classic/ContentNoMenu.Master" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
<script type="text/javascript" src="../OpenFlashChart/swfobject.js"></script>
<script type="text/javascript">
    function loadChart() {        
        swfobject.embedSWF("../OpenFlashChart/open-flash-chart.swf", "my_chart", "440", "300",
          "9.0.0", "../OpenFlashChart/expressInstall.swf");
    }
    function showDateSeletor() {
        //    debugger;
        var dateSeletor = document.getElementById("dateSeletor");
        var f_date_range = document.getElementById("f_date_range");
        if (dateSeletor) {
            if (dateSeletor.style.display == '') {
                dateSeletor.style.display = 'none';
                f_date_range.className = "";
            }
            else {
                dateSeletor.style.display = '';
                f_date_range.className = "current";
            }
        }
    }
    window.onload = function () {
        var parms = window.location.search.substr(1);
        var url = "Ajax/Ajax.ashx?act=QuestionStatistics&" + parms;
        $.get(url, function (_result_) {
            if (_result_ != "") {
                loadChart();
                json = _result_;

            }
        });
    }

    var json = {};

    function open_flash_chart_data() {
        return json;
    }
    </script>
    <div>
        <h2 class="title">
            <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_user.gif" />
            <asp:Label ID="NameLabel" runat="server" Text="数据统计分析报表——单题统计">
            </asp:Label>
            <span class="summary">
                <asp:Label ID="SummaryLabel" runat="server" Text="">
                </asp:Label>
            </span>
        </h2>
        <div id="position">
            <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/Questionnaire/QuestionnaireMng.aspx'>问卷管理</a> > 单题统计
        </div>
        <WEC:MessagePanel ID="Messages" runat="server">
        </WEC:MessagePanel>
    </div>
    <div class="toolbar">
       <a href="StatisticsIndex.aspx" target="_self"><font color="#000000">数据分析首页</font></a> 
       <a href="StatisticsSingleQuestion.aspx?QuestionnaireID=<%=QuestionnaireID %>" target="_self"><font color="#000000">单题统计</font></a>
       <a href="StatisticsGeneral.aspx?QuestionnaireID=<%=QuestionnaireID %>" target="_self"><font color="#000000">综合统计</font></a>
       <a href="StatisticsDetail.aspx?QuestionnaireID=<%=QuestionnaireID %>"><font color="#000000">详细答题</font></a>
    </div>
    <br>
    <table align="center" bgcolor="#5c99dc" border="0" cellpadding="3" cellspacing="1"
        width="98%">
        <tbody>
            <tr>
                <td height="25">
                    &nbsp;<font color="#000000">当前调查项目</font>
                    统计方式：按投票百分比统计 [<a href="#" target="_self" title="按平均分进行统计">切换统计方式</a>]
                </td>
            </tr>
        </tbody>
    </table>
    <table align="center" bgcolor="#5c99dc" border="0" cellpadding="3" cellspacing="1"
        width="98%">
        <tbody>
            <tr bgcolor="#f2f2f2">
                <td width="49%">
                    &nbsp;<font color="#000000">主题：<strong><%=QuestionName%></strong> </font>
            </td>
                <td width="51%">
                    &nbsp;<font color="#000000">[调查结果显示]</font>&nbsp;
                </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff" valign="top" width="49%">
                    <%
                        We7.CMS.Web.Admin.Questionnaire.Ajax.Ajax optionAjax = new We7.CMS.Web.Admin.Questionnaire.Ajax.Ajax();
                        We7.CMS.QuestionHelper Q = new We7.CMS.QuestionHelper();
                        We7.CMS.Common.Question questionModel = Q.GetQuestion(QuestionID);
                        optionAjax.CreateOptions(questionModel);
                    %>
                </td>
                <td bgcolor="#ffffff" width="51%">
                    <asp:Label ID="edtChart" runat="server"></asp:Label> 
                    <div id="my_chart" style="margin-top:15px"></div>
                </td>
            </tr>
            <tr bgcolor="#f2f2f2">
                <td bgcolor="#f2f2f2" height="2" valign="bottom" width="49%">&nbsp;
                    
                </td>
                <td height="2" width="51%">
                    总投票数: <%=AnswersCount %>
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <table align="center" bgcolor="#5c99dc" border="0" cellpadding="3" cellspacing="1"
        width="98%">
        <tbody>
            <tr>
                <td colspan="6" background="../../images/s3wcn_bt.gif">
                    &nbsp;<font color="#000000">其他调查项目</font>
                </td>
            </tr>
        </tbody>
    </table>
    <table align="center" bgcolor="#5c99dc" border="0" cellpadding="1" cellspacing="1"
        width="98%">
        <tbody>
            <tr bgcolor="#99ccff">
                <td width="3%">&nbsp;
                    
                </td>
                <td height="20" width="97%">
                    调查项目
                </td>
            </tr>
            <%
                if (LsQuestions != null)
                {
                    for (int i = 0; i < LsQuestions.Count; i++)
                    {                    
            %>
            <tr>
                <td align="center" bgcolor="#ffffff" width="7%">
                    第<%=LsQuestions[i].OrderID%>题
                </td>
                <td bgcolor="#ffffff" width="93%">
                    <a href='StatisticsSingleQuestion.aspx?QuestionnaireID=<%=QuestionnaireID%>&QuestionID=<%=LsQuestions[i].ID %>'>
                        <%=LsQuestions[i].Title%></a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</asp:Content>
