<%@ Page Language="C#" AutoEventWireup="true" Codebehind="UpdatePassword.aspx.cs" Inherits="We7.CMS.Web.Admin.UpdatePassword" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <h2 class="title">
    <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_tools.gif" />
        <asp:Label ID="NameLabel" runat="server" Text="�޸�����"></asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="�޸ĵ�¼�û�����"></asp:Label>
        </span>
    </h2>
    <p>
            <span >
                <table style="width: 295px; height: 156px;border-width:0px">
                    <tr>
                        <td style="text-align: right">
                            ��¼����
                        </td>
                        <td style="width: 197px">
                            <asp:TextBox ID="LoginNameTextBox" runat="server" Columns="40" 
                                Width="165px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LoginNameTextBox"
                                ErrorMessage="�������û���">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            ���룺
                        </td>
                        <td style="width: 197px">
                            <asp:TextBox ID="PasswordTextBox" runat="server" Columns="40" TextMode="Password"
                                Width="165px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordTextBox"
                                ErrorMessage="����������롣">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="height: 19px; text-align: right">
                            �����룺</td>
                        <td style="width: 197px; height: 19px">
                            <asp:TextBox ID="NewPasswordTextBox" runat="server" Columns="40" TextMode="Password"
                                Width="165px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="NewPasswordTextBox"
                                ErrorMessage="�����������롣">*</asp:RequiredFieldValidator>
                         </td>
                    </tr>
                    <tr>
                        <td style="height: 19px; text-align: right">
                            ������һ�飺</td>
                        <td style="width: 197px; height: 19px">
                            <asp:TextBox ID="AgainPasswordTextBox" runat="server" Columns="40" TextMode="Password"
                                Width="165px"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="NewPasswordTextBox"
                                ControlToValidate="AgainPasswordTextBox" ErrorMessage="������������벻һ��!">*</asp:CompareValidator></td>
                    </tr>
                    <tr>
                        <td style="height: 19px; text-align: right">
                        </td>
                        <td style="width: 197px; height: 19px">
                            <asp:CheckBox ID="IsHashedPasswordCheckBox"  runat="server" Checked="True" />�������
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 19px; text-align: right;">
                            <asp:Button ID="UpdateButton" runat="server" OnClick="UpdateButton_Click" Text="�޸�����" /></td>
                        <td style="width: 197px; height: 19px">
                            &nbsp;<asp:Button ID="CancelButton" runat="server" OnClick="CancelButton_Click" Text="ȡ��" CausesValidation="False" /></td>
                    </tr>
                    <tr>
                        <td style="height: 42px">
                        </td>
                        <td style="width: 197px; height: 42px">
                            <asp:Label ID="MessageLabel" runat="server" ForeColor="red" Text=""></asp:Label></td>
                    </tr>
                </table>
            </span>
        </p>
        <div>
            &nbsp;<asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            &nbsp;&nbsp;<br />
            &nbsp;</div>
        <%--<div style="display: none">
            <asp:Button ID="LoginButton" runat="server" Text="Signin" OnClick="LoginButton_Click" />&nbsp;</div>--%>
</asp:Content>
