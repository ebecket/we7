<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Article.PicList.cs" Inherits="We7.CMS.Web.Widgets.Article_PicList" %>

<script type="text/C#" runat="server">
    [ControlDescription("Article_PicList2")]
    string MetaData;

    private class ArticleComparer : IComparer<Article>
    {
        public int Compare(Article x, Article y)
        {
            return -x.Title.CompareTo(y.Title);
        }
    }
</script>

<div class="<%=CssClass %>">
    <div class="top">
        <span class="l"></span><span class="r"></span><span class="more"><a href="<%=Channel.FullUrl %>">
        </a></span><strong>
            <%=Channel.Name %></strong>
    </div>
    <div class="border">
        <div class="content">
            <ul>
                <%
                    Articles.Sort(new ArticleComparer());
                    int i = 0;
                    foreach (Article article in Articles)
                    { %>
                <li<%if (i == 0) { %> class="first"<%} %>>
                    <div class="thumb">
                        <a href="<%=article.Url %>" target="_blank">
                            <img src="<%=article.Updated < new DateTime(2012, 10, 29, 10, 0, 0) ? article.Thumbnail : article.GetTagThumbnail("magazine")%>" alt="" /></a></div>
                    <div class="intro">
                        <h3>
                            <a href="<%=article.Url %>" target="_blank">
                                <%=ToStr(article.Title, 30)%></a></h3>
                    </div>
                </li>
                <%
                    i++;
                   } %>
            </ul>
        </div>
    </div>
    <div class="bottom">
        <span class="l"></span><span class="r"></span>
    </div>
</div>
