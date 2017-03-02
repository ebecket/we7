<!--### name="事件信息录入(自动布局)" type="system" version="1.0" created="2014/10/13 11:24:29" desc="" author="We7 Group" ###-->
<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.Model.Core.UI.LayoutEditor" %>
<asp:PlaceHolder ID="_ID" runat="server"></asp:PlaceHolder>
<table>
			    					<tr>
				<td class="lable">
					栏目
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_OwnerID" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					类型
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Type" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					标题
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Title" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					主讲人
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Speaker" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					主讲人简介
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Intro" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					主持人
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Anchor" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					讲座类别
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Cate" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					讲座期数
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Term" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					讲座语言
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_LectureLanguage" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					支持讲座打开
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_IsCheck" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					活动简介
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Description" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					时间范围(必填，用于个性化显示)
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_StartTime" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					开始时间(必填，用于数据搜索)
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_STime" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					结束时间(必填，用于数据搜索)
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_ETime" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					地点
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Address" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					主办单位
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Organizer" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					承办单位
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Organizer2" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					过期时间(必填，用于数据排序)
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_DueTime" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					发布人(填写登录名)
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Creater" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					专题网站链接
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Url" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					通知邮件组
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_EmailGroups" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					通知邮件语言
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_EmailLang" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					通知邮件定时(留空则不定时通知)
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_EmailSendDate" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					备注
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Remark" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					状态
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_State" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    </table>
