<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Article.Default.SlideList.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Default_SlideList" %>
<div id="slide" class="<%=CssClass%> slideshow-wrapper">
    <div class="preloader">
    </div>
    <ul data-orbit>
        <% 
                int i = 0;
                foreach (Article article in Articles)
                {
                    bool noLink = string.IsNullOrEmpty(article.Content.Trim()) && article.ContentType != Convert.ToInt32(TypeOfArticle.LinkArticle);
        %>
        <li <%=i==0 ? " class='first-child'" : "" %>><a href="<%=noLink ? "javascript:void(0);" : article.Url %>" target="<%=noLink ? "" : "_blank" %>">
            <img src="<%=article.GetTagThumbnail(ThumbnailTag)%>" alt="<%=article.Title %>" /></a>
            <div class="orbit-caption">
                <p>
                    <%=ToStr(article.Title,TitleLength) %></p>
            </div>
        </li>
        <%i++;
            } 
        %>
    </ul>
</div>
<script type="text/javascript">
    $(document).foundation('orbit', { animation: 'fade', bullets: false, timer: true, slide_number: false, resume_on_mouseout: true, timer_speed: 5000 });
</script>
