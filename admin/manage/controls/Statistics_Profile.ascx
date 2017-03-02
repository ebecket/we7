<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Statistics_Profile.ascx.cs" Inherits="We7.CMS.Web.Admin.Statistics_Profile" %>
<%@ Register Src="visitecountercontrol.ascx" TagName="visitecountercontrol" TagPrefix="wec" %>

    <div>
        <table align="center" bgcolor="#cccccc" cellpadding="10" cellspacing="1" width="92%">
            <tr>
                <td bgcolor="white" class="interval_12">
                    <p>
                        <font color="#666666">■</font> 浏览量：页面总访问量，同一访客的每次访问均被记录 &nbsp;&nbsp;<br />
                        <font color="#cc0000">■</font> 访客数：网站独立IP访问量，24小时内相同IP地址只被计算1次
                    </p>
                </td>
            </tr>
        </table>
        <br />
      <wec:visitecountercontrol id="VisiteCounterControl_01" runat="server" maincssclass="One" customcssclass="" OnlineVisitors="当前在线人数{0}" averagedayvisitors="平均每日访客数{0}" yestodayvisitors="昨日访客数{0}" dayvisitors="今日访客数{0}" monthvisitors="本月访客数{0}" yearvisitors="本年访客数{0}" totalvisitors="总访客数{0}" totalpageview="总浏览量{0}次"></wec:visitecountercontrol>
    </div>