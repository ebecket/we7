<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisiteCounterControl.ascx.cs" Inherits="We7.CMS.Web.Admin.VisiteCounterControl" %>
<table>
    <tr>
        <th style="width: 156px">
            ��Ŀ
        </th>
        <th>
            ����
        </th>
        <th>
            &nbsp;
        </th>
    </tr>
    <tr>
        <td style="width: 156px" >
            ��ǰ����������</td>
        <td>
           <%=Counter.OnlineVisitors%>
        </td>
    </tr>
    <tr>
        <td style="width: 156px">
            ���������(�ÿ���)��</td>
        <td>
           <%=Counter.DayPageview%>  <font color="#cc0000">( <%=Counter.DayVisitors%> )</font>
        </td>
    </tr>
    <tr>
        <td style="width: 156px">
            ���������(�ÿ���)��</td>
        <td>
           <%=Counter.YestodayPageview%> <font color="#cc0000">( <%=Counter.YestodayVisitors%> )</font>
        </td>
    </tr>
    <tr>
        <td style="width: 156px">
            ���������(�ÿ���)��</td>
        <td>
           <%=Counter.MonthPageview%> <font color="#cc0000">( <%=Counter.MonthVisitors%> )</font>
        </td>
    </tr>
     <tr>
        <td style="width: 156px">
            ���������(�ÿ���)��</td>
        <td>
           <%=Counter.YearPageview%> <font color="#cc0000">( <%=Counter.YearVisitors%> )</font>
        </td>
    </tr>
     <tr>
        <td style="width: 156px">
            �������(�ÿ���)��</td> 
        <td>
           <%=Counter.TotalPageView%> <font color="#cc0000">( <%=Counter.TotalVisitors%> )</font>
        </td>
    </tr>
     <tr>
        <td style="width: 156px">
            ÿ��ƽ�������(�ÿ���)��</td> 
        <td>
           <%=Counter.AverageDayPageview%> <font color="#cc0000">( <%=Counter.AverageDayVisitors%> )</font>
        </td>
    </tr>
    </table>