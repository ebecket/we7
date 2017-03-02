<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Article.Default.PicList.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Default_PicList" %>
<div class="<%=CssClass %>">
    <h1>
        <a class="more" href="<%=Channel.FullUrl %>">More</a> <span class="title"><a class="txt"
            href="<%=Channel.FullUrl %>">
            <%=Channel.Name %></a><em class="arrow"></em></span>
    </h1>
    <ul>
        <% foreach (Article article in Articles)
           { %>
        <li>
            <div class="img">
                <a href="<%=article.Url %>" target="_blank">
                    <img src="<%=article.GetTagThumbnail(ThumbnailTag)%>" alt="" /></a></div>
            <p class="title">
                <a href="<%=article.Url %>" target="_blank">
                    <%=ToStr(article.Title, TitleLength)%></a></p>
            <p class="summary">
                <%=ToStr(article.Summary, SummaryLength)%>
            </p>
            <div class="auto">
            </div>
        </li>
        <%} %>
    </ul>
    <div class="auto">
    </div>
</div>
