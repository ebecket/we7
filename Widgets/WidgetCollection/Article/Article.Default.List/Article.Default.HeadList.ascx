<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.Default.HeadList.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Default_HeadList" %>
<div class="<%=CssClass %>">
    <h1>
        <a class="more" href="<%=Channel.FullUrl %>">More</a> <span class="title"><a class="txt"
            href="<%=Channel.FullUrl %>">
            <%=Channel.Name %></a><em class="arrow"></em></span>
    </h1>
    <ul>
        <% for (int i = 0; i < Articles.Count; i++)
           { %>
        <li class="first">
            <div class="img">
                <a href="<%=Articles[i].Url %>" title="<%=Articles[i].Title.Trim() %>" target="_blank">
                    <img src="<%=Articles[i].Thumbnail %>" alt="" /></a></div>
            <p class="title">
                <a href="<%=PicArticle.Url %>" title="<%=Articles[i].Title.Trim() %>" target="_blank">
                    <%=ToStr(Articles[i].Title.Trim(), FirstTitleLength)%></a>
            </p>
            <p class="summary">
                <%=ToStr(Articles[i].Summary, SummaryLength)%>
                <%--<span>
                    <%=ToDateStr(Articles[i].Updated, DateFormat)%></span>--%></p>
            <div class="auto">
            </div>
        </li>
        <%} %>
    </ul>
</div>
