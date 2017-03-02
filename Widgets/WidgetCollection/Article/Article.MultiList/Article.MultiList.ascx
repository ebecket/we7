<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Article.MultiList.cs"
    Inherits="We7.CMS.Web.Widgets.Article_MultiList" %>
<%
    string type = Request["type"] != null ? Request["type"].ToString() : "";
    if (type == "all")
    {
%>
<style type="text/css">
    #header_wrap, #menu_wrap, #main_right, #footer_wrap
    {
        display: none;
    }
    #main_wrap
    {
        background: none;
        margin: 0 auto;
        width: auto;
    }
    #main
    {
        background: none;
        margin-left: 0px;
        width: auto;
    }
    
    #main_inner
    {
        width: auto;
        background: none;
    }
</style>
<%}
%>
<script type="text/C#" runat="server">
    [ControlDescription("Article_PicList")]
    string MetaData;
</script>
<div class="<%=CssClass %>">
    <h1>
        <span class="title title_arr">
            <%=Channel.Name %></span></h1>
    <div class="border">
        <div class="content">
            <%if (Channels != null && Channels.Count > 0)
              {%>
            <div class="content_nav" style="display: none;">
                <table>
                    <tr>
                        <%
                  int i = 0;
                  foreach (Channel channel in Channels)
                  {
                        %>
                        <td>
                            <a href="#<%=channel.ChannelName %>">
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
            <%
                  i = 0;
                  foreach (Channel channel in Channels)
                  {
                      i++;
                      if (GetShow(type, channel.Tags))
                      {
            %>
            <a name="<%=channel.ChannelName %>"></a>
            <div class="level_content<%=i % 2 == 1 ? " level_clear" : " " %> faqContent">
                <h3>
                    <em class="arrow"></em>
                    <%=channel.Name %>
                    <%if (channel.Channels.Count > PageSize)
                      { %>
                    <span class="more"><a href="<%=Channel.FullUrl %>"></a>
                        <%} %>
                    </span>
                </h3>
                <ul>
                    <% 
                          if (channel.Channels.Count == 0)
                          {
                    %>
                    <li><a href="<%=channel.FullUrl %>" target="_blank" title="<%=channel.Name %>">
                        <%=ToStr(channel.Name, TitleLength)%></a></li>
                    <%}
                          else
                          {
                              foreach (Channel ch in channel.Channels)
                              {
                                  Boolean blShow = GetShow(type, ch.Tags);
                                  if (blShow)
                                  {
                    %>
                    <li>
                        <h4>
                            <em class="dot"></em>
                            <%=ToStr(ch.Name, TitleLength)%><span class="more"><a href="<%=ToUrl(type,ch.FullUrl) %>" target="_blank">More</a></span></h4>
                        <%if (ch.Articles.Count != 0)
                          {%><ul>
                              <%    
                              foreach (Article item in ch.Articles)
                              {
                              %><li><em class="dot"></em><a href="<%=ToUrl(type,item.Url) %>" target="_blank" title="<%=item.Title %>">
                                  <%=ToStr(item.Title, TitleLength)%></a></li>
                              <%}
                              %>
                          </ul>
                    </li>
                    <% }  %>
                    <%
                                  }
                              }
                          }%>
                    <li>
                        <ul>
                            <% 
                        
                            %>
                        </ul>
                    </li>
                </ul>
            </div>
            <%
                
                      }
                  } %>
            <div class="auto">
            </div>
            <%} %>
        </div>
    </div>
    <div class="bottom">
        <span class="l"></span><span class="r"></span>
    </div>
</div>
