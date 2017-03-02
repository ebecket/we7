<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetPagedList" %>
<script type="text/C#" runat="server">
    public override string ModelName
    {
        get
        {
            return "Default.People";
        }
    }

    protected override List<Order> CreateOrders()
    {
        List<Order> o = new List<Order>();
        o.Add(new Order("IndexLetter", OrderMode.Asc));
        o.Add(new Order("Fullname", OrderMode.Asc));
        return o;
    }
</script>
<a name="top"></a>
<div class="<%=CssClass %>" id="<%=ID %>">
    <h1>
        <%
            if (Channel != null && !string.IsNullOrEmpty(Channel.FullPath))
            {
                string[] arr = Channel.FullPath.Trim('/').Split('/');
                for (int i = 0; i < arr.Length - 1; i++)
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
    <%
        string listBy = Request["ListBy"];
        List<string> keyValues = new List<string>();
        Dictionary<string, List<DataRow>> group = new Dictionary<string, List<DataRow>>();
        string keyField = "IndexLetter";
        if (listBy == "ResearchArea")
        {
            keyField = "ResearchArea";
        }


        foreach (DataRow Item in Items)
        {
            string key = Item[keyField].ToString();
            if (group.ContainsKey(key))
            {
                List<DataRow> rows;
                group.TryGetValue(key, out rows);
                if (rows == null) rows = new List<DataRow>();
                rows.Add(Item);
            }
            else
            {
                List<DataRow> rows = new List<DataRow>();
                rows.Add(Item);
                group.Add(key, rows);
            }
        }
    %>
    <div class="people_key">
        <%
            int j = 0;
            foreach (string key in group.Keys)
            {
        %>
        <span><a href="#key<%=j %>">
            <%=key %></a></span>
        <% j++;
            } 
        %>
    </div>
    <%  
        j = 0;
        foreach (KeyValuePair<string, List<DataRow>> kv in group)
        {                   
    %>
    <div class="people_list">
        <a name="key<%=j %>"></a>
        <h3>
            <span><%=kv.Key%></span>
            <a class="more" href="#top">Top</a>
        </h3>
        <ul>
            <% foreach (DataRow item in kv.Value)
               { %>
            <li><a href="<%=GetUrl(item["ID"]) %>" target="_blank">
                <%=item["Fullname"]%></a></li>
            <%} %>
        </ul>
        <div class="auto"> </div>
    </div>
    <%j++;
        } %>
    <h2>
    </h2>
</div>
