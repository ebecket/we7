<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatisticsGeneral.aspx.cs"
    Inherits="We7.CMS.Web.Admin.StatisticsGeneral" MasterPageFile="~/admin/theme/classic/ContentNoMenu.Master" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>

<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
<link media="screen" rel="stylesheet" href="/admin/ajax/jquery/colorbox/colorbox.css" />
<script src="/admin/ajax/jquery/colorbox/jquery.colorbox-min.js"></script>
  <div>
    <h2 class="title">
      <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_user.gif" />
      <asp:Label ID="NameLabel" runat="server" Text="数据统计分析报表——综合统计"> </asp:Label>
      <span class="summary">
      <asp:Label ID="SummaryLabel" runat="server" Text=""> </asp:Label>
      </span> </h2>
    <div id="position"> &nbsp;
      <a href='/admin/' target='_parent'>开始</a> > <a href='/admin/Questionnaire/QuestionnaireMng.aspx'>问卷管理</a> > 综合统计
    </div>
    <WEC:MessagePanel ID="Messages" runat="server"> </WEC:MessagePanel>
  </div>
  <div class="toolbar">
       <a href="StatisticsIndex.aspx" target="_self"><font color="#000000">数据分析首页</font></a> 
       <a href="StatisticsSingleQuestion.aspx?QuestionnaireID=<%=QuestionnaireID %>" target="_self"><font color="#000000">单题统计</font></a>
       <a href="StatisticsGeneral.aspx?QuestionnaireID=<%=QuestionnaireID %>" target="_self"><font color="#000000">综合统计</font></a>
       <a href="StatisticsDetail.aspx?QuestionnaireID=<%=QuestionnaireID %>"><font color="#000000">详细答题</font></a>
  </div>
  <br>
  <table width="98%" cellspacing="1" cellpadding="3" border="0" bgcolor="#cccccc" align="center">
    <tbody>
      <tr bgcolor="#f2f2f2">
        <td height="30" align="center" colspan="2">
          <span style="font-size: 14px;"><b><font color="#000000">&nbsp;综合统计</font></b>（共有<font color="red"><%=CurrentQuestionnaire.UseHits%></font>人参加问卷）</span>
        </td>
      </tr>
     </tbody>
    </table>
    <ul>
      <% 
          if (LsQuestions != null && LsQuestions.Count > 0)
          {
              foreach (We7.CMS.Common.Question item in LsQuestions)
              {
      %>
       <li> 
         <div style="padding:2px 8px;">
           <span style="color: #3D81EE; font-weight: bold;">第<%=item.OrderID%>题:</span> <%=item.Title%>  
           <span style="color: #0066FF;">[<%=QuestionType(item.Type)%>]</span>
         </div>
         <div style="padding:2px 8px;">
         <%
                  List<We7.CMS.Common.Option> oList = LsOptions(item.ID);
                  if (item.Type == 5||item.Type==6)
                  {
         %>
           
          【<a href="javascript:void(0);" onclick="$(this).colorbox({href: 'Ajax/Ajax.ashx?act=AnswerDetail&OptionID=<%=oList[0].ID %>&Type=<%=item.Type %>' });">查看本题答案详细信息</a>】
          <%
                  }
                  else if (item.Type < 5)
                  {
          %>
          <table width="80%" border="1" cellspacing="1" cellpadding="1">
            <tr align="center">
              <td style="font-weight:bold">选项</td>
              <td style="width:40px; font-weight:bold">小计</td>
              <td align="left" style="width:360px; font-weight:bold">比例</td>
            </tr>
            <%                      
                      foreach (We7.CMS.Common.Option it in oList)
                      {
            %>
            <tr>
              <td><%=it.Title%></td>
              <td align="center"><%=AnswerCount(it.ID)%></td>
              <td>
                <div style="background:url(Image/vote_cl_bar.png) no-repeat scroll 0 0 transparent; float: left; height: 16px; margin: 3px 0 0; padding: 0 0 0 1px; text-align: left; width: 152px;">
                  <div style=" overflow: hidden;width: <%=double.Parse(AnswerCount(it.ID).ToString())/item.AnswerCount*100 %>%; display: block;">
                    <img width="149" height="13" src="Image/vote_cl_v2.png" alt="" />
                  </div>
                </div>
                <span><%=(double.Parse(AnswerCount(it.ID).ToString()) / item.AnswerCount * 100).ToString("F")%>%</span>
              </td>
            </tr>
            <%
                      }
            %>
          </table>
          <%
                  }
                  else if (item.Type == 8)
                  {                      
          %>
          <table width="80%" border="1" cellspacing="1" cellpadding="1">
            <tr align="center">
              <td style="font-weight:bold">选项</td>
              <td align="left" style="width:360px;font-weight:bold">详情</td>
            </tr>
            <%
                      int n = 0;
                      string[] options = oList[0].OptionValue.Split(new String[]{"#*#"}, StringSplitOptions.RemoveEmptyEntries);
                      foreach (string it in options)
                      {
                          
            %>
            <tr>
              <td><%=it%></td>
              <td>
                <span><a href="javascript:void(0)" onclick="$(this).colorbox({href: 'Ajax/Ajax.ashx?act=AnswerDetail&OptionID=<%=oList[0].ID %>&Type=<%=item.Type %>&Num=<%=n %>' });">详情</a></span>
              </td>
            </tr>
            <%
                          n++;
                      }
            %>
          </table>
          <%
                  }
                  else if (item.Type == 7)
                  {
                      Response.Write(oList[0].OptionValue.Replace("#*#", "<input type='text' >"));
          %>
          <table width="80%" border="1" cellspacing="1" cellpadding="1">
            <tr align="center">
              <td style="font-weight:bold">选项</td>
              <td align="left" style="width:360px;font-weight:bold">详情</td>
            </tr>
            <%
                      int i = 0;
                      string[] options = oList[0].OptionValue.Split(new String[] { "#*#" }, StringSplitOptions.RemoveEmptyEntries);

                      foreach (string it in options)
                      {
                          if (string.IsNullOrEmpty(it)) break;
                                                   
            %>
            <tr>
              <td>填空<%=i+1%></td>
              <td>
                <span><a href="javascript:void(0)" onclick="$(this).colorbox({href: 'Ajax/Ajax.ashx?act=AnswerDetail&OptionID=<%=oList[0].ID %>&Type=<%=item.Type %>&Num=<%=i %>' });">详情</a></span>
              </td>
            </tr>
            <%
                          i++;
                      }
            %>
          </table>
          <%
                  }
          %>
          </div>
         <div>
           <hr size="2" style="background: #eeeeff; color: #eeeeff" />
         </div>
      </li>
      <% 
              }
          }
      %>
      </ul>
</asp:Content>
