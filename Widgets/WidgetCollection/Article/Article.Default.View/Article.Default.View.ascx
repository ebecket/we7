<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.Default.View.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Default_View" %>
<%
    string type = Request["type"] != null ? Request["type"].ToString() : "";
    if (type == "all")
    {
%>
<style type="text/css">
    #header_wrap, #menu_wrap, #main_right, #footer_wrap,#slide
    {
        display: none;
    }
    #main_wrap
    {
        background: none;
        margin: 0 auto;
        width: auto;
    }
    #main
    {
        background: none;
        margin-left: 0px;
        width: auto;
    }
    
    #main_inner
    {
        width: auto;
        background: none;
    }
</style>
<%}
%>
<div class="<%=CssClass %>">
    <h1>
        <%=ThisArticle.Title%></h1>
    <div class="content">
        <div class="article_info">
            <div class="i">
                <span>栏目：</span><%=Channel.Name%>
                <%--<span>来源：</span><%=ThisArticle.Source %>--%>
                <span>发布人：</span><%=GetAccountName(ThisArticle.AccountID)%>
                <span>发布时间：</span>
                <%=ToDateStr(ThisArticle.Updated, "yyyy年MM月dd日 hh:mm")%>
                <span>点击数：</span><%=ThisArticle.Clicks %>
            </div>
            <!-- Baidu Button BEGIN -->
            <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
                <span class="bds_more">分享到：</span> <a class="bds_tsina"></a><a class="bds_tqq"></a><a class="bds_renren"></a>
            </div>
            <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6880231"></script>
            <script type="text/javascript" id="bdshell_js"></script>
            <script type="text/javascript">
                document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date() / 3600000)
            </script>
            <!-- Baidu Button END -->
        </div>
        <div class="article_content">
            <%=ThisArticle.Content %>
            <%if (Attachments != null && Attachments.Count > 0)
              {%>
            <div class="attachment">
                附件：
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
                    <span>上一篇：</span><a target="_self" href="<%=ToUrl(type,PreviousArticle.Url) %>" title="<%=PreviousArticle.Title %>">
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
                    <span>下一篇：</span><a target="_self" href="<%=ToUrl(type,NextArticle.Url) %>" title="<%=NextArticle.Title %>">
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
            <h3>
                相关文章</h3>
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
    <h2>
    </h2>
</div>
