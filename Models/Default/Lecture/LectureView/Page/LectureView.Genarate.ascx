<!--### name="事件信息详细(自动布局)" type="system" version="1.0" created="2014/5/9 10:47:38" desc="" author="We7 Group" ###-->
<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.ArticleModelProvider" %>
<div css="Default_Lecture_<%=CssClass%>">
<table>
<tr><td>栏目ID:</td><td><%=Item["OwnerID"] %></td></tr>
<tr><td>标题:</td><td><%=Item["Title"] %></td></tr>
<tr><td>主讲人:</td><td><%=Item["Speaker"] %></td></tr>
<tr><td>主持人:</td><td><%=Item["Anchor"] %></td></tr>
<tr><td>活动简介:</td><td><%=Item["Description"] %></td></tr>
<tr><td>地点:</td><td><%=Item["Address"] %></td></tr>
<tr><td>主办单位:</td><td><%=Item["Organizer"] %></td></tr>
<tr><td>类型:</td><td><%=Item["Type"] %></td></tr>
<tr><td>类别:</td><td><%=Item["Cate"] %></td></tr>
<tr><td>时间:</td><td><%=Item["StartTime"] %></td></tr>
<tr><td>过期时间:</td><td><%=Item["DueTime"] %></td></tr>
<tr><td>承办单位:</td><td><%=Item["Organizer2"] %></td></tr>
<tr><td>链接:</td><td><%=Item["Url"] %></td></tr>
<tr><td>主讲人简介:</td><td><%=Item["Intro"] %></td></tr>
<tr><td>期数:</td><td><%=Item["Term"] %></td></tr>
<tr><td>开始时间:</td><td><%=Item["STime"] %></td></tr>
<tr><td>结束时间:</td><td><%=Item["ETime"] %></td></tr>
<tr><td>发布人:</td><td><%=Item["Creater"] %></td></tr>
</table>
</div>
