<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Advice_Option.ascx.cs" Inherits="We7.CMS.Web.Admin.controls.Advice_Option" %>
  <%@ Register TagPrefix="WEC" Namespace="We7.CMS.Controls" Assembly="We7.CMS.UI" %>
<script type="text/javascript" language="javascript" src="../cgi-bin/setday.js"></script>
    <WEC:MessagePanel ID="Messages" runat="server">
    </WEC:MessagePanel>
<div id="conbox">
    <dl>
        <dt>»反馈模型基本属性<br />
            <img src="/admin/images/bulb.gif" align="absmiddle" />
            <label class="block_info">
                此处对反馈模型基本属性进行修改与编辑！</label>
        </dt>
        <dd style="width: 650px">
            <div style="float: left;">
                <table class="personalForm">
                    <tr>
                        <td class="style1">
                            模型名称：
                        </td>
                        <td class="formValue">
                            <asp:TextBox ID="AdviceNameText" runat="server" Columns="35"  Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            模型创建人：
                        </td>
                        <td class="formValue">
                            <asp:TextBox ID="AdviceCreatedText" runat="server" TextMode="singleLine" MaxLength="3"
                                Columns="35" Text=""  Width="250px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            创建时间：
                        </td>
                        <td class="formValue">
                            <input id="StartTimeText" runat="server" type="text" onfocus="setday(this)" readonly="readOnly"
                                style="width: 250px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" valign="top" >
                            备注：
                        </td>
                        <td class="formValue">
                            <asp:TextBox ID="RemarkText" runat="server" TextMode="MultiLine" Columns="28" 
                                Height="100px" Width="250px"></asp:TextBox>
                            <br />
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                        </td>
                        <td>
                           <input class="Btn" id="SubmitButton" runat="server" type="submit" value="保存当前信息"
                                onserverclick="SubmitButton_Click" />
                        </td>
                    </tr>
                </table> 
            </div>
        </dd>
    </dl>
</div>
