<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/theme/classic/ContentNoMenu.Master"
    CodeBehind="CategoryEdit.aspx.cs" Inherits="We7.CMS.Web.Admin.CategoryEdit" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <h2 class="title">
        <asp:Image ID="LogImage" runat="server" ImageUrl="~/admin/Images/icon_settings.png" />
        <asp:Label ID="TitleLabel2" runat="server" Text="添加类别数据项">
        </asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="为指定类另数据数据项。">
            </asp:Label>
        </span>
    </h2>
    <div id="position">
        <a href="CatTypeMgr.aspx">自定义类别</a>><a href="CategoryList.aspx?typeId=<%=TypeID %>"><%=TypeName%></a>><asp:Literal ID="TitleLabel" runat="server"
            Text="数据项"></asp:Literal></div>
    <div id="DIV1">
        <div id="conbox">
            <dl>
                <dt>»<asp:Literal ID="TitleLabel1" runat="server" Text="类型添加" /><br />
                    <img src="/admin/images/bulb.gif" align="absmiddle" /><label class="block_info">定义新的类型结构。类型结构以树的方式树存您的数据关系。</label>
                    <div style="border-top: solid 1px #e0e0e0; width: 760px; font-size: 1px">
                    </div>
                    <dl>
                        <dd style="padding: 0px;">
                            <WEC:MessagePanel runat="Server" ID="Messages">
                            </WEC:MessagePanel>
                            <table id="personalForm" cellpadding="0" cellspacing="1" style="width: 700px" border="0">
                                <tr id="trParentCategory" runat="server">
                                    <td class="formTitle" style="width: 60px; text-align:left;">
                                        <asp:Label ID="lblParentCategory" runat="server" Text="上级分类:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlParentCategory" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formTitle" style="width: 60px; vertical-align: middle; text-align:left;">
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
                                    <td class="formTitle" style="width: 60px; vertical-align: middle; text-align:left;">
                                        <asp:Label ID="Label1" runat="server" Text="标识符:"></asp:Label>
                                    </td>
                                    <td colspan="3" class="formValue">
                                        <asp:TextBox ID="txtKey" runat="server" Width="101px"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="rfvKey" runat="server" Text="*" Display="Dynamic" ControlToValidate="txtKey"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                                ID="revKey" runat="server" ErrorMessage="请输入1至20位字母或数字" ControlToValidate="txtKey"
                                                Display="Dynamic" ValidationExpression="^[0-9a-zA-Z]{1,20}$"></asp:RegularExpressionValidator><label
                                                    visible="false" id="KeyCheckLable" style="color: Red;" runat="server">关键字重复</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formTitle" style="width: 60px; vertical-align: middle; text-align:left;">
                                        <asp:Label ID="Label2" runat="server" Text="选项:"></asp:Label>
                                    </td>
                                    <td colspan="3" class="formValue">
                                        <asp:CheckBoxList ID="chkOptions" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"></asp:CheckBoxList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formTitle" style="width: 60px; vertical-align: middle; text-align:left;">
                                        <asp:Label ID="Label3" runat="server" Text="排序:"></asp:Label>
                                    </td>
                                    <td colspan="3" class="formValue">
                                        <asp:TextBox ID="txtIndex" runat="server" Width="50px" Text="0"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formTitle" style="width: 60px; vertical-align: middle; text-align:left;">
                                        <asp:Label ID="Label5" runat="server" Text="描述:"></asp:Label>
                                    </td>
                                    <td colspan="3" class="formValue">
                                        <asp:TextBox TextMode="MultiLine" ID="txtDesc" runat="server" Width="300px" Height="70px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button runat="server" Text="　保存　" CssClass="ArrowButton" ID="SaveLinkbutton"
                                            OnClick="SaveLinkbutton_Click" />
                                        &nbsp;&nbsp;<input value="　返回　" type="button" class="ArrowButton" onclick="location.href='CategoryList.aspx?typeId=<%=TypeID %>'" />
                                    </td>
                                </tr>
                            </table>
                        </dd>
                    </dl>
                </dt>
            </dl>
</asp:Content>
