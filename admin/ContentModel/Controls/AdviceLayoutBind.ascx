<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdviceLayoutBind.ascx.cs"
    Inherits="We7.CMS.Web.Admin.ContentModel.Controls.AdviceLayoutBind" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<WEC:MessagePanel ID="Msg" runat="server" Width="900px">
</WEC:MessagePanel>
<div>
    <img src="/admin/images/bulb.gif" align="absmiddle" />
    <label class="block_info">
        <asp:Literal runat="server" ID="InfoLiteral" Text="布局绑定用于指定控件的前台录入，后台录入以及预览功能的数据布局方式"></asp:Literal></label>
</div>
<br />
<div class="clear">
</div>
<div>
    <div id="conbox">
        <dl>
            <dt>»生成布局控件<br>
                <dd>
                    <div>
                        <asp:Button ID="btnGenarate" runat="server" Text="生成布局控件" CssClass="Btn" OnClick="btnGenarate_Click" />
                    </div>
                </dd>
            </dt>
        </dl>
    </div>
    <div id="conbox">
        <dl>
            <dt>»绑定布局<br>
                <dd>
                    <div>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="120">
                                    前台录入控件：
                                </td>
                                <td>
                                    <asp:DropDownList Width="150px" ID="ddlEditor" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlEditor_SelectedIndexChanged" 
                                        style="height: 22px">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlEditorCss" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td width="120">
                                    后台显示控件：
                                </td>
                                <td>
                                    <asp:DropDownList Width="150px" ID="ddlAdminViewer" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlAdminViewer_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlAdminViewerCss" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="bttnAdminSave" CssClass="Btn" runat="server" Text="保存" OnClick="bttnAdminSave_Click" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                </dd>
            </dt>
        </dl>
    </div>
</div>
