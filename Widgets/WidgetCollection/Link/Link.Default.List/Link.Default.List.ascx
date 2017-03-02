<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Link.Default.List.cs"
    Inherits="We7.CMS.Web.Widgets.Link_Default_List" %>
<div class="<%=CssClass %>">
    <h1>
        <a class="more" href="javascript:void(0);">More</a>        
        <span class="title"><a class="txt" href="javascript:void(0);">相关链接</a><a class="arrow"></a></span>
    </h1>
    <ul>
        <% 
            int i = 0;
            foreach (Link link in Items)
            {
        %>
        <li <%=i == 0 ? "class='first'" : ""%>><em class="dot"></em><a target="_blank" href="<%=link.Url %>">
            <%if (!string.IsNullOrEmpty(link.Thumbnail))
              {%>
            <img src="<%=link.Thumbnail%>" alt="" />
            <%}%>
            <span>
                <%=ToStr(link.Title, TitleLength)%></span></a></li>
        <% i++;} %>
    </ul>
</div>
