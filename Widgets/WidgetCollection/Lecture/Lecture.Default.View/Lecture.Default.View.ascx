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
                        主讲人：
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
                        主讲人简介：
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
                        主持人：
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
                        简介：
                    </th>
                    <td>
                        <%=FixUrl(Item["Description"].ToString()) %>
                    </td>
                </tr>
                <%} %>
                <tr>
                    <th>
                        时间：
                    </th>
                    <td>
                        <%=Item["StartTime"] %>
                    </td>
                </tr>
                <tr>
                    <th>
                        地点：
                    </th>
                    <td>
                        <%=Item["Address"] %>
                    </td>
                </tr>
				<%if (!string.IsNullOrEmpty(Item["Term"].ToString()))
                  { %>
                <tr>
                    <th>
                        期数：
                    </th>
                    <td>
                        <%=Item["Term"] %>
                    </td>
                </tr>
                <%}if (!string.IsNullOrEmpty(Item["Organizer"].ToString()))
                  { %>
                <tr>
                    <th>
                        主办单位：
                    </th>
                    <td>
                        <%=Item["Organizer"] %>
                    </td>
                </tr>
                <%}
                  if (!string.IsNullOrEmpty(Item["Organizer2"].ToString()))
                  { %>
                <tr>
                    <th>
                        承办单位：
                    </th>
                    <td>
                        <%=Item["Organizer2"] %>
                    </td>
                </tr>
                <%}
                  if (!string.IsNullOrEmpty(Item["Type"].ToString()))
                  { %>
                <tr>
                    <th>
                        类型：
                    </th>
                    <td>
                        <%=Item["Type"]%>
                    </td>
                </tr>
                <%} 
                  if (!string.IsNullOrEmpty(Item["Url"].ToString()))
                  { %>
                <tr>
                    <th>
                        专题网站：
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
                    <span>上一个：</span><a target="_self" href="<%=GetUrl(PreviousItem["ID"]) %>" title="<%=PreviousItem["Title"]%>">
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
                    <span>下一个：</span><a target="_self" href="<%=GetUrl(NextItem["ID"]) %>" title="<%=NextItem["Title"] %>">
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
