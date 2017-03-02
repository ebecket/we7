<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.Default.Single.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Default_Single" %>
<div class="<%=CssClass %>">
    <h1>
        <%
            if (Channel != null && !string.IsNullOrEmpty(Channel.FullPath))
            {
                string[] arr = Channel.FullPath.Trim('/').Split('/');
                for (int i = 0; i < arr.Length - 1; i++)
                {
        %>
        <span class="title title_arr unselected t<%=i %>"><a class="txt" href="javascript:void(0);">
            <%=arr[i]%></a><em class="arrow-right"></em></span>
        <%
                }                            
        %>
        <span class="title"><a class="txt" href="javascript:void(0);">
            <%=Channel.Name%></a>
            <%if (arr.Length == 1)
              { %><em class="arrow"></em><%} %>
        </span>
        <%} %>
    </h1>
    <div class="content">
        <%=Article.Content %>
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
                    <%=attachment.FileName%>(<%=attachment.FileSizeText %>)</a></li>
                <%} %>
            </ul>
        </div>
        <%} %>
    </div>
</div> 