<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Subject_basic.ascx.cs" 
    Inherits="We7.CMS.Web.Admin.ScoreManager.Controls.Subject_basic" %>
<%@ Register TagPrefix="WEC" Namespace="We7.CMS.Controls" Assembly="We7.CMS.UI" %>

<script language="javascript" type="text/javascript">
// <!CDATA[

    function SaveButton2_onclick() {

    }

// ]]>
</script>


<WEC:MessagePanel ID="Messages" runat="server">
</WEC:MessagePanel>
<div id="conbox">
    <dl>
        <dt>»积分主题的基本信息<br />
            <img src="/admin/images/bulb.gif" align="absmiddle" alt="" /><label class="block_info">修改基本信息，可以对主题的名称，显示标题进行改变；</label>            
        </dt>
        <dd>
            <table id="subjectForm" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="formTitle">
                        主题名称
                    </td>
                    <td class="formValue">
                        <asp:TextBox ID="NameTextBox" runat="server" Columns="50" CssClass="txt"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="formTitle">
                        主题类别
                    </td>
                    <td class="formValue">
                        <asp:RadioButtonList ID="IsGradeRadios" runat="server" 
                            RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="0">积分</asp:ListItem>
                            <asp:ListItem Value="1">评分</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="formTitle">
                        主题显示名称
                    </td>
                    <td class="formValue">
                        <asp:TextBox ID="TitleTextBox" runat="server" Columns="50" CssClass="txt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="formTitle">
                        描述
                    </td>
                    <td class="formValue">
                        <asp:TextBox ID="DescTextBox" runat="server" Columns="50" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="padding-top: 15px; padding-left: 0px">
                        <input class="Btn" id="SaveButton2" runat="server" type="submit" value="保存" onserverclick="SaveButton_ServerClick" onclick="return SaveButton2_onclick()" />
                        
                        <asp:Button ID="ReturnButton2" runat="server" Text="返回" CssClass="Btn" OnClick="ReturnButton_ServerClick" />
                    </td>
                </tr>
            </table>
        </dd>
    </dl>
    </div>