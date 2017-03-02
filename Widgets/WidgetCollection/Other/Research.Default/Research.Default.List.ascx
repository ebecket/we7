<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Research.Default.List.cs"
    Inherits="We7.CMS.Web.Widgets.Research_Default_List" %>
<%if(Items != null && Items.Count > 0){ %>
<div class="<%=CssClass %>">
    <h1>
        <a class="more" href="/academics/journal/" target="_blank">More</a>
        <span class="title"><a class="txt" href="javascript:void(0);">发表论文</a><a class="arrow"></a></span>
    </h1>
    <ul>
        <% 
            int i = 0;
            foreach (Research re in Items)
            {
        %>
        <li <%=i == 0 ? "class='first'" : ""%>><em class="dot"></em><a target="_blank" title="<%=re.Authors + ": " + re.Title%>" href="http://121.192.176.75/index.php?ser_id=2&p_id=<%=re.PId %>">
            <span>
                <%=ToStr(re.Authors + ": " + re.Title, TitleLength)%></span></a></li>
        <% i++;
            } %>
    </ul>
</div>
<%} %>
