<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StatisticsUserDetailControl.ascx.cs" Inherits="We7.CMS.Web.Admin.StatisticsUserDetailControl" %>

<h3>
    �ÿ���ϸ��Ϣ</h3>
<table>
   <tr>
    <th style="width:20%">��Ŀ</th>
    <th style="width:443px">����</th>
    </tr>
  <tr>
    <td style="width:20%">�����ߣ�</td>
    <td style="width:443px"><asp:Label ID="lblVisitor" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>��һ�η��ʣ�</td>
    <td ><asp:Label ID="lblVisitDate" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>ע��ʱ�䣺</td>
    <td><asp:Label ID="lblLogoutDate" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>������IP��</td>
    <td><asp:Label ID="lblVisitorIP" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>����ҳ������</td>
    <td><asp:Label ID="lblVisitCount" runat="server"></asp:Label></td>
  </tr>
   <tr>
    <td>����ʱ�䣺</td>
    <td><asp:Label ID="OnlineTimeLabel" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>��������ڵ�ַ��</td>
    <td><asp:Label ID="UrlLabel" runat="server"></asp:Label></td>
  </tr>
   <tr>
    <td>��·��ַ��</td>
    <td><asp:Label ID="HttpRefererLabel" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>ʹ�ò���ϵͳ��</td>
    <td><asp:Label ID="PlatformLabel" runat="server"></asp:Label></td>
  </tr>
   <tr>
    <td>ʹ���������</td>
    <td><asp:Label ID="BrowserLabel" runat="server"></asp:Label></td>
  </tr>
  <tr>
    <td>ʹ�÷ֱ��ʣ�</td>
    <td><asp:Label ID="ScreenLabel" runat="server"></asp:Label></td>
  </tr>
</table>