<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModelControl.ascx.cs"
    Inherits="We7.CMS.Web.Admin.ContentModel.Controls.ModelControl" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<WEC:MessagePanel ID="Msg" runat="server">
</WEC:MessagePanel>

<script type="text/javascript">
function checkAll(id,el)
{
   var checked=el.checked;
   $(id+" input").each(function(){
     this.checked=checked;
   });
}
</script>

<div>
    <img src="/admin/images/bulb.gif" align="absmiddle" />
    <label class="block_info">
        <asp:Literal runat="server" ID="InfoLiteral" Text="控件管理用于生成的列表控件与详细控件，并对其所用字段进行管理。"></asp:Literal></label>
</div>
<br />
<div class="clear">
</div>
<div>
    <div id="conbox">
        <dl>
            <dt>»生成前台控件<br>
                <dd>
                    <div>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td style="font-weight:bold;">
                                    列表控件显示字段<input type="checkbox" onclick="checkAll('#<%=chkListFields.ClientID %>',this)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="chkListFields" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold;">
                                    详细信息控件显示字段<input type="checkbox" onclick="checkAll('#<%=chkDetailsFields.ClientID %>',this)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="chkDetailsFields" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="bttnGenerate" CssClass="Btn" runat="server" Text="生成前台控件" OnClick="bttnGenerate_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </dd>
            </dt>
        </dl>
    </div>
    <div id="Div1">
        <dl>
            <dt>»生成前台部件<br>
                <dd>
                    <div>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td style="font-weight:bold;">
                                    列表部件显示字段<input type="checkbox" onclick="checkAll('#<%=chklstWidgetList.ClientID %>',this)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="chklstWidgetList" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold;">
                                    详细信息控件显示字段<input type="checkbox" onclick="checkAll('#<%=chklstWidgetView.ClientID %>',this)" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBoxList ID="chklstWidgetView" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="bttnGenerateWidget" CssClass="Btn" runat="server" Text="生成前台部件" OnClick="bttnGenerateWidget_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </dd>
            </dt>
        </dl>
    </div>
</div>
