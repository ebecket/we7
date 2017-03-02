<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModuleAdd.aspx.cs" Inherits="We7.CMS.Web.Admin.ModuleAdd" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:content id="We7Content" contentplaceholderid="MyContentPlaceHolder" runat="server">
    <h2 class="title">
    <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icons_tools.gif" />
        <asp:Label ID="NameLabel" runat="server" Text="添加模块"></asp:Label>
        <span class="summary">
            <asp:Label ID="SummaryLabel" runat="server" Text="添加栏目可用模块"></asp:Label>
        </span>
    </h2>
    <p>
            <span >
                <table style="width: 400px; height:100px; border-width:0px">
                    <tr>
                        <td style="text-align: right">
                            模块名称：
                        </td>
                        <td style="width: 197px">
                            <asp:TextBox ID="txtTitle" runat="server" Columns="40" 
                                Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                                ErrorMessage="请输入模块地址" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                   
                    <tr>
                        <td style="text-align: right">
                            模块地址：
                        </td>
                        <td style="width: 197px">
                            <asp:TextBox ID="txtAddress" runat="server" Columns="40" Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress" ErrorMessage="请输入模块地址。" Display="Dynamic">*</asp:RequiredFieldValidator></td>
                    </tr>
                     <tr>
                        <td style="text-align: right">
                            参数说明：
                        </td>
                        <td style="width: 197px">
                            <asp:TextBox ID="txtParameters" runat="server" Columns="40" Width="300px"></asp:TextBox>
                            </td>
                    </tr>
                     <tr>
                        <td style="height: 19px; text-align: right">
                            描述：</td>
                        <td style="width: 197px; height: 19px">
                            <asp:TextBox ID="txtDesc" runat="server" Columns="40" Width="200px" Height="40px" TextMode="MultiLine"></asp:TextBox>
                         </td>
                    </tr>
                    <tr>
                        <td style="height: 19px; text-align: right;">
                            <asp:Button ID="bttnSave" OnClick="bttnSave_Click" runat="server" Text="保存模块" /></td>
                        <td style="width: 197px; height: 19px">
                            &nbsp;<asp:Button ID="bttnBack" CausesValidation="false" runat="server" OnClick="bttnBack_Click" Text="&nbsp;&nbsp;返回&nbsp;&nbsp;" />
                         </td>
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
            &nbsp;
            &nbsp;&nbsp;<br />
            &nbsp;</div>
</asp:content>
