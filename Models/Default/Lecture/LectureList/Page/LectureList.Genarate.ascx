<!--### name="事件信息列表(自动布局)" type="system" version="1.0" created="2014/5/9 10:47:38" desc="列表控件自动生成布局" author="We7 Group" ###-->
<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.ArticleModelProvider" %>
<div css="Default_Lecture_<%=CssClass%>">
<% for(int i=0;i<Items.Count;i++){ %>
<p>·<a href="<%=Items[i].LinkUrl %>" target="_blank">
   <%=Items[i]["OwnerID"] %>&nbsp;
   <%=Items[i]["Title"] %>&nbsp;
   <%=Items[i]["Speaker"] %>&nbsp;
   <%=Items[i]["Anchor"] %>&nbsp;
   <%=Items[i]["Description"] %>&nbsp;
   <%=Items[i]["Address"] %>&nbsp;
   <%=Items[i]["Organizer"] %>&nbsp;
   <%=Items[i]["Type"] %>&nbsp;
   <%=Items[i]["Cate"] %>&nbsp;
   <%=Items[i]["StartTime"] %>&nbsp;
   <%=Items[i]["DueTime"] %>&nbsp;
   <%=Items[i]["Organizer2"] %>&nbsp;
   <%=Items[i]["Url"] %>&nbsp;
   <%=Items[i]["Intro"] %>&nbsp;
   <%=Items[i]["Term"] %>&nbsp;
   <%=Items[i]["STime"] %>&nbsp;
   <%=Items[i]["ETime"] %>&nbsp;
   <%=Items[i]["Creater"] %>&nbsp;
<%=Items[i].TimeNote %>
</a>
</p>
<%}%>
</div>