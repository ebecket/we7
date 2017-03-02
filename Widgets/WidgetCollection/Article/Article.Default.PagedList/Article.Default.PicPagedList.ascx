<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.Default.PagedList.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Default_PagedList" %>
<div class="<%=CssClass %>">
    <h1>
        <%
            if (Channel != null && !string.IsNullOrEmpty(Channel.FullPath))
            {
                string[] arr = Channel.FullPath.Trim('/').Split('/');
                for (int i = 0; i < arr.Length - 1; i++)
                {
        %>
        <span class="title title_arr unselected"><a class="txt" href="javascript:void(0);">
            <%=arr[i]%></a><em class="arrow-right"></em></span>
        <%
                }                            
        %>
        <span class="title"><a class="txt" href="javascript:void(0);">
            <%=Channel.Name%></a>
            <%if (arr.Length == 1)
              { %><em class="arrow"></em><%} %>
        </span>
        <%}
            else
            { %>
        <span class="title"><a class="txt" href="javascript:void(0);">
            <%=(!string.IsNullOrEmpty(KeyWord) ? ("搜索：" + KeyWord) : "")%></a> </span>
        <%} %>
    </h1>
    <ul>
        <% for (int i = 0; i < Articles.Count; i++)
           { %>
        <li <%=(i == 0 ? "class='first'" : "")%>>
            <div class="img">
                <a href="<%=Articles[i].Url %>" target="_blank">
                    <img src="<%=Articles[i].GetTagThumbnail(ThumbnailTag)%>"
                        alt="" /></a></div>
            <p class="title">
                <a href="<%=Articles[i].Url %>" target="_blank">
                    <%=ToStr(Articles[i].Title, TitleLength)%></a></p>
            <p class="summary">
                <%=ToStr(Articles[i].Summary, SummaryLength)%>
            </p>
            <div class="auto"> </div>
        </li>
        <%} %>
    </ul>
    <%=(Articles.Count <=0 ? "<div class='pager_container'>没有数据！</div>" : Pager.PagedHtml)%>
    <h2>
    </h2>
</div>
