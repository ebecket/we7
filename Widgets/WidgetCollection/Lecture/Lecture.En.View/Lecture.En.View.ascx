<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetDetail" %>
<script type="text/C#" runat="server">
    public override string ModelName
    {
        get
        {
            return "Default.Lecture";
        }
    }
	
	public string FixUrl(string content)
    {
        if (!string.IsNullOrEmpty(content))
        {
            content = content.Replace("href=\"/Events/Upload", "href=\"http://event.wisesoe.com/Upload").Replace("href=\"/Upload", "href=\"http://event.wisesoe.com/Upload");
            content = content.Replace("src=\"/Events/Upload", "src=\"http://event.wisesoe.com/Upload").Replace("src=\"/Upload", "src=\"http://event.wisesoe.com/Upload");
        }
        return content;
    }
</script>
<div class="<%=CssClass %>">
    <h1>
        <%=Item["Title"] %></h1>
    <div class="content">
        <div class="article_content">
            <table>
                <%if (!string.IsNullOrEmpty(Item["Speaker"].ToString()))
                  { %>
                <tr>
                    <th>
                        Speaker:
                    </th>
                    <td>
                        <%=Item["Speaker"]%>
                    </td>
                </tr>
                <%}
                  if (!string.IsNullOrEmpty(Item["Intro"].ToString()))
                  { %>
                <tr>
                    <th>
                        Speaker Intro:
                    </th>
                    <td>
                        <%=FixUrl(Item["Intro"].ToString())%>
                    </td>
                </tr>
                <%}
                    if (!string.IsNullOrEmpty(Item["Anchor"].ToString()))
                    { %>
                <tr>
                    <th>
                        Host:
                    </th>
                    <td>
                        <%=Item["Anchor"]%>
                    </td>
                </tr>
                <%}
                  if (!string.IsNullOrEmpty(Item["Description"].ToString()))
                  { %>
                <tr>
                    <th>
                        Description：
                    </th>
                    <td>
                        <%=FixUrl(Item["Description"].ToString()) %>
                    </td>
                </tr>
                <%} %>
                <tr>
                    <th>
                        Time:
                    </th>
                    <td>
                        <%=Item["StartTime"] %>
                    </td>
                </tr>
                <tr>
                    <th>
                        Venue:
                    </th>
                    <td>
                        <%=Item["Address"] %>
                    </td>
                </tr>
                <%if (!string.IsNullOrEmpty(Item["Organizer"].ToString()))
                  { %>
                <tr>
                    <th>
                        Organizer:
                    </th>
                    <td>
                        <%=Item["Organizer"] %>
                    </td>
                </tr>
                <%}
                  if (!string.IsNullOrEmpty(Item["Url"].ToString()))
                  { %>
                <tr>
                    <th>
                        Site：
                    </th>
                    <td>
                        <a href="<%=Item["Url"]%>" target="_blank"><%=Item["Url"]%></a>
                    </td>
                </tr>
                <%} %>              
            </table>
        </div>
        <div class="article_page">
            <ul>
                <li>
                    <%
                        if (PreviousItem != null)
                        {
                    %>
                    <span>Prev：</span><a target="_self" href="<%=GetUrl(PreviousItem["ID"]) %>" title="<%=PreviousItem["Title"]%>">
                        <%=ToStr(PreviousItem["Title"], 30)%></a>
                    <%}
                        else
                        { %>
                    <span></span>
                    <%}%>
                </li>
                <li class="next">
                    <%
                        if (NextItem != null)
                        {
                    %>
                    <span>Next：</span><a target="_self" href="<%=GetUrl(NextItem["ID"]) %>" title="<%=NextItem["Title"] %>">
                        <%=ToStr(NextItem["Title"], 30)%></a>
                    <%}
                        else
                        { %>
                    <span></span>
                    <%}%>
                </li>
            </ul>
        </div>
    </div>
    <h2></h2>
</div>
