<!--### name="学生信息录入(自动布局)" type="system" version="1.0" created="2014/10/10 10:46:39" desc="" author="We7 Group" ###-->
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
					学院
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_schoolName" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					姓名
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_stuName" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					学号
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_StuNo" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					年级
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Grade" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					专业
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_major" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					国籍
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Nationality" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					照片
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Photo" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					邮箱
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Email" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					学历
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Degree" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					就业公司
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Job" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					论文题目
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Paper" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    					<tr>
				<td class="lable">
					论文地址
				</td>
				<td class="content">
					<asp:PlaceHolder ID="_Url" runat="server"></asp:PlaceHolder>
				</td>
			</tr>
		    </table>
