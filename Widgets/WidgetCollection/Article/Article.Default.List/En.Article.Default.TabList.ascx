<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="En.Article.Default.TabList.cs"
    Inherits="We7.CMS.Web.Widgets.En_Article_Default_TabList" %>
<div class="<%=CssClass %>" id="<%=ID %>">
    <h1>
        <a class="more" href="<%=ChannelList.Count > 0 ? ChannelList[0].FullUrl : "javascript:void(0);" %>">
            More</a>
        <%
            for (int i = 0; i < ChannelList.Count; i++)
            {
                Channel channel = ChannelList[i];
        %>
        <span class="title"><a href="#<%=ID + i %>" class="txt" url="<%=channel.FullUrl %>">
            <%=channel.Name%></a><em class="arrow"></em></span>
        <%} %>
    </h1>
    <%
        for (int i = 0; i < ChannelList.Count; i++)
        {
            Channel channel = ChannelList[i];
            IList<Article> articles = ChannelList[i].Articles;          
    %>
    <div id="<%=ID + i %>">
        <ul>
            <%
            int count = articles.Count;
            if (articles[0].IsImage == 1 && articles.Count == PageSize)
                count = count - 3;
                
            for (int j = 0; j < count; j++)
            {
                if (j == 0 && articles[0].IsImage == 1)
                { %>
            <li class="first">
                <div class="img">
                    <a href="<%=articles[0].Url %>" title="<%=articles[0].Title.Trim() %>">
                        <img src="<%=articles[0].GetTagThumbnail(ThumbnailTag) %>" alt="" /></a></div>
                <p class="title">
                    <a href="<%=articles[0].Url %>" title="<%=articles[0].Title.Trim() %>">
                        <%=ToStr(articles[0].Title.Trim(), TitleLength)%></a>
                </p>
                <p class="summary">
                    <%=ToStr(articles[0].Summary, SummaryLength)%>
                    <span>
                        <%= ToEnglishDateTime(articles[0].Updated)%></span></p>
                <div class="auto">
                </div>
            </li>
            <%}
                else
                { %>
            <li <%=(j == 0 ? "class='first'" : "")%>><em class="dot"></em><span <%=(articles[j].IsShow == 1 ? "class='top'" : "")%>>
                <%=ToEnglishDateTime(articles[j].Updated)%></span><a href="<%=articles[j].Url %>"
                    <%=(articles[j].IsShow == 1 ? "class='top'" : "")%> title="<%=articles[j].Title %>"
                    target="_blank"><%=ToStr(articles[j].Title, TitleLength)%></a></li>
            <%}
            }%>
        </ul>
        <a class="more more_with" href="<%=channel.FullUrl %>">More</a>
    </div>
    <%} %>
</div>
<script type="text/javascript">
    $("#<%=ID %>").tabs({ onSelected: function (div, tab) { $("#<%=ID %> .more").attr("href", tab.find(".txt").attr("url")) } });
</script>
