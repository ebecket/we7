<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetDetail" %>
<script type="text/C#" runat="server">
    public override string ModelName
    {
        get
        {
            return "Default.People";
        }
    }

    protected override Criteria CreateEntryCriteria()
    {
        Criteria c = new Criteria(CriteriaType.None);
        c.Add(CriteriaType.Equals, "ID", ItemID);
        c.Add(CriteriaType.Equals, "State", 1);
        return c;
    }
</script>
<%if(Item["ID"].ToString() == "0") { %>
<div class="<%=CssClass %>">
    <div class="content">
        <div class="article_content">
            <table>
                <tr>
                    <td rowspan="5" class="col1">
                        <img src="<%=Item["Photo"] %>" alt="" />
                    </td>
                    <th class="col2">
                        <% string strUrl = Item["Url"].ToString();
                           if (string.IsNullOrEmpty(strUrl) != true)
                           { 
                        %>
                        <a href="<%=strUrl %>" target="_blank">
                            <%=Item["Fullname"] %></a>
                        <% }
                           else
                           {
                        %><%=Item["Fullname"] %>
                        <% }
                        %>
                    </th>
                    <td>
                        <%=Item["Title"] %>
                        <%
                            if (string.IsNullOrEmpty(strUrl) != true)
                            { 
                        %>
                        <span><a href="<%=strUrl %>" target="_blank">个人主页</a></span>
                        <% }
                        %>
                    </td>
                </tr>
                <tr>
                    <th>
                        办公室
                    </th>
                    <td>
                        <%=Item["Office"] %>
                    </td>
                </tr>
                <tr>
                    <th>
                        办公时间
                    </th>
                    <td>
                        <%=Item["OfficeTime"] %>
                    </td>
                </tr>
                <tr>
                    <th>
                        电子邮件
                    </th>
                    <td>
                        <%=Item["Email"]%>
                    </td>
                </tr>
                <tr>
                    <th>
                        研究领域
                    </th>
                    <td>
                        <%=Item["Field"]%>
                    </td>
                </tr>
                <%if (!string.IsNullOrEmpty(Item["Intro"].ToString()))
                  { %>
                <tr>
                    <th colspan="3">
                        个人简介
                    </th>
                </tr>
                <tr>
                    <td colspan="3">
                        <%=Item["Intro"]%>
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
                    <span>上一位：</span><a target="_self" href="<%=GetUrl(PreviousItem["ID"]) %>" title="<%=PreviousItem["Fullname"]%>">
                        <%=ToStr(PreviousItem["Fullname"], 30)%></a>
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
                    <span>下一位：</span><a target="_self" href="<%=GetUrl(NextItem["ID"]) %>" title="<%=NextItem["Fullname"] %>">
                        <%=ToStr(NextItem["Fullname"], 30)%></a>
                    <%}
                        else
                        { %>
                    <span></span>
                    <%}%>
                </li>
            </ul>
        </div>
    </div>
    <h2>
    </h2>
</div>
<%}%>