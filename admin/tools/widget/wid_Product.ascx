<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wid_Product.ascx.cs"
    Inherits="We7.CMS.Web.Admin.tools.widget.wid_Product" %>
<div class="widget movable collapsable removable  closeconfirm" id="widget-product">
    <div class="widget-header">
        <strong>推荐商品</strong>
    </div>
    <div class="widget-content">
        <div class="inside">
            <asp:Repeater ID="rpProducts" runat="server">
                <HeaderTemplate>
                   <%-- <table cellpadding="0" cellspacing="0" border="0" style="table-layout:fixed; word-break: break-all; overflow:hidden;">
                        <tr>--%>
                    <div class="wrap_div">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="sub_div">
                        <dl>
                            <dt><a href='<%# Eval("PageUrl") %>' class="shopLink" target="_blank">
                                <img src='<%#Eval("Thumbnail") %>' tile='<%#Eval("Name") %>' width="100" height="100" />
                            </a></dt>
                            <dd>
                                <ul class="line20">
                                    <li><b>名称:</b> <a href='<%#Eval("PageUrl") %>' class="shopLink" target="_blank">
                                        <%# GetChopString(Eval("Name").ToString(), 8, "...")%></a> </li>
                                    <li>
                                        <b>价格：</b><%# Eval("Price") %>
                                    </li>
                                    <li>
                                        <b>销量：</b><%# Eval("Sales") %>
                                    </li>
                                    <li>
                                        <b>人气：</b><%# Eval("Point") %>
                                    </li>
                                    <li><b>评分：</b>
                                        <%# GetLevelString(Eval("Level").ToString())%>
                                    </li>
                                </ul>
                            </dd>
                        </dl>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                    <%--</tr> </table>--%>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>
<div style="clear: both;">
</div>
