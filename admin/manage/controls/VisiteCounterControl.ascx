<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisiteCounterControl.ascx.cs" Inherits="We7.CMS.Web.Admin.VisiteCounterControl" %>
<table>
    <tr>
        <th style="width: 156px">
            项目
        </th>
        <th>
            内容
        </th>
        <th>
            &nbsp;
        </th>
    </tr>
    <tr>
        <td style="width: 156px" >
            当前在线人数：</td>
        <td>
           <%=Counter.OnlineVisitors%>
        </td>
    </tr>
    <tr>
        <td style="width: 156px">
            今日浏览量(访客数)：</td>
        <td>
           <%=Counter.DayPageview%>  <font color="#cc0000">( <%=Counter.DayVisitors%> )</font>
        </td>
    </tr>
    <tr>
        <td style="width: 156px">
            昨日浏览量(访客数)：</td>
        <td>
           <%=Counter.YestodayPageview%> <font color="#cc0000">( <%=Counter.YestodayVisitors%> )</font>
        </td>
    </tr>
    <tr>
        <td style="width: 156px">
            本月浏览量(访客数)：</td>
        <td>
           <%=Counter.MonthPageview%> <font color="#cc0000">( <%=Counter.MonthVisitors%> )</font>
        </td>
    </tr>
     <tr>
        <td style="width: 156px">
            本年浏览量(访客数)：</td>
        <td>
           <%=Counter.YearPageview%> <font color="#cc0000">( <%=Counter.YearVisitors%> )</font>
        </td>
    </tr>
     <tr>
        <td style="width: 156px">
            总浏览量(访客数)：</td> 
        <td>
           <%=Counter.TotalPageView%> <font color="#cc0000">( <%=Counter.TotalVisitors%> )</font>
        </td>
    </tr>
     <tr>
        <td style="width: 156px">
            每日平均浏览量(访客数)：</td> 
        <td>
           <%=Counter.AverageDayPageview%> <font color="#cc0000">( <%=Counter.AverageDayVisitors%> )</font>
        </td>
    </tr>
    </table>