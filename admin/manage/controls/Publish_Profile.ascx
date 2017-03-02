<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Publish_Profile.ascx.cs" Inherits="We7.CMS.Web.Admin.Publish_Profile" %>

    <div style="margin-left:20px;margin-top:20px;font-size:14px">
<table  align="center" bgcolor="#cccccc" cellpadding="10" cellspacing="5" width="92%" >
	<tr>
		<td>本周发表文章数：</td><td><asp:Label ID="LabelWeekArticles" runat="server" Text="LabelWeekArticles"></asp:Label>
                            </td>
	</tr>
	<tr>
	<td>本月发表文章数：</td><td><asp:Label ID="LabelMonthArticles" runat="server" Text="LabelMonthArticles"></asp:Label>
                            </td>
	</tr>

	<tr>
	<td>
                 文章总数：</td><td><asp:Label ID="LabelTotalArticles" runat="server" Text="LabelTotalArticles"></asp:Label>
                            </td>
          </tr>
<tr>
	<td>本周评论数：</td><td><asp:Label ID="LabelWeekComments" runat="server" Text="LabelWeekComments"></asp:Label>
                            </td>
	</tr>
     <tr>
	<td>本月评论数：</td><td><asp:Label ID="LabelMonthComments" runat="server" Text="LabelMonthComments"></asp:Label>
                            </td>
	</tr>
	<tr>
	<td>评论总数：</td><td><asp:Label ID="LabelTotalComments" runat="server" Text="LabelTotalComments"></asp:Label>
                            </td>
      </tr>

	</table>    </div>