<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.En.PagedList.cs"
    Inherits="We7.CMS.Web.Widgets.Article_En_PagedList" %>
<div class="<%=CssClass %>" id="<%=ID %>">
    <h1>
        <%
            if (Channel != null && !string.IsNullOrEmpty(Channel.FullPath))
            {
                string[] arr = Channel.FullPath.Trim('/').Split('/');
                for (int i = 1; i < arr.Length - 1; i++)
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
        <li <%=(i == 0 ? "class='first'" : "")%>><em class="arrow"></em><span <%=(Articles[i].IsShow == 1 ? "class='top'" : "")%>>
            <%=ToDateStr(Articles[i].Updated, DateFormat)%></span><a href="<%=Articles[i].Url %>"
                <%=(Articles[i].IsShow == 1 ? "class='top'" : "")%> target="_blank" title="<%=(Articles[i].Title.Length * 2 > TitleLength ? Articles[i].Title : "")  %>"><%=ToStr(Articles[i].Title, TitleLength)%></a></li>
        <%} %>
    </ul>
    <%=(Articles.Count <= 0 ? "<div class='pager_container'>TBD.</div>" : Pager.PagedHtml)%>   
</div>
