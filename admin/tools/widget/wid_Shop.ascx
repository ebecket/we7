<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wid_Shop.ascx.cs" Inherits="We7.CMS.Web.Admin.tools.widget.wid_Shop" %>
<div class="widget movable collapsable removable  closeconfirm" id="widget-shop">
    <div class="widget-header">
        <strong>推荐商铺</strong>
    </div>
    <div class="widget-content">
        <div class="inside">
            <asp:Repeater ID="rpStores" runat="server">
               <HeaderTemplate>
                   <%-- <table cellpadding="0" cellspacing="0" border="0" style="table-layout:fixed; word-break: break-all; overflow:hidden;">
                        <tr>--%>
                    <div class="wrap_div">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="sub_div">
                        <dl>
                            <dt><a href='<%# Eval("Url") %>' class="shopLink" target="_blank" title='推荐理由:<%# GetClearHtml(Eval("StoreIntro").ToString()) %>'>
                                <img src='<%#Eval("Face") %>' tile='<%# GetClearHtml(Eval("StoreIntro").ToString()) %>' width="100" height="100" />
                            </a></dt>
                            <dd>
                                <ul class="line20">
                                    <li>
                                        <b>名称:</b> <a href='<%#Eval("Url") %>' class="shopLink" target="_blank" title='店铺名称:<%# Eval("StoreName")%>'>
                                            <%# GetChopString(Eval("StoreName").ToString(), 10, "...")%></a>
                                    </li>
                                    <li>
                                        <b>等级：</b><%# Eval("TechnicalLevel") %>
                                    </li>
                                    <li>
                                        <b>评分：</b><%# GetLevelString(Eval("Level").ToString())%>
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
<div style="clear:both;"></div>
