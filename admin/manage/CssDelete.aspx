<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CssDelete.aspx.cs" Inherits="We7.CMS.Web.Admin.cssEditor.CssDelete" %>

<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <script type="text/javascript">
function onDeleteButtonClick() {
    document.getElementById("<%=DeleteButton.ClientID %>").click();
}
 
    </script>
                    <asp:Panel runat="Server" ID="ContentPanel">
                        <div id="breadcrumb">
                            <h2>
                                <asp:Image ID="LogoImage" runat="server" ImageUrl="~/admin/Images/icon_warning.gif" />
                                <span>ɾ��Css��ʽ�ļ� ��</span>
                                <asp:Label ID="NameLabel" runat="server" Text="">
                                </asp:Label>
                                <span>����</span>
                            </h2>
                            <p>
                                �˲�������ϵͳ�г���ɾ����Css��ʽ�ļ�.
                            </p>
                            <span><span>��� �� </span>
                                <asp:HyperLink ID="DeleteHyperLink" runat="server" NavigateUrl="javascript:onDeleteButtonClick();">
                                    <asp:Image ID="DeleteImage" runat="server" ImageUrl="~/admin/Images/icon_delete.gif" />
                                    ����ɾ��</asp:HyperLink>
                            </span><span>�� ���ɾ��������</span>
                            <div style="display: none">
                                <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
                            </div>
                        </div>
                    </asp:Panel>
</asp:Content>
