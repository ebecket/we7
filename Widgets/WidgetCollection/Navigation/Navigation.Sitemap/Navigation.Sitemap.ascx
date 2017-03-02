<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Navigation.Sitemap.cs"
    Inherits="We7.CMS.Web.Widgets.Navigation_Sitemap" %>
<script type="text/C#" runat="server">
    [ControlDescription(Desc = "Navigation_Sitemap")]
    string MetaData;
</script>
<div class="<%=CssClass %>">
    <div class="top">
        <span class="l"></span><span class="r"></span><strong>站点地图</strong>
    </div>
    <div class="border">
        <div class="content">
            <ul>
                <%foreach (Channel channel in TopChannels)
                  {
                      if (channel.FullUrl.Contains("sitemap")) continue;                      
                %>
                <li><a href="<%=channel.FullUrl %>">
                    <%=channel.Name%></a>
                    <%if (channel.HaveSon)
                      { %>
                    <ul>
                        <%foreach (Channel sub in channel.SubChannels)
                          {%>
                        <li><a href="<%=sub.FullUrl %>">
                            <%=sub.Name%></a></li>
                        <%} %>
                    </ul>
                    <div class="auto">
                    </div>
                    <%} %>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
    <div class="bottom">
        <span class="l"></span><span class="r"></span>
    </div>
</div>
