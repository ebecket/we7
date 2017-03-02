<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.En.View.cs"
    Inherits="We7.CMS.Web.Widgets.Article_En_View" %>
<div class="<%=CssClass %>">
    <h1>
        <%=ThisArticle.Title%></h1>
    <div class="content">
        <div class="article_info">
            <span>Channel:</span><%=Channel.Name%>
            <%--<span>From：</span><%=ThisArticle.Source %>--%>
            <span>Author:</span><%=ThisArticle.Author %>
            <span>Time:</span>
            <%=ToDateStr(ThisArticle.Updated, "yyyy-MM-dd hh:mm")%>
            <span>Clicks:</span><%=ThisArticle.Clicks %>
        </div>
        <div class="article_content">
            <%=ThisArticle.Content %>
            <%if (Attachments != null && Attachments.Count > 0)
              {%>
            <div class="attachment">
                Attachments：
                <ul>
                    <%                            
              foreach (Attachment attachment in Attachments)
              {
                    %>
                    <li><a href="<%=attachment.DownloadUrl %>" target="_blank">
                        <%=attachment.FileName%><%if (attachment.FileSize > 0)
                                                  { %>(<%=attachment.FileSizeText%>)<%} %></a></li>
                    <%} %>
                </ul>
            </div>
            <%} %>
        </div>
        <div class="article_page">
            <ul>
                <li>
                    <%
                        if (PreviousArticle != null)
                        {
                    %>
                    <span>Prev：</span><a target="_self" href="<%=PreviousArticle.Url %>" title="<%=PreviousArticle.Title %>">
                        <%=ToStr(PreviousArticle.Title, 30)%></a>
                    <%}
                    else
                    { %>
                    <span></span>
                    <%}%>
                </li>
                <li class="next">
                    <%
                        if (NextArticle != null)
                        {
                    %>
                    <span>Next：</span><a target="_self" href="<%=NextArticle.Url %>" title="<%=NextArticle.Title %>">
                        <%=ToStr(NextArticle.Title, 30)%></a>
                    <%}
                    else
                    { %>
                    <span></span>
                    <%}%>
                </li>
            </ul>
        </div>
        <%if (RelevantArticles != null && RelevantArticles.Count > 0)
          {%>
        <div class="article_about">
            <h2>
                Related</h2>
            <ul>
                <%
          foreach (Article article in RelevantArticles)
          {                    
                %>
                <li>
                    <%=ToDateStr(article.Updated, "yyyy-MM-dd") %>
                    <a href="<%=article.Url %>">
                        <%=ToStr(article.Title, 100)%></a> </li>
                <%} %>
            </ul>
        </div>
        <%} %>
    </div>
</div>
