<%@ Page Language="C#" MasterPageFile="~/admin/theme/classic/content.Master" AutoEventWireup="true"
    CodeBehind="StrategyDetail.aspx.cs" Inherits="We7.CMS.Web.Admin.StrategyDetail" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls"
    TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="/Admin/theme/classic/css/article.css" media="screen" />
    <script language="vbscript" type="text/vbscript">
        function toAsc(str)
                toAsc = hex(asc(str))
        end function
    </script>
    <script src="../Ajax/Prototype/prototype.js"></script>
    <script src="../Ajax/IPStrategyCheck.js"></script>
    <script src="../cgi-bin/pinyin.js" type="text/javascript"></script>
    <script type="text/javascript">
        var gname = "<%=TempName %>";
        var gkey = "<%=TempKey %>";
        var isEdit = eval("<%=IsEdit %>".toLowerCase());

        function setKey() {
            var name = document.getElementById("<%=txtName.ClientID %>").value;
            var key = document.getElementById("<%=txtKey.ClientID %>");

            name = name.replace(/\s*/g, "");
            if (name.length == 0) {
                key.value = "";
                document.getElementById("<%=rfvKey.ClientID %>").style.display = "";
            }
            else {
                var py = new pinyin();
                py = py.toPinyinFirst(name);
                if (py.length > 4)
                    py = py.substr(0, 4);
                key.value = py;

                document.getElementById("<%=rfvKey.ClientID %>").style.display = "none";
                document.getElementById("<%=revKey.ClientID %>").style.display = "none";
            }
            checkRepeat();
        }

        function checkRepeat() {
            var name = document.getElementById("<%=txtName.ClientID %>").value;
            var key = document.getElementById("<%=txtKey.ClientID %>").value;
            var result = false;
            if (isEdit) {
                if (gkey == key.replace(/\s*/g, "") && gname == name.replace(/\s*/g, "")) {
                    result = false;
                }
                else if (gkey == key.replace(/\s*/g, "")) {
                    result = checkName(name, document.getElementById("NameCheckLable"));
                }
                else if (gname == name.replace(/\s*/g, "")) {
                    result = checkKey(key, document.getElementById("KeyCheckLable"));
                }
                else {
                    result = checkKey(key, document.getElementById("KeyCheckLable"));
                    result = checkName2(name, document.getElementById("NameCheckLable")) || result;
                }
            }
            else {
                result = checkKey(key, document.getElementById("KeyCheckLable"));
                result = checkName2(name, document.getElementById("NameCheckLable")) || result;
            }
            return result;
        }

        function checkRepeat2() {
            var name = document.getElementById("<%=txtName.ClientID %>").value;
            var key = document.getElementById("<%=txtKey.ClientID %>").value;
            var result = false;
            if (isEdit) {
                if (gkey == key.replace(/\s*/g, "") && gname == name.replace(/\s*/g, "")) {
                    result = false;
                }
                else if (gkey == key.replace(/\s*/g, "")) {
                    result = checkName2(name, document.getElementById("NameCheckLable"));
                }
                else if (gname == name.replace(/\s*/g, "")) {
                    result = checkKey2(key, document.getElementById("KeyCheckLable"));
                }
                else {
                    result = checkKey2(key, document.getElementById("KeyCheckLable"));
                    result = checkName2(name, document.getElementById("NameCheckLable")) || result;
                }
            }
            else {
                result = checkKey2(key, document.getElementById("KeyCheckLable"));
                result = checkName2(name, document.getElementById("NameCheckLable")) || result;
            }
            return result;
        }
    </script>

    <h2 class="title">
        <asp:Image ID="LogImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="TitleLabel2" runat="server" Text="IP策略管理">
        </asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="对信任IP与非法IP进行配置从而形成策略。根据文章，栏目，常规中所选中的策略对系统所允许的IP进行限制。">
            </asp:Label>
        </span>
    </h2>
    <div id="position">
        <a href="StrateList.aspx">设置</a>><a href="StrateList.aspx">IP策略管理</a>>><asp:Literal ID="TitleLabel" runat="server" Text="IP策略修改"></asp:Literal></div>
    <div id="DIV1">
        <div id="conbox">
            <dl>
                <dt>»<asp:Literal ID="TitleLabel1" runat="server" Text="IP策略修改" /><br />
                    <img src="/admin/images/bulb.gif" align="absmiddle" /><label class="block_info">IP段输入格式为单个IP或IP段。如："192.168.0.0.1"或"192.168.0.1-192.168.0.2"</label>
                    <div style="border-top:solid 1px #e0e0e0; width:750px; font-size:1px"></div>
                    <dl>
                        <dd style="padding:0px">
                            <WEC:MessagePanel runat="Server" ID="Messages">
                            </WEC:MessagePanel>
                            <table id="personalForm" cellpadding="0" cellspacing="1" style="width: 700px"
                                border="0">
                                <tr>
                                    <td class="formTitle" style="width:150px">
                                        <asp:Label ID="ConfigNameLabel" runat="server" Text="策略名称:"></asp:Label>
                                    </td>
                                    <td colspan="3" class="formValue">
                                        <asp:TextBox ID="txtName" onchange="setKey()" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="rfvName" Display="Dynamic" runat="server" ErrorMessage="不能为空" ControlToValidate="txtName"
                                            Text="*"></asp:RequiredFieldValidator><label id="NameCheckLable" style="color: Red;
                                                display: none">名称重复</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formTitle">
                                        <asp:Label ID="Label1" runat="server" Text="关键字:"></asp:Label>
                                    </td>
                                    <td colspan="3" class="formValue">
                                        <asp:TextBox ID="txtKey" runat="server" Width="101px" onchange="checkRepeat()"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="rfvKey" runat="server" Text="*" Display="Dynamic" ControlToValidate="txtKey"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                                ID="revKey" runat="server" ErrorMessage="不能超过四个字符" ControlToValidate="txtKey"
                                                Display="Dynamic" ValidationExpression="^[0-9a-zA-Z]{1,4}$"></asp:RegularExpressionValidator><label
                                                    id="KeyCheckLable" style="color: Red; display: none">关键字重复</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formTitle">
                                        <asp:Label ID="Label5" runat="server" Text="描述:"></asp:Label>
                                    </td>
                                    <td colspan="3" class="formValue">
                                        <asp:TextBox ID="txtDesc" runat="server" Width="450px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formTitle" class="formValue">
                                        <asp:Label ID="Label2" runat="server" Text="启用:"></asp:Label>
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButton ID="rdEnable" runat="server" Text="是" GroupName="QY" Checked="true" />
                                        <asp:RadioButton ID="rdDisable" runat="server" Text="否" GroupName="QY" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formTitle">
                                        <asp:Label ID="Label3" runat="server" Text="信任IP段:"></asp:Label>
                                    </td>
                                    <td class="formValue">
                                        <asp:TextBox ID="txtAllowIPs" runat="server" Columns="50" Rows="20" TextMode="MultiLine"
                                            Width="250px" Height="142px" Style="margin: 0"></asp:TextBox>
                                    </td>
                                    <td class="formTitle">
                                        <asp:Label ID="Label4" runat="server" Text="非法IP段:"></asp:Label>
                                    </td>
                                    <td  class="formValue">
                                        <asp:TextBox ID="txtDenyIPs" runat="server" Columns="50" Rows="20" TextMode="MultiLine"
                                            Width="250px" Height="142px" Style="margin: 0"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <div><br />
                                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" Text="　保存　" CssClass="ArrowButton" ID="SaveLinkbutton" OnClientClick="return !checkRepeat2();" OnClick="SaveLinkbutton_Click" />
                                &nbsp;&nbsp;<input value="　返回　" type="button" class="ArrowButton"  onclick="location.href='StrateList.aspx'" />
                            </div>
                        </dd>
                    </dl>
                </dt>
            </dl>
</asp:Content>
