﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="We7.CMS.UI.Widget.WidgetPagedList" %>
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
        o.Add(new Order("Fullname", OrderMode.Asc));      
        o.Add(new Order("ID", OrderMode.Desc));
        return o;
    }
</script>
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
            <%=Channel.Name%></a><%if (arr.Length == 1) { %><em class="arrow"></em><%} %>
        </span>
        <%} %>
    </h1>
    <ul>
        <% foreach (DataRow Item in Items)
           { %>
        <li>
            <table>
                <tr>
                    <td rowspan="6" class="col1">
                        <img src="<%=Item["Photo"] %>" alt="" />
                    </td>
                    <th class="col2">
                        姓名
                    </th>
                    <td>
                        <%=Item["Fullname"] %>
                    </td>
                </tr>
                <tr>
                    <th>
                        职位
                    </th>
                    <td>
                        <%=Item["Position"]%>
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
                        工作职责
                    </th>
                    <td>
                        <%=Item["Duty"]%>
                    </td>
                </tr>                
                <tr>
                    <th>
                        联系电话
                    </th>
                    <td>
                        <%=Item["Phone"]%>
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
            </table>
        </li>
        <%} %>
    </ul>
    <%=(Items.Count <= 0 ? "<div class='pager_container'>没有数据！</div>" : Pager.PagedHtml)%>
    <h2>
    </h2>
</div>
