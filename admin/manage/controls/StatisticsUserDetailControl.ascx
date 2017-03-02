<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StatisticsUserDetailControl.ascx.cs" Inherits="We7.CMS.Web.Admin.StatisticsUserDetailControl" %>

<h3>
    访客详细信息</h3>
<table>
   <tr>
    <th style="width:20%">项目</th>
    <th style="width:443px">内容</th>
    </tr>
  <tr>
    <td style="width:20%">访问者：</td>
    <td style="width:443px"><asp:Label ID="lblVisitor" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>第一次访问：</td>
    <td ><asp:Label ID="lblVisitDate" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>注销时间：</td>
    <td><asp:Label ID="lblLogoutDate" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>访问者IP：</td>
    <td><asp:Label ID="lblVisitorIP" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>访问页面数：</td>
    <td><asp:Label ID="lblVisitCount" runat="server"></asp:Label></td>
  </tr>
   <tr>
    <td>在线时间：</td>
    <td><asp:Label ID="OnlineTimeLabel" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>访问者入口地址：</td>
    <td><asp:Label ID="UrlLabel" runat="server"></asp:Label></td>
  </tr>
   <tr>
    <td>来路地址：</td>
    <td><asp:Label ID="HttpRefererLabel" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>使用操作系统：</td>
    <td><asp:Label ID="PlatformLabel" runat="server"></asp:Label></td>
  </tr>
   <tr>
    <td>使用浏览器：</td>
    <td><asp:Label ID="BrowserLabel" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>使用分辨率：</td>
    <td><asp:Label ID="ScreenLabel" runat="server"></asp:Label></td>
  </tr>
</table>