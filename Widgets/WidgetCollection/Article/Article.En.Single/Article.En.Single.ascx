<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.En.Single.cs"
    Inherits="We7.CMS.Web.Widgets.Article_En_Single" %>
<div class="<%=CssClass %>">
    <h1>
        <span class="title"><a class="txt" href="<%=Channel.FullUrl %>">
            <%=Channel.Name %></a><em class="arrow"></em></span>
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
