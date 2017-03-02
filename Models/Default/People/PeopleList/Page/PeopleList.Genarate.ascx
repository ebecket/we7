<!--### name="人员信息列表(自动布局)" type="system" version="1.0" created="2013/12/27 9:53:36" desc="列表控件自动生成布局" author="We7 Group" ###-->
<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.WebControls.ArticleModelProvider" %>
<div css="Default_People_<%=CssClass%>">
<% for(int i=0;i<Items.Count;i++){ %>
<p>·<a href="<%=Items[i].LinkUrl %>" target="_blank">
   <%=Items[i]["OwnerID"] %>&nbsp;
   <%=Items[i]["Fullname"] %>&nbsp;
   <%=Items[i]["Gendar"] %>&nbsp;
   <%=Items[i]["Title"] %>&nbsp;
   <%=Items[i]["Position"] %>&nbsp;
   <%=Items[i]["Office"] %>&nbsp;
   <%=Items[i]["OfficeTime"] %>&nbsp;
   <%=Items[i]["Phone"] %>&nbsp;
   <%=Items[i]["Mobil"] %>&nbsp;
   <%=Items[i]["Email"] %>&nbsp;
   <%=Items[i]["Duty"] %>&nbsp;
   <%=Items[i]["Field"] %>&nbsp;
   <%=Items[i]["Photo"] %>&nbsp;
   <%=Items[i]["Url"] %>&nbsp;
   <%=Items[i]["Intro"] %>&nbsp;
   <%=Items[i]["IndexLetter"] %>&nbsp;
   <%=Items[i]["CardNumber"] %>&nbsp;
   <%=Items[i]["Cate"] %>&nbsp;
   <%=Items[i]["Subject"] %>&nbsp;
<%=Items[i].TimeNote %>
</a>
</p>
<%}%>
</div>