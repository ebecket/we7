<!--### name="人员信息详细(自动布局,单表结构)" type="system" version="1.0" created="2013/12/27 9:53:36" desc=",单表结构" author="We7 Group" ###-->
<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.DbModelProvider" %>
<div css="Default_People_<%=CssClass%>">
<table>
	<tr><td>栏目ID:</td><td><%=Item["OwnerID"] %></td></tr>
	<tr><td>姓名:</td><td><%=Item["Fullname"] %></td></tr>
	<tr><td>性别:</td><td><%=Item["Gendar"] %></td></tr>
	<tr><td>职称:</td><td><%=Item["Title"] %></td></tr>
	<tr><td>职务:</td><td><%=Item["Position"] %></td></tr>
	<tr><td>办公室:</td><td><%=Item["Office"] %></td></tr>
	<tr><td>办公时间:</td><td><%=Item["OfficeTime"] %></td></tr>
	<tr><td>固定电话:</td><td><%=Item["Phone"] %></td></tr>
	<tr><td>手机:</td><td><%=Item["Mobil"] %></td></tr>
	<tr><td>电子邮件:</td><td><%=Item["Email"] %></td></tr>
	<tr><td>工作职责:</td><td><%=Item["Duty"] %></td></tr>
	<tr><td>研究领域:</td><td><%=Item["Field"] %></td></tr>
	<tr><td>照片:</td><td><%=Item["Photo"] %></td></tr>
	<tr><td>主页:</td><td><%=Item["Url"] %></td></tr>
	<tr><td>个人简介:</td><td><%=Item["Intro"] %></td></tr>
	<tr><td>首字母:</td><td><%=Item["IndexLetter"] %></td></tr>
	<tr><td>教工号:</td><td><%=Item["CardNumber"] %></td></tr>
	<tr><td>类别:</td><td><%=Item["Cate"] %></td></tr>
	<tr><td>学科:</td><td><%=Item["Subject"] %></td></tr>
</table>
</div>
<%--系统提供的方法
string ToStr(object fieldValue)
string ToStr(object fieldValue, int maxlength)
string ToStr(object fieldValue, int maxlength, string tail)
string ToDateStr(object fieldValue, string fmt)
string ToDateStr(object fieldValue)
int? ToInt(object fieldValue)
string GetUrl(object id)
--%>
