<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetPagedList" %>
<script type="text/C#" runat="server">
    public override string ModelName
    {
        get
        {
            return "Default.Lecture";
        }
    }
    [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "20")]
    public int TitleLength = 20;

    protected override List<Order> CreateOrders()
    {
        List<Order> o = new List<Order>();
        o.Add(new Order("DueTime", OrderMode.Desc));
        o.Add(new Order("IsShow", OrderMode.Desc));
        o.Add(new Order("ID", OrderMode.Desc));
        return o;
    }
</script>
<div class="<%=CssClass %>">
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
            <%=Channel.Name%></a><%if (arr.Length == 1)
                                   { %><em class="arrow"></em><%} %>
        </span>
        <%} %>
    </h1>
    <ul>
        <% 
            for (int i = 0; i < Items.Count; i++)
            {
                string title = (!string.IsNullOrEmpty(Items[i]["Speaker"].ToString()) ? Items[i]["Speaker"] + "：" : "") + Items[i]["Title"];
                DateTime dueTime;
                string css = string.Empty;
                bool result = DateTime.TryParse(Items[i]["DueTime"].ToString(), out dueTime);
                if (result && dueTime > DateTime.Now)
                {
                    css = "class='top'";
                }
        %>
        <li <%=(i == 0 ? "class='first'" : "")%>><em class="arrow"></em><a href="<%=GetUrl(Items[i]["ID"]) %>"
            target="_blank" title="<%=(title.Length * 2 > TitleLength ? title : "") %>"
            <%=css %>><%if (string.IsNullOrEmpty(Items[i]["Field"].ToString()) != true)
	                    {%>
                        [<%=ToStr(Items[i]["Field"].ToString())%>]
                        <% } %>
            <%=ToStr(title, TitleLength)%></a>
            <%= string.IsNullOrEmpty(Items[i]["Url"].ToString()) != true ? ("<a href='" + Items[i]["Url"] + "' class='go_site' target='_blank'>Website</a>") : ""%>
            <br />
            <label <%=css %>>
                Time:<%=Items[i]["StartTime"]%></label>
            <label <%=css %>>
                Venue:<%=Items[i]["Address"]%></label>
        </li>
        <%} %>
    </ul>;
     <%=(Items.Count <= 0 ? "<div class='pager_container'>TBD.</div>" : Pager.PagedHtml)%>
    <h2>
    </h2>
</div>
