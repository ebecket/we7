<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.Default.TabList.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Default_TabList" %>
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
            <% for (int j = 0; j < articles.Count; j++)
               { %>
            <li <%=(j == 0 ? "class='first'" : "")%>><em class="dot"></em><span <%=(articles[j].IsShow == 1 ? "class='top'" : "")%>>
                <%=ToDateStr(articles[j].Updated, DateFormat)%></span><a href="<%=articles[j].Url %>"
                    <%=(articles[j].IsShow == 1 ? "class='top'" : "")%> title="<%=articles[j].Title %>"
                    target="_blank"><%=ToStr(articles[j].Title, TitleLength)%></a></li>
            <%} %>
        </ul>
        <a class="more more_with" href="<%=channel.FullUrl %>">More</a>
    </div>
    <%} %>
</div>
<script type="text/javascript">
    $("#<%=ID %>").tabs({ onSelected: function (div, tab) { $("#<%=ID %> .more").attr("href", tab.find(".txt").attr("url")) } });
</script>
