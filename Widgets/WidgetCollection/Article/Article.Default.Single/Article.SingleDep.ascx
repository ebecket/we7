<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.Single.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Single" %>
<div class="<%=CssClass %>">
    <div class="top">
        <span class="l"></span><span class="r"></span><strong>
            <%= Channel!=null ? Channel.Name: "" %></strong>
    </div>
    <div class="border">
        <div class="content">
            <%if (Channels != null && Channels.Count > 0)
              {%>
            <div class="content_nav">
                <table>
                    <tr>
                        <%
                            int i = 0;
                            foreach (Channel channel in Channels)
                            {
                        %>
                        <td>
                            <a href="<%=channel.FullUrl %>" <%=Request.RawUrl.Contains(channel.FullUrl) ? "class='on'" : ""%>>
                                <%=channel.Name %></a>
                        </td>
                        <%i++;
                          if (i % 4 == 0 && i != Channels.Count)
                          { %>
                    </tr>
                    <tr>
                        <%} %>
                        <%
                            }
                            int j = 4 - i % 4;
                            if (j < 4)
                            {
                                for (int k = 1; k <= j; k++)
                                { 
                        %>
                        <td>
                            &nbsp;
                        </td>
                        <%}
                            }
                        %>
                    </tr>
                </table>
            </div>
            <%} %>
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
    <div class="bottom">
        <span class="l"></span><span class="r"></span>
    </div>
</div>
