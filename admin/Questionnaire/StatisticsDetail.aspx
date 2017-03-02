<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/theme/classic/ContentNoMenu.Master" AutoEventWireup="true" CodeBehind="StatisticsDetail.aspx.cs" Inherits="We7.CMS.Web.Admin.Questionnaire.StatisticsDetail" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
  <style type="text/css">
    ul#Questionnaires li{float:left; padding:6px; width:95%;}
	ul#Questionnaires li#Header{ width:90%;}
  </style>
  <div>
      <h2 class="title">
        <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_user.gif" />
        <asp:Label ID="NameLabel" runat="server" Text="数据统计分析报表——综合统计"> </asp:Label>
        <span class="summary">
        <asp:Label ID="SummaryLabel" runat="server" Text=""> </asp:Label>
        </span> </h2>
      <div id="position"> &nbsp;
        <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/Questionnaire/QuestionnaireMng.aspx'>问卷管理
        </a> > 统计详细
      </div>
      <WEC:MessagePanel ID="Messages" runat="server"> </WEC:MessagePanel>
  </div>
  <div class="toolbar">
       <a href="StatisticsIndex.aspx" target="_self"><font color="#000000">数据分析首页</font></a> 
       <a href="StatisticsSingleQuestion.aspx?QuestionnaireID=<%=QuestionnaireID %>" target="_self"><font color="#000000">单题统计</font></a>
       <a href="StatisticsGeneral.aspx?QuestionnaireID=<%=QuestionnaireID %>" target="_self"><font color="#000000">综合统计</font></a>
       <a href="StatisticsDetail.aspx?QuestionnaireID=<%=QuestionnaireID %>"><font color="#000000">详细答题</font></a>
   </div>
  <% 
      List<We7.CMS.Common.AnswerSheet> aList= AnswerSheets();
      for (int i = 0; i < aList.Count;i++ )
      {
          List<We7.CMS.Common.AnswerSheet> aLists = AnswerSheet(aList[i].CurrentAnswerQuestionnaireID);
  %>
  <ul id="Questionnaires">
    <li id="Header">
      <table width="100%" border="0" cellspacing="3" cellpadding="3">
        <tr>
          <td>序号</td>
          <td><%=i+1 %></td>
          <td>用户</td>
          <td><%=aLists[0].UserName %></td>
          <td>答卷时间</td>
          <td><%=aLists[0].PostDate %></td>
        </tr>
      </table>
    </li>
    <li>
      <table width="100%" border="0" cellspacing="3" cellpadding="3">
      <% 
          int n = 1;
          foreach (We7.CMS.Common.Question item in Questions)
          {
              We7.CMS.Common.AnswerSheet currAnswer = AnswerSheet(item.ID, aList[i].CurrentAnswerQuestionnaireID);
      %>
        <tr>
          <td>题目<%=n %></td>
          <td><%=item.Title %></td>
          <td>答案</td>
          <td><%=currAnswer.OptionValue%></td>
        </tr>
      <%
              n++;
          }    
      %>
      </table>      
    </li>
  </ul>
  <% 
      }
  %>
</asp:Content>
