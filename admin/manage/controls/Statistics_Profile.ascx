<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Statistics_Profile.ascx.cs" Inherits="We7.CMS.Web.Admin.Statistics_Profile" %>
<%@ Register Src="visitecountercontrol.ascx" TagName="visitecountercontrol" TagPrefix="wec" %>

    <div>
        <table align="center" bgcolor="#cccccc" cellpadding="10" cellspacing="1" width="92%">
            <tr>
                <td bgcolor="white" class="interval_12">
                    <p>
                        <font color="#666666">��</font> �������ҳ���ܷ�������ͬһ�ÿ͵�ÿ�η��ʾ�����¼ &nbsp;&nbsp;<br />
                        <font color="#cc0000">��</font> �ÿ�������վ����IP��������24Сʱ����ͬIP��ַֻ������1��
                    </p>
                </td>
            </tr>
        </table>
        <br />
      <wec:visitecountercontrol id="VisiteCounterControl_01" runat="server" maincssclass="One" customcssclass="" OnlineVisitors="��ǰ��������{0}" averagedayvisitors="ƽ��ÿ�շÿ���{0}" yestodayvisitors="���շÿ���{0}" dayvisitors="���շÿ���{0}" monthvisitors="���·ÿ���{0}" yearvisitors="����ÿ���{0}" totalvisitors="�ܷÿ���{0}" totalpageview="�������{0}��"></wec:visitecountercontrol>
    </div>