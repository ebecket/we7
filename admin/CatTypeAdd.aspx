<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/theme/classic/content.Master"
    CodeBehind="CatTypeAdd.aspx.cs" Inherits="We7.CMS.Web.Admin.CatTypeAdd" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
<link rel="stylesheet" type="text/css" href="/Admin/theme/classic/css/article.css" media="screen" />  
    <h2 class="title">
        <asp:Image ID="LogImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="TitleLabel2" runat="server" Text="自定义类别">
        </asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="系统允许自定义多种类别，以实现多类别的管理。">
            </asp:Label>
        </span>
    </h2>
    <div id="position">
        <a href="CatTypeMgr.aspx">自定义类别</a>><asp:Literal ID="TitleLabel" runat="server" Text="类别"></asp:Literal></div>
    <div id="DIV1">
        <div id="conbox">
            <dl>
                <dt>»<asp:Literal ID="TitleLabel1" runat="server" Text="类别添加" /><br />
                    <img src="/admin/images/bulb.gif" align="absmiddle" /><label class="block_info">定义新的类别根目录。</label>
                    <div style="border-top: solid 1px #e0e0e0; width: 750px; font-size: 1px">
                    </div>
                    <dl>
                        <dd style="padding: 0px;">
                            <WEC:MessagePanel runat="Server" ID="Messages">
                            </WEC:MessagePanel>
                            <table id="personalForm" cellpadding="0" cellspacing="1" style="width: 700px" border="0">
                                <tr>
                                    <td class="formTitle" style="width: 73px;">
                                        <asp:Label ID="ConfigNameLabel" runat="server" Text="名称:"></asp:Label>
                                    </td>
                                    <td colspan="3" class="formValue">
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="rfvName" Display="Dynamic" runat="server" ErrorMessage="不能为空" ControlToValidate="txtName"
                                            Text="*"></asp:RequiredFieldValidator><label id="NameCheckLable" style="color: Red;"
                                                visible="false" runat="server">名称重复</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formTitle" style="width: 73px;">
                                        <asp:Label ID="Label1" runat="server" Text="标识符:"></asp:Label>
                                    </td>
                                    <td colspan="3" class="formValue">
                                        <asp:TextBox ID="txtKey" runat="server" Width="101px"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="rfvKey" runat="server" Text="*" Display="Dynamic" ControlToValidate="txtKey"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                                ID="revKey" runat="server" ErrorMessage="请输入1至20位字母或数字" ControlToValidate="txtKey"
                                                Display="Dynamic" ValidationExpression="^[0-9a-zA-Z]{1,20}$"></asp:RegularExpressionValidator><label
                                                    id="KeyCheckLable" style="color: Red;" visible="false" runat="server">标识符重复</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formTitle" style="width: 100px;">
                                        <asp:Label ID="Label2" runat="server" Text="附加配置信息:"></asp:Label>
                                    </td>
                                    <td colspan="3" class="formValue" valign="bottom">
                                        <asp:DropDownList ID="ddlOptions" runat="server">
                                        </asp:DropDownList>&nbsp;为应用程序提供附加选项
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formTitle" style="width: 73px;">
                                        <asp:Label ID="Label5" runat="server" Text="描述:"></asp:Label>
                                    </td>
                                    <td colspan="3" class="formValue">
                                        <asp:TextBox TextMode="MultiLine" ID="txtDesc" runat="server" Width="300px" Height="70px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" Text="　保存　" CssClass="ArrowButton"
                                    ID="SaveLinkbutton" OnClick="SaveLinkbutton_Click" />
                                &nbsp;&nbsp;<input value="　返回　" type="button" class="ArrowButton" onclick="location.href='CatTypeMgr.aspx'" />
                            </div>
                        </dd>
                    </dl>
                </dt>
            </dl>
</asp:Content>
