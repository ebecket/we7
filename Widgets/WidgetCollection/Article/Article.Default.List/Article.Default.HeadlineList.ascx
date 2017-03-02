<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.Default.HeadlineList.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Default_HeadlineList" %>
<div class="<%=CssClass %>">
    <h1>
        <a class="more" href="<%=Channel.FullUrl %>">More</a> <span class="title"><a class="txt"
            href="<%=Channel.FullUrl %>">
            <%=Channel.Name %></a><em class="arrow"></em></span>
    </h1>
    <ul>
        <%if (PicArticle != null)
          { %>
        <li class="first">
            <div class="img">
                <a href="<%=PicArticle.Url %>" title="<%=PicArticle.Title.Trim() %>" target="_blank"><img src="<%=PicArticle.GetTagThumbnail(ThumbnailTag) %>" alt="" /></a></div>
            <p class="title">
                <a href="<%=PicArticle.Url %>" title="<%=PicArticle.Title.Trim() %>"  target="_blank">
                    <%=ToStr(PicArticle.Title.Trim(), FirstTitleLength)%></a>
            </p>
            <p class="summary">
                <%=ToStr(PicArticle.Summary, SummaryLength)%>
                <span>
                    <%=ToDateStr(PicArticle.Updated, DateFormat)%></span></p>
            <div class="auto">
            </div>
        </li>
        <%} %>
        <% for (int i = 0; i < Articles.Count; i++)
           { %>
        <li <%=i==0 && PicArticle == null ? "class='first'" : "" %>><em class="dot"></em><span>
            <%=ToDateStr(Articles[i].Updated, DateFormat)%></span><a href="<%=Articles[i].Url %>"
                style="<%=Articles[i].TitleStyle %>" target="_blank" title="<%=Articles[i].Title.Trim() %>"><%=ToStr(Articles[i].Title.Trim(), TitleLength)%></a></li>
        <%} %>
    </ul>
</div>
