<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Article.PicList.cs" Inherits="We7.CMS.Web.Widgets.Article_PicList" %>

<script type="text/C#" runat="server">
    [ControlDescription("Article_PicList")]
    string MetaData;
</script>

<div class="<%=CssClass %>">
    <div class="top">
        <span class="l"></span><span class="r"></span><span class="more"><a href="<%=Channel.FullUrl %>">
        </a></span><strong>
            <%=Channel.Name %></strong>
    </div>
    <div class="border">
        <div class="content">
            <strong>
                <%=Articles != null && Articles.Count > 0 ? (!string.IsNullOrEmpty(Articles[0].Tags) ? Articles[0].Tags.Replace("'", "") : "") : ""%></strong>
            <ul>
                <% foreach (Article article in Articles)
                   { %>
                <li>
                    <div class="thumb"><a href="<%=article.Url %>" target="_blank">
                        <img src="<%=article.Updated < new DateTime(2012, 10, 29, 10, 0, 0) ? article.Thumbnail : article.GetTagThumbnail("head")%>" alt="" /></a></div>
                    <div class="intro">
                        <h3>
                            <a href="<%=article.Url %>" target="_blank">
                                <%=ToStr(article.Title, 80)%></a></h3>
                        <p>
                            <%=ToStr(article.Summary, 120)%></p>
                        <span><a href="<%=article.Url %>" target="_blank">详细>></a></span>
                    </div>
                </li>
                <%} %>
            </ul>
        </div>
    </div>
    <div class="bottom">
        <span class="l"></span><span class="r"></span>
    </div>
</div>
