<%@ Control Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Article.Single.cs"
    Inherits="We7.CMS.Web.Widgets.Article_Single" %>
<div class="<%=CssClass %>">
    <div class="top">
        <span class="l"></span><span class="r"></span><strong>
            <%= Channel!=null ? Channel.Name: "" %></strong>
    </div>
    <div class="border">
        <div class="content">
            <script type="text/javascript" src="/_data/flowplayer-3.2.6.min.js"></script>
            <a href="/_data/video.flv" style="display: block; width: 640px; height: 480px" id="player">
            </a>
            <script type="text/javascript">
                flowplayer("player", "/_data/flowplayer-3.2.7.swf");
            </script>
            <br />
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
