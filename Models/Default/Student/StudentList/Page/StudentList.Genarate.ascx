﻿<!--### name="学生信息列表(自动布局)" type="system" version="1.0" created="2014/10/10 10:45:46" desc="列表控件自动生成布局" author="We7 Group" ###-->
<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.ArticleModelProvider" %>
<div css="Default_Student_<%=CssClass%>">
<% for(int i=0;i<Items.Count;i++){ %>
<p>·<a href="<%=Items[i].LinkUrl %>" target="_blank">
   <%=Items[i]["OwnerID"] %>&nbsp;
   <%=Items[i]["stuName"] %>&nbsp;
   <%=Items[i]["Grade"] %>&nbsp;
   <%=Items[i]["Degree"] %>&nbsp;
   <%=Items[i]["Photo"] %>&nbsp;
   <%=Items[i]["Email"] %>&nbsp;
   <%=Items[i]["major"] %>&nbsp;
   <%=Items[i]["Remarks"] %>&nbsp;
   <%=Items[i]["StuNo"] %>&nbsp;
   <%=Items[i]["Nationality"] %>&nbsp;
   <%=Items[i]["Gender"] %>&nbsp;
   <%=Items[i]["preSchool"] %>&nbsp;
   <%=Items[i]["preMajor"] %>&nbsp;
   <%=Items[i]["Graduatetime"] %>&nbsp;
   <%=Items[i]["Job"] %>&nbsp;
   <%=Items[i]["Paper"] %>&nbsp;
   <%=Items[i]["Url"] %>&nbsp;
   <%=Items[i]["schoolName"] %>&nbsp;
<%=Items[i].TimeNote %>
</a>
</p>
<%}%>
</div>