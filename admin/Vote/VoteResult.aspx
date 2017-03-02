<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteResult.aspx.cs" 
Inherits="We7.CMS.Web.Admin.Vote.VoteResult" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>投票结果</title>
    <link href="voteResult.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="t_talbe2">
        <div class="t_talbeall">
            <div class="t_talbe1">
                <br>
                <% if (CurrVote != null)
                   { %>
                <table width="90%" cellspacing="0" cellpadding="0" border="0" align="center">
                    <tbody>
                        <tr>
                            <td height="30" align="center" colspan="3">
                                <b>投票主题：<%=CurrVote.Title%></b>
                            </td>
                        </tr>
                        <tr>
                            <td height="20" colspan="3">
                                <div class="type-height2">
                                </div>
                            </td>
                        </tr>
                        <% foreach (We7.CMS.Common.VoteAnswerStat stat in CurrVote.ListVoteAnswerStats)
                           { %>
                        <tr>
                            <td width="180" height="25">
                                <%= stat.VoteEntryText %>
                            </td>
                            <td width="170">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                        <tr>
                                            <td width="2" height="12" background="/widgets/Skin/Images/Bar_Image_1.jpg">
                                            </td>
                                            <td width='<%= stat.VoteEntrySumPercent %>' bgcolor="#B50000">
                                            </td>
                                            <td width='<%= 170- stat.VoteEntrySumPercent %>' bgcolor="#FFFFFF">
                                            </td>
                                            <td width="2" background="/widgets/Skin/Images/Bar_Image_2.jpg">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td>
                                &nbsp; <span class="type-color2"><%=stat.VoteEntrySum%></span> 次
                            </td>
                        </tr>
                        <% } %>
                        <tr align="center">
                            <td height="30" colspan="3">
                                共有 <span class="type-color2"><b><%=CurrVote.VotePeoples %></b></span> 人参加投票
                            </td>
                        </tr>
                        <tr align="center">
                            <td height="30" colspan="3">
                                『 <a href="javascript:window.close()">关闭窗口</a> 』
                            </td>
                        </tr>
                    </tbody>
                </table>
                <% } %>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
