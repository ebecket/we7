<%@ Page Language="C#" ValidateRequest="false"  AutoEventWireup="true" Codebehind="CssDetail.aspx.cs" Inherits="We7.CMS.Web.Admin.cssEditor.CssDetail" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls"
    TagPrefix="WEC" %>
<%@ Register Assembly="We7.CMS.UI" Namespace="We7.CMS.Controls" TagPrefix="WEC" %>
<asp:Content ID="We7Content" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <script type="text/javascript">
function onCancelHyperLinkClick()
{
    window.close();
} 

function onSaveButtonClick() {
    document.getElementById("<%=SaveButton.ClientID %>").click();
}
 
    </script>
    <style>
    .CodeMirror-line-numbers {
    margin: 4px 4px 4px 0;
    padding: 0;
    text-align: right;
    width: 40px;
    font-family: monospace;
    font-size: 10pt;
    background: none repeat scroll 0 0 #EBEFF2;
}
.CodeMirror-wrapping
{
	border:solid 1px black;
	overflow-y: scroll;
}
    </style>
     <script src="/admin/ajax/CodeMirror/js/codemirror.js" type="text/javascript"></script>
          <h2 class="title" >
                            <asp:Image ID="LogImage" runat="server" ImageUrl="~/admin/Images/icons_look.gif" />                            
                            <asp:Label ID="TitleLabel" runat="server" Text="编辑CSS文件">
                            </asp:Label>
                            <span class="summary">
                                <asp:Label ID="SummaryLabel" runat="server" Text="创建一个新Css样式文件">
                                </asp:Label>
                            </span>
                        </h2>
                        <div class="toolbar">
                            <asp:HyperLink ID="SaveHyperLink" NavigateUrl="javascript:onSaveButtonClick();"
                                runat="server">
                                <asp:Image ID="SaveImage" runat="server" ImageUrl="~/admin/Images/icon_Save.gif" />
                                保存</asp:HyperLink>
                            <asp:HyperLink ID="ReturnHyperLink" NavigateUrl="CssList.aspx" runat="server">
                                <asp:Image ID="ReturnImage" runat="server" ImageUrl="~/admin/Images/icon_Prev.gif" />
                                返回</asp:HyperLink>
                            <br />
                        </div>
                       <WEC:MessagePanel runat="Server" ID="Messages">
                        </WEC:MessagePanel>
                    <table >
                        <tr>
                            <td>
                                <asp:Label ID="CssNameLabel" runat="server" Text="Css文件名:" Visible="false">
                                </asp:Label>
                                <asp:TextBox ID="CssNameTextBox" runat="server" Visible="false"></asp:TextBox>
                                <asp:Literal runat="Server" ID="CssFileExt" Text=".css"  Visible="false"  ></asp:Literal>
                                </td>
                        </tr>
                        <tr>
                            <td>
                               <textarea ID="CssTextBox" runat="server"  cols="50" rows="50" style="border:solid 1px #000;width:800px" ></textarea>
                            </td>
                        </tr>
                    </table>
                    <div style="display: none">
                        <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />
                        <asp:TextBox ID="OldFileTextBox" runat="server"></asp:TextBox>
                    </div>
                    
                    <script type="text/javascript">
  var editor = CodeMirror.fromTextArea('<%=CssTextBox.ClientID %>', {
    height: "400px",
    parserfile: "parsecss.js",
    lineNumbers:"true",
    stylesheet: "/admin/ajax/CodeMirror/css/csscolors.css",
    path: "/admin/ajax/CodeMirror/js/"
  });
</script>
</asp:Content>
