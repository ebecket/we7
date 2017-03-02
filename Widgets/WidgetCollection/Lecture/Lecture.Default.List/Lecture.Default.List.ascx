<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetList" %>
<script type="text/C#" runat="server">
    public override string ModelName
    {
        get
        {
            return "Default.Lecture";
        }
    }
    [Parameter(Title = "标题长度", Type = "Number", DefaultValue = "30")]
    public int TitleLength = 30;
    
    protected override Criteria CreateCriteria()
    {
        Criteria c = base.CreateCriteria();
        c.Add(CriteriaType.MoreThan, "DueTime", DateTime.Now);
        return c;
    } 
	
	protected override List<Order> CreateOrders()
    {
        List<Order> o = new List<Order>();
        o.Add(new Order("DueTime", OrderMode.Asc));
        return o;
    }
</script>
<div class="<%=CssClass %>">
    <h1>
        <a class="more" href="<%=Channel.FullUrl %>">More</a> <span class="title"><a class="txt"
            href="<%=Channel.FullUrl %>">
            <%=Channel.Name %></a><em class="arrow"></em></span>
    </h1>
    <ul>
        <% 
            for (int i = 0; i < Items.Count; i++)
            {
        %>
        <li>
            <p>
                <a href="<%=GetUrl(Items[i]["ID"]) %>" target="_blank" title="<%=(!string.IsNullOrEmpty(Items[i]["Speaker"].ToString()) ? (Items[i]["Speaker"] + "：") : "") + Items[i]["Title"] %>">
                    <%=ToStr(Items[i]["Title"], 60)%></a></p>
            <p>
                <%=!string.IsNullOrEmpty(Items[i]["Speaker"].ToString()) ? ToStr("报告人：" + Items[i]["Speaker"], TitleLength) + "<br />" : ""%>
                <%=ToStr("时间：" + Items[i]["StartTime"], TitleLength)%>  
                <%=ToStr("地点：" + Items[i]["Address"], TitleLength)%>
            </p>
        </li>
        <% }%>
    </ul>
</div>
