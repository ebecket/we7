<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.Default.View.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Default_View" %>
<script type="text/javascript" src="/Widgets/Themes/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="/Widgets/Themes/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="/Widgets/Themes/fancybox/jquery.fancybox-1.3.4.css" />
<script type="text/C#" runat="server">
    [Children]
    public ControlPager Pager = new ControlPager();    
</script>
<script type="text/javascript">
    $(function () {
        $(".album a").fancybox({
            'transitionIn': 'none',
            'transitionOut': 'none',
            'titlePosition': 'over',
            'titleFormat': function (title, currentArray, currentIndex, currentOpts) {
                return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
            }
        });
    });
</script>
<div class="<%=CssClass %>" id="<%=ID %>">
    <div class="content">
        <h1>
            <%=ThisArticle.Title%></h1>
        <div class="article_info">
            <span>栏目：</span><%=Channel.FullPath.Trim('/')%>
            <span>发布时间：</span>
            <%=ToDateStr(ThisArticle.Updated, "yyyy年MM月dd日 hh:mm")%>
            <span>点击数：</span><%=ThisArticle.Clicks %>
        </div>
        <div class="article_content">
            <%=ThisArticle.Content %>
            <%
                string[] photos = string.IsNullOrEmpty(ThisArticle.Photos) ? new string[0] : ThisArticle.Photos.Split('|');
                Pager.RecordCount = photos.Length;
                int pageIndex = Pager.PageIndex, startIndex, pageItemsCount;
                We7.Framework.Util.Utils.BuidlPagerParam(Pager.RecordCount, Pager.PageSize, ref pageIndex, out startIndex, out pageItemsCount);                
            %>
            <div class="album">
                <%
                    int i = 0;
                    foreach (string photo in photos)
                    {
                        i++;
                        if (i <= startIndex || i > startIndex + pageItemsCount) continue;                        
                %>
                <a href="<%=photo%>" title="" rel="group">
                    <img src="<%=photo.Substring(0, photo.LastIndexOf(".")) + "_S" + photo.Substring(photo.LastIndexOf(".")) %>"
                        alt="" /></a>
                <%} %>
                <div class="auto-height">
                </div>
            </div>
            <%=Pager.PagedHtml%>
        </div>
        <div class="article_page">
            <ul>
                <%
                    if (PreviousArticle != null)
                    {
                %>
                <li><a target="_self" href="<%=PreviousArticle.Url %>" title="<%=PreviousArticle.Title %>">
                    上一相册：<%=ToStr(PreviousArticle.Title, 50)%></a> </li>
                <%}
                    else
                    { %>
                <%}%><%
                         if (NextArticle != null)
                         {
                %>
                <li class="next"><a target="_self" href="<%=NextArticle.Url %>" title="<%=NextArticle.Title %>">
                    下一相册：<%=ToStr(NextArticle.Title, 50)%></a> </li>
                <%}
                         else
                         { %>
                <%}%>
            </ul>
        </div>
        <%if (RelevantArticles != null && RelevantArticles.Count > 0)
          {%>
        <div class="article_about">
            <h2>
                相关文章</h2>
            <ul>
                <%
              foreach (Article article in RelevantArticles)
              {                    
                %>
                <li><span>
                    <%=ToDateStr(article.Updated, "yyyy-MM-dd") %></span> <a href="<%=article.Url %>">
                        <%=ToStr(article.Title, 100)%></a> </li>
                <%} %>
            </ul>
        </div>
        <%} %>
        <div class="auto-height">
        </div>
    </div>
</div>
<script type="text/javascript">
    $(".article_content img").load(function () {
        var img = $(this);
        if (img.width() > 800)
            img.width(800);
    });
    $(function () {
        $(".article_content img").each(function () {
            var img = $(this);
            if (img.width() > 800)
                img.width(800);
        });
    });
</script>
