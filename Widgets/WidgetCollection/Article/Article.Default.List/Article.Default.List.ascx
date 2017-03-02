<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.Default.List.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Default_List" %>
<div class="<%=CssClass %>">
    <h1>
        <a class="more" href="<%=Channel.FullUrl %>">More</a>
        <span class="title"><a class="txt" href="<%=Channel.FullUrl %>"><%=Channel.Name %></a><em class="arrow"></em></span>
    </h1>
    <ul>
        <% for (int i = 0; i < Articles.Count; i++)
           { %>
        <li <%=(i == 0 ? "class='first'" : "")%>><em class="dot"></em><span <%=(Articles[i].IsShow == 1 ? "class='top'" : "")%>>
            <%=ToDateStr(Articles[i].Updated, DateFormat)%></span><a href="<%=Articles[i].Url %>"
                <%=(Articles[i].IsShow == 1 ? "class='top'" : "")%> title="<%=Articles[i].Title %>" target="_blank" ><%=ToStr(Articles[i].Title, TitleLength)%></a></li>
        <%} %>
    </ul>
</div>
