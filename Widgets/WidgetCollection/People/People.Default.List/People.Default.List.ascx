<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetList" %>
<script type="text/C#" runat="server">
    public override string ModelName
    {
        get
        {
            return "Default.People";
        }
    }
</script>
<div class="<%=CssClass %>">
    <h1>
        <a class="more" href="<%=Channel.FullUrl %>">More</a> <span class="title"><a class="txt"
            href="<%=Channel.FullUrl %>">
            <%=Channel.Name %></a><em class="arrow"></em></span>
    </h1>
    <ul>
        <% foreach (DataRow Item in Items)
           { %>
        <li><a target="_self" href="<%=GetUrl(Item["ID"]) %>">
            <%=Item["OwnerID"] %>
            <%=Item["Fullname"] %>
            <%=Item["Gendar"] %>
            <%=Item["Title"] %>
            <%=Item["Position"] %>
            <%=Item["Office"] %>
            <%=Item["OfficeTime"] %>
            <%=Item["Phone"] %>
            <%=Item["Mobil"] %>
            <%=Item["Email"] %>
            <%=Item["Duty"] %>
            <%=Item["Field"] %>
            <%=Item["Photo"] %>
            <%=ToDateStr(Item["Updated"],DateFormat) %> </li>
        <%} %>
    </ul>
</div>
