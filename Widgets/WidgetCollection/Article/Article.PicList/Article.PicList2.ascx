<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Article.PicList.cs" Inherits="We7.CMS.Web.Widgets.Article_PicList" %>

<script type="text/C#" runat="server">
    [ControlDescription("Article_PicList2")]
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
            <ul>
                <%
                    int i = 0;
                    foreach (Article article in Articles2)
                   { %>
                <li<%if (i == 0) { %> class="first"<%} %>>
                    <div class="thumb"><a href="<%=article.Url %>" target="_blank">
                        <img src="<%=article.Thumbnail %>" alt="" /></a></div>
                    <div class="intro">
                        <h3>
                            <a href="<%=article.Url %>" target="_blank">
                                <%=ToStr(article.Title, 80)%></a> <span><a href="<%=article.Url %>" target="_blank">详细>></a></span></h3>                        
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
